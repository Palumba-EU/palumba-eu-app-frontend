import 'package:flutter/material.dart';

import 'package:palumba_eu/main.dart';


final navigatorKey = GlobalKey<NavigatorState>();

class Utils {

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
