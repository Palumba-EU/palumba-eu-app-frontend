import 'dart:async';
import 'dart:io';

import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_in_app_messaging/firebase_in_app_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bondy/main.dart';
import 'package:bondy/styles/app_theme.dart';
import 'package:bondy/utils/managers/credentials_manager.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:map_launcher/map_launcher.dart';
import 'package:url_launcher/url_launcher.dart';

import 'managers/i18n_manager/translations/generated/l10n.dart';
import 'managers/language_manager.dart';

final navigatorKey = GlobalKey<NavigatorState>();

class Utils {
  static final RegExp mailRegExp = RegExp(
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
  static DateFormat dateFormatScheduleSet =
      DateFormat('yyyy-MM-ddTHH:mm:ss.SSS', LanguageManager.getApiLanguage());
  static DateFormat dateFormatScheduleGet =
      DateFormat('yyyy-MM-ddTHH:mm:ssZ', LanguageManager.getApiLanguage());
  static LatLng? currentLocation;

  /*
  * Loading Management
  * */
  static Widget loading(_isLoading, context) {
    return _isLoading == true
        ? Container(
            width: double.infinity,
            height: double.infinity,
            color: Colors.black.withOpacity(0.3),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          blurRadius: 5,
                          offset: const Offset(0.0, 0.0),
                        )
                      ],
                      border: Border.all(
                          color: Colors.black.withOpacity(0.5), width: 0.5),
                      color: Colors.white.withOpacity(0.92),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(20))),
                  child: Center(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                          width: 70,
                          height: 70,
                          child: Lottie.asset(
                              'assets/animations/ax_loading.json',
                              repeat: true))
                    ],
                  )),
                ),
              ],
            ))
        : Container();
  }

  /*
  * Date Utilities
  * */

  static String getDate(date, format) {
    return DateFormat('dd/MM/yyyy').format(format.parse(date));
  }

  static String getNiceDateMinus10(date, format) {
    try {
      return '${DateFormat('EE, dd/MM/yy, HH:mm', LanguageManager.getApiLanguage()).format(format.parseUTC(date).toLocal())}h';
    } catch (e) {
      return '';
    }
  }

  static String getNiceDate(date, format) {
    try {
      return '${DateFormat('dd MMMM yyyy, HH:mm', LanguageManager.getApiLanguage()).format(format.parseUTC(date).toLocal())}h';
    } catch (e) {
      return '';
    }
  }

  static String getNiceSmallDate(date, format) {
    try {
      return '${DateFormat('dd MMM, HH:mm', LanguageManager.getApiLanguage()).format(format.parseUTC(date).toLocal())}h';
    } catch (e) {
      return '';
    }
  }

  static String getNiceSmallDateNoHour(date, format) {
    try {
      return DateFormat('dd MMM', LanguageManager.getApiLanguage())
          .format(format.parseUTC(date).toLocal());
    } catch (e) {
      return '';
    }
  }

  static String formatMinutes(int minutes, {bool removeTrailing = false}) {
    if (minutes >= 60) {
      var d = Duration(minutes: minutes);
      List<String> parts = d.toString().split(':');
      return '${parts[0].padLeft(1, '0')} ${removeTrailing ? '' : 'h'}';
    }
    return "$minutes${removeTrailing ? '' : '\''}";
  }

  static String getTime(date, format) {
    return DateFormat('HH:mm').format(format.parseUTC(date).toLocal());
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
  static launchMaps(List<double> geolocation, String? name) async {
    LatLng location = LatLng(geolocation[0], geolocation[1]);
    final availableMaps = await MapLauncher.installedMaps;
    await availableMaps.first.showDirections(
        destination: Coords(location.longitude, location.latitude),
        destinationTitle: name ?? "",
        directionsMode: DirectionsMode.walking);
  }

  static launchUrl(url) async {
    if (await canLaunch(url)) {
      await launch(url, forceSafariVC: false);
    } else {
      throw 'Could not launch';
    }
  }

  /*
  * Analytics and Statistics Usage Management
  * */
  static FirebaseAnalytics analytics = FirebaseAnalytics.instance;
  static FirebaseInAppMessaging fiam = FirebaseInAppMessaging.instance;

  static FirebaseAnalytics getAnalytics() {
    return analytics;
  }

  static FirebaseInAppMessaging getFIAM() {
    return fiam;
  }

  static logEvent(String eventName, Map<String, dynamic> params) async {
    try {
      await Utils.getAnalytics().logEvent(name: eventName, parameters: params);
    } catch (e) {
      logger("Analytics error: $e");
    }
  }

  /*
  * Sign Out
  * */
  static resetData() {}
}

logger(dynamic log) {
  if (EnvironmentConfig.environment == "dev") {
    print(log);
  }
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