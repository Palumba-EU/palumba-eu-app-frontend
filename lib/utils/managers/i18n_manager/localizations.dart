import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../language_manager.dart';

class MyLocalizations {
  Locale locale;
  static Map<dynamic, dynamic>? _localizedValues;

  MyLocalizations(this.locale) {
    this.locale = locale;
    _localizedValues = null;
  }

  static Future<MyLocalizations> loadTranslations(Locale locale) async {
    MyLocalizations appTranslations = MyLocalizations(locale);

    var languageCode = "en";
    if (locale.languageCode != "en") {
      languageCode = "en";
    } else {
      languageCode = locale.languageCode;
    }

    String jsonContent =
    await rootBundle.loadString('assets/i18n_assets/$languageCode.json');
    _localizedValues = json.decode(jsonContent);
    return appTranslations;
  }

  String? translate(key) {
    return _localizedValues != null && _localizedValues![key] != null
        ? _localizedValues![key]
        : "";
  }

  static String? of(BuildContext context, String? key) {
    return Localizations.of<MyLocalizations>(context, MyLocalizations)!
        .translate(key);
  }
}

class MyLocalizationsDelegate extends LocalizationsDelegate<MyLocalizations> {
  final Locale? newLocale;

  const MyLocalizationsDelegate({this.newLocale});

  @override
  bool isSupported(Locale locale) => [
    "en"
  ].contains(locale.languageCode);

  @override
  Future<MyLocalizations> load(Locale locale) async {
    Locale savedLocale = await LanguageManager.getSavedLocale();
    return MyLocalizations.loadTranslations(newLocale ?? savedLocale);
  }

  @override
  bool shouldReload(MyLocalizationsDelegate old) => true;
}
