//
//  versioncontrol.dart
//
//  Created by Alex Tarragó on 04/02/2020.
//  Copyright © 2020 Dribba GmbH. All rights reserved.
//
import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:package_info/package_info.dart';

enum ComparisonMode {
  none,
  soft,
  hard,
}

class Version {
  String? appName;
  int? version;
  ComparisonMode? comparisonMode;
  String? minSystemVersion;
  String? title;
  String? message;
  String? okButtonTitle;
  String? cancelButtonTitle;
  String? actionURL;

  bool isComplete() {
    return appName != null &&
        version != null &&
        comparisonMode != null &&
        minSystemVersion != null &&
        title != null &&
        message != null &&
        okButtonTitle != null &&
        cancelButtonTitle != null &&
        actionURL != null;
  }
}

class VersionControl {
  String? packageApiKey;
  String? packageLanguageCode = "es";
  BuildContext? packageContext;

  bool hasNewVersion = false;
  String? title = "";
  String? message = "";
  String? buttonTitle = "";
  String? buttonTwoTitle = "";
  String? actionURL = "";
  ComparisonMode? mode = ComparisonMode.none;

  VersionControl._internal();

  static final VersionControl _singleton = new VersionControl._internal();

  factory VersionControl() {
    return _singleton;
  }

  static VersionControl getInstance() {
    return new VersionControl();
  }

  Future<bool> checkVersion(BuildContext context) async {
    if (packageApiKey == null) {
      return true;
    }
    packageContext = context;

    try {
      var headers = {
        "Content-Type": "application/json",
        "x-api-key": "hCyBylqVei3oTgYtGuz3rfF4GtOc"
      };

      final response = await http
          .post(Uri.parse('https://dribbot.drib.ba/api/public/v1/app/check'),
          headers: headers,
          body: json.encode({
            "appKey": packageApiKey,
          }))
          .timeout(const Duration(seconds: 3));

      if (response.statusCode == 418) {
        return true;
      }
      if (response.statusCode != 200) {
        return true;
      }

      var result =
      VersionData.fromJson(json.decode(utf8.decode(response.bodyBytes)));

      Version? v = processData(result);
      if (v == null) {
        return true;
      }

      return compare(v);
    } catch (c) {
      return true;
    }
  }

  Version? processData(VersionData data) {
    Version remoteVersion;
    CurrentVersionConfig? versionConfig;

    if (Platform.isIOS) {
      for (CurrentVersionConfig v in data._currentVersionConfig!) {
        if (v._platform == 'ios') {
          versionConfig = v;
        }
      }
    } else {
      for (CurrentVersionConfig v in data._currentVersionConfig!) {
        if (v._platform == 'android') {
          versionConfig = v;
        }
      }
    }
    if (versionConfig == null) {
      return null;
    }

    remoteVersion = Version();
    remoteVersion.appName = data._name;
    remoteVersion.version = versionConfig._buildVersion;
    remoteVersion.minSystemVersion = versionConfig._minSystemVersion;
    remoteVersion.actionURL = versionConfig._okButtonActionURL;

    if (versionConfig._comparisonMode == 0) {
      remoteVersion.comparisonMode = ComparisonMode.none;
    } else if (versionConfig._comparisonMode == 1) {
      remoteVersion.comparisonMode = ComparisonMode.soft;
    } else if (versionConfig._comparisonMode == 2) {
      remoteVersion.comparisonMode = ComparisonMode.hard;
    } else {
      return null;
    }
    if (packageLanguageCode!.toUpperCase() == "ca".toUpperCase()) {
      remoteVersion.title = versionConfig._title!._cat;
      remoteVersion.message = versionConfig._message!._cat;
      remoteVersion.okButtonTitle = versionConfig._okButtonTitle!._cat;
      remoteVersion.cancelButtonTitle = versionConfig._cancelButtonTitle!._cat;
    } else if (packageLanguageCode!.toUpperCase() == "es".toUpperCase()) {
      remoteVersion.title = versionConfig._title!._es;
      remoteVersion.message = versionConfig._message!._es;
      remoteVersion.okButtonTitle = versionConfig._okButtonTitle!._es;
      remoteVersion.cancelButtonTitle = versionConfig._cancelButtonTitle!._es;
    } else if (packageLanguageCode!.toUpperCase() == "en".toUpperCase()) {
      remoteVersion.title = versionConfig._title!._en;
      remoteVersion.message = versionConfig._message!._en;
      remoteVersion.okButtonTitle = versionConfig._okButtonTitle!._en;
      remoteVersion.cancelButtonTitle = versionConfig._cancelButtonTitle!._en;
    } else {
      return null;
    }

    if (remoteVersion.isComplete()) {
      return remoteVersion;
    }
    return null;
  }

