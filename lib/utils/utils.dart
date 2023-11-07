import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/main.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

final navigatorKey = GlobalKey<NavigatorState>();

class Utils {
  static final RegExp mailRegExp = RegExp(
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');

  /*
  * Date Utilities
  * */
  static String getDate(date, format) {
    return DateFormat('dd/MM/yyyy').format(format.parse(date));
  }

  static String getTime(date, format) {
    return DateFormat('HH:mm').format(format.parseUTC(date).toLocal());
  }

  static String formatMinutes(int minutes, {bool removeTrailing = false}) {
    if (minutes >= 60) {
      var d = Duration(minutes: minutes);
      List<String> parts = d.toString().split(':');
      return '${parts[0].padLeft(1, '0')} ${removeTrailing ? '' : 'h'}';
    }
    return "$minutes${removeTrailing ? '' : '\''}";
  }

  static bool timeOfDayIsBefore(TimeOfDay a, TimeOfDay b) {
    if (a.hour == b.hour) {
      if (a.minute < b.minute) {
        return true;
      }
      return false;
    }
    if (a.hour < b.hour) {
      return true;
    }
    return false;
  }

  static bool isToday(DateTime other) {
    return DateTime.now().year == other.year &&
        DateTime.now().month == other.month &&
        DateTime.now().day == other.day;
  }

  static bool isTomorrow(DateTime other) {
    return DateTime.now().year == other.year &&
        DateTime.now().month == other.month &&
        DateTime.now().day + 1 == other.day;
  }

  static bool isSameDay(DateTime date1, DateTime date2) {
    final now = date1;
    final diff = now.difference(date2).inDays;
    return diff == 0 && now.day == date2.day;
  }

  /*
  * Launcher
  * */
  static launchUrl(Uri url) async {
    if (await canLaunchUrl(url)) {
      await canLaunchUrl(url);
    } else {
      throw 'Could not launch';
    }
  }

  static launchUrlString(String url) async {
    if (await canLaunchUrlString(url)) {
      await canLaunchUrlString(url);
    } else {
      throw 'Could not launch';
    }
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

  /*
  * Sign Out
  * */
  static resetData() {}
}

extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1)}";
  }
}

extension TimeOfDayExtension on TimeOfDay {
  int compareTo(TimeOfDay other) {
    if (hour < other.hour) return -1;
    if (hour > other.hour) return 1;
    if (minute < other.minute) return -1;
    if (minute > other.minute) return 1;
    return 0;
  }
}

class Logger {
  static void log(dynamic content) {
    if (EnvironmentConfig.environment == "dev") {
      print(content.toString());
    }
  }
}
