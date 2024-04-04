import 'package:flutter/material.dart';
import 'package:palumba_eu/data/model/localization.dart';

import 'package:palumba_eu/main.dart';

final navigatorKey = GlobalKey<NavigatorState>();

class Utils {
  /**
   * App Data
   */
  static List<Language>? languages;
  static List<Country>? countries;
}

class Logger {
  static void log(dynamic content) {
    if (EnvironmentConfig.environment == "dev") {
      print(content.toString());
    }
  }
}
