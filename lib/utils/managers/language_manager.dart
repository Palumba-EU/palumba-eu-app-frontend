import 'package:shared_preferences/shared_preferences.dart';
import 'dart:ui';

class LanguageManager {
  static String? currentLanguage = 'es';
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
      currentLanguage = 'es';
      currentLanguage = PlatformDispatcher.instance.locale.languageCode;
    }
  }

  static String? getCurrentLanguage() {
    if (currentLanguage == null) {
      return 'es';
    }
    return currentLanguage;
  }

  static String getApiLanguage() {
    String? language = LanguageManager.getCurrentLanguage();
    return 'es-es';
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
      var lg = PlatformDispatcher.instance.locale.languageCode;
      return Locale(lg, getLocaleCountry(lg));
    }
    return Locale(currentLanguage!, getLocaleCountry(currentLanguage));
  }

  static String getLocaleCountry(String? language) {
    return 'ES';
  }
}
