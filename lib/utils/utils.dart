import 'package:dui/common_utils/alert.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/main.dart';
import 'package:flutter_boilerplate/utils/managers/i18n_manager/translations/generated/l10n.dart';
import 'package:get/get.dart';

final navigatorKey = GlobalKey<NavigatorState>();

class Utils {
  static bool checkName(String text) {
    if (text.length < 3) {
      Alert.showAlert(S.of(Get.context!).appName,
          S.of(Get.context!).alertInvalidName, Get.context!,
          okText: S.of(Get.context!).ok);
      return false;
    }
    return true;
  }

  static bool checkEmail(String text) {
    final regExp = RegExp(
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');

    if (!regExp.hasMatch(text)) {
      Alert.showAlert(S.of(Get.context!).appName,
          S.of(Get.context!).alertInvalidEmail, Get.context!,
          okText: S.of(Get.context!).ok);
      return false;
    }
    return true;
  }

  static bool checkPassword({
    required String password,
    String? repeatPassword,
  }) {
    // Check if has more than 9 characters and contains alphanumeric characters
    if (password.length < 10 || !password.contains(RegExp(r'[a-zA-Z0-9]'))) {
      Alert.showAlert(S.of(Get.context!).appName,
          S.of(Get.context!).alertInvalidPassword, Get.context!,
          okText: S.of(Get.context!).ok);
      return false;
    }

    if (repeatPassword != null && repeatPassword != password) {
      Alert.showAlert(S.of(Get.context!).appName,
          S.of(Get.context!).alertNotEqualsPassword, Get.context!,
          okText: S.of(Get.context!).ok);
      return false;
    }
    return true;
  }

/*
  * Analytics and Statistics Usage Management
  * */
/*static FirebaseAnalytics analytics = FirebaseAnalytics.instance;
  static FirebaseInAppMessaging fiam = FirebaseInAppMessaging.instance;

  static dynamic getAnalytics() {
    return analytics;
  }

  static dynamic getFIAM() {
    return fiam;
  }

  static logEvent(String eventName, Map<String, dynamic> params) async {
    try {
      await Utils.getAnalytics().logEvent(name: eventName, parameters: params);
    } catch (e) {
      logger("Analytics error: $e");
    }
  }*/
}

class Logger {
  static void log(dynamic content) {
    if (EnvironmentConfig.environment == "dev") {
      print(content.toString());
    }
  }
}