  Future<bool> compare(Version version) async {
    var packageInfo = await PackageInfo.fromPlatform();

    int currentVersion = int.parse(packageInfo.buildNumber);

    int storeVersion = version.version!;
    if (storeVersion > currentVersion &&
        version.comparisonMode != ComparisonMode.none) {
      hasNewVersion = true;
      title = version.title;
      message = version.message;
      buttonTitle = version.okButtonTitle;
      buttonTwoTitle = version.cancelButtonTitle;
      mode = version.comparisonMode;
      actionURL = version.actionURL;
      return true;
    }
    return true;
  }
}

class VersionData {
  String? _id;
  String? _name;
  List<CurrentVersionConfig>? _currentVersionConfig;
  String? _apiKey;
  String? _createdAt;
  String? _updatedAt;

  VersionData(
      {String? id,
        String? name,
        List<CurrentVersionConfig>? currentVersionConfig,
        String? apiKey,
        String? createdAt,
        String? updatedAt}) {
    this._id = id;
    this._name = name;
    this._currentVersionConfig = currentVersionConfig;
    this._apiKey = apiKey;
    this._createdAt = createdAt;
    this._updatedAt = updatedAt;
  }

  VersionData.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _name = json['name'];
    if (json['currentVersionConfig'] != null) {
      _currentVersionConfig = <CurrentVersionConfig>[];
      json['currentVersionConfig'].forEach((v) {
        _currentVersionConfig!.add(new CurrentVersionConfig.fromJson(v));
      });
    }
    _apiKey = json['apiKey'];
    _createdAt = json['createdAt'];
    _updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['name'] = this._name;
    if (this._currentVersionConfig != null) {
      data['currentVersionConfig'] =
          this._currentVersionConfig!.map((v) => v.toJson()).toList();
    }
    data['apiKey'] = this._apiKey;
    data['createdAt'] = this._createdAt;
    data['updatedAt'] = this._updatedAt;
    return data;
  }
}

class CurrentVersionConfig {
  Title? _title;
  Title? _message;
  String? _platform;
  int? _buildVersion;
  Title? _okButtonTitle;
  int? _comparisonMode;
  String? _minSystemVersion;
  Title? _cancelButtonTitle;
  String? _okButtonActionURL;

  CurrentVersionConfig(
      {Title? title,
        Title? message,
        String? platform,
        int? buildVersion,
        Title? okButtonTitle,
        int? comparisonMode,
        String? minSystemVersion,
        Title? cancelButtonTitle,
        String? okButtonActionURL}) {
    this._title = title;
    this._message = message;
    this._platform = platform;
    this._buildVersion = buildVersion;
    this._okButtonTitle = okButtonTitle;
    this._comparisonMode = comparisonMode;
    this._minSystemVersion = minSystemVersion;
    this._cancelButtonTitle = cancelButtonTitle;
    this._okButtonActionURL = okButtonActionURL;
  }

  CurrentVersionConfig.fromJson(Map<String, dynamic> json) {
    _title = json['title'] != null ? new Title.fromJson(json['title']) : null;
    _message =
    json['message'] != null ? new Title.fromJson(json['message']) : null;
    _platform = json['platform'];
    _buildVersion = json['buildVersion'];
    _okButtonTitle = json['okButtonTitle'] != null
        ? new Title.fromJson(json['okButtonTitle'])
        : null;
    _comparisonMode = json['comparisonMode'];
    _minSystemVersion = json['minSystemVersion'];
    _cancelButtonTitle = json['cancelButtonTitle'] != null
        ? new Title.fromJson(json['cancelButtonTitle'])
        : null;
    _okButtonActionURL = json['okButtonActionURL'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this._title != null) {
      data['title'] = this._title!.toJson();
    }
    if (this._message != null) {
      data['message'] = this._message!.toJson();
    }
    data['platform'] = this._platform;
    data['buildVersion'] = this._buildVersion;
    if (this._okButtonTitle != null) {
      data['okButtonTitle'] = this._okButtonTitle!.toJson();
    }
    data['comparisonMode'] = this._comparisonMode;
    data['minSystemVersion'] = this._minSystemVersion;
    if (this._cancelButtonTitle != null) {
      data['cancelButtonTitle'] = this._cancelButtonTitle!.toJson();
    }
    data['okButtonActionURL'] = this._okButtonActionURL;
    return data;
  }
}

class Title {
  String? _en;
  String? _es;
  String? _cat;

  Title({String? en, String? es, String? cat}) {
    this._en = en;
    this._es = es;
    this._cat = cat;
  }

  Title.fromJson(Map<String, dynamic> json) {
    _en = json['en'];
    _es = json['es'];
    _cat = json['cat'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['en'] = this._en;
    data['es'] = this._es;
    data['cat'] = this._cat;
    return data;
  }
}
