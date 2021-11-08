import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:ui' as ui;

class LanguageManager {
  static String? currentLanguage = 'en';
  static late SharedPreferences sharedPreferences;
  static Locale? language;

  static final LanguageManager _singleton = new LanguageManager._internal();

  LanguageManager._internal() {
    initSharedPreferences();
  }

  factory LanguageManager() {
    return _singleton;
  }

  static initSharedPreferences() async {
    await setupLanguage();
  }

  static setupLanguage() async {
    sharedPreferences = await SharedPreferences.getInstance();
    currentLanguage = sharedPreferences.getString("language");
    if (currentLanguage == null) {
      currentLanguage = 'en';
      currentLanguage = ui.window.locale.languageCode;
    }
  }

  static String? getCurrentLanguage() {
    if (currentLanguage == null) {
      return 'en';
    }
    return currentLanguage;
  }

  static String getApiLanguage() {
    String? language = LanguageManager.getCurrentLanguage();
    return 'en-us';
  }

  static setLanguage(String newLocale) async {
    currentLanguage = newLocale;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("language", newLocale);
  }

  /*
  * Language Manager
  * */
  static Future<String> getSavedLanguage() async {
    await setupLanguage();
    return currentLanguage ?? "";
  }

  static Future<Locale> getSavedLocale() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    currentLanguage = prefs.getString("language");
    if (currentLanguage == null) {
      var lg = ui.window.locale.languageCode;
      return Locale(lg, getLocaleCountry(lg));
    }
    return Locale(currentLanguage!, getLocaleCountry(currentLanguage));
  }

  static String getLocaleCountry(String? language) {
    return 'US';
  }
}
