import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:ui';

class LanguageManager {
  static late SharedPreferences sharedPreferences;

  static String currentLanguage = 'en';
  static const String keyLanguage = 'language';
  static Locale? language;

  static final LanguageManager _singleton = new LanguageManager._internal();

  LanguageManager._internal() {
    init();
  }

  factory LanguageManager() {
    return _singleton;
  }

  static init() async {
    sharedPreferences = await SharedPreferences.getInstance();
    await setupLanguage();
  }

  static setupLanguage() async {
    var language = await getSavedLanguage();
    if (language != null) {
      currentLanguage = language;
    } else {
      currentLanguage = PlatformDispatcher.instance.locale.languageCode;
    }

    updateAppLanguage();
  }

  static setLanguage(String languageCode) async {
    currentLanguage = languageCode;
    setSavedLanguage(languageCode);
    updateAppLanguage();
  }

  static updateAppLanguage() {
    Get.updateLocale(Locale(currentLanguage));
  }

  /// Manage Local Data
  static Future setSavedLanguage(String newLocale) async {
    return sharedPreferences.setString(keyLanguage, newLocale);
  }

  static Future<String?> getSavedLanguage() async {
    return sharedPreferences.getString(keyLanguage);
  }
}
