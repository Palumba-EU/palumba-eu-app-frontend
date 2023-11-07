/*import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../api/schema.graphql.dart';
import '../data/converters/graph_to_entity.dart';
import '../data/model/app_version.dart';

class VersionControl {
  VersionControl._internal();

  static final VersionControl _singleton = VersionControl._internal();

  factory VersionControl() {
    return _singleton;
  }

  static VersionControl getInstance() {
    return new VersionControl();
  }

  Future<bool> checkVersion(BuildContext context) async {
    try {
      final repository = Get.find<VersionControlRepository>();

      var versionResponse = await repository.getAppVersion();
      if (versionResponse.isEmpty) {
        return true;
      }
      if (Platform.isIOS) {
        versionResponse.removeWhere(
            (object) => object.platform != Enum$AppVersionPlatform.IOS);
        versionResponse = versionResponse[0];
      } else if (Platform.isAndroid) {
        versionResponse.removeWhere(
            (object) => object.platform != Enum$AppVersionPlatform.ANDROID);
      } else {
        return true;
      }

      return compare(versionResponse);
    } catch (c) {
      return true;
    }
  }

  Future<bool> compare(AppVersion version) async {
    var packageInfo = await PackageInfo.fromPlatform();

    int currentVersion = int.parse(packageInfo.buildNumber);

    int storeVersion = version.buildVersion!;
    if (storeVersion > currentVersion) {
      return await showAlertWith(
        version.title!,
        version.message!,
        version.mode!,
        version.okButtonTitle!,
        version.cancelButtonTitle!,
        version.okButtonActionURL!,
      );
    }
    return true;
  }

  Future showAlertWith(
    String title,
    String message,
    Enum$AppVersionMode updateMode,
    String okButtonTitle,
    String cancelButtonTitle,
    String actionURL,
  ) {
    if (Platform.isAndroid) {
      return showDialog(
        context: Get.context!,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              title,
            ),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Text(
                    message,
                  ),
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: Text(okButtonTitle),
                onPressed: () async {
                  if (updateMode == Enum$AppVersionMode.CAN_UPDATE) {
                    _launchURL(actionURL);
                    Navigator.of(context).pop(true);
                  } else {
                    await _launchURL(actionURL);
                    exit(0);
                  }
                },
              ),
              updateMode == Enum$AppVersionMode.CAN_UPDATE
                  ? TextButton(
                      child: Text(cancelButtonTitle),
                      onPressed: () {
                        Navigator.of(context).pop(true);
                      },
                    )
                  : Container()
            ],
          );
        },
      );
    } else {
      return updateMode == Enum$AppVersionMode.CAN_UPDATE
          ? showDialog(
              barrierDismissible: false,
              context: Get.context!,
              builder: (BuildContext context) {
                return CupertinoAlertDialog(
                  title: new Text(title),
                  content: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 4,
                      ),
                      Text(
                        message,
                      )
                    ],
                  ),
                  actions: <Widget>[
                    CupertinoDialogAction(
                      isDefaultAction: true,
                      child: Text(okButtonTitle),
                      onPressed: () {
                        _launchURL(actionURL);
                        Navigator.of(context).pop(true);
                      },
                    ),
                    CupertinoDialogAction(
                      isDefaultAction: true,
                      child: Text(cancelButtonTitle),
                      onPressed: () {
                        Navigator.of(context).pop(true);
                      },
                    )
                  ],
                );
              },
            )
          : showDialog(
              barrierDismissible: false,
              context: Get.context!,
              builder: (BuildContext context) {
                return CupertinoAlertDialog(
                  title: new Text(title),
                  content: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 4,
                      ),
                      Text(
                        message,
                      )
                    ],
                  ),
                  actions: <Widget>[
                    CupertinoDialogAction(
                      isDefaultAction: true,
                      child: Text(okButtonTitle),
                      onPressed: () async {
                        await _launchURL(actionURL);
                        await Future.delayed(const Duration(seconds: 1), () {});
                        exit(0);
                      },
                    ),
                  ],
                );
              },
            );
    }
  }

  _launchURL(String url) async {
    if (await canLaunchUrlString(url)) {
      await launchUrlString(url, mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch $url';
    }
  }
}*/
