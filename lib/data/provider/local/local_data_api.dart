import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class LocalDataAPI {
  final _StorageKeys _sk = _StorageKeys();

  Future<SharedPreferences> get _storage => SharedPreferences.getInstance();

  onBoarded(value) async => await setBool(_sk.onBoarding, value);
  Future<bool?> get getOnBoarded async => await getBool(_sk.onBoarding);

  setLanguage(value) async => await setString(_sk.language, value);
  Future<String?> get getLanguage async => await getString(_sk.language);

  setCountry(value) async => await setString(_sk.country, jsonEncode(value));
  Future<String?> get getCountry async => await getString(_sk.country);

  setAnswers(value) async => await setString(_sk.answers, jsonEncode(value));
  Future<String?> get getAnswers async => await (await getString(_sk.answers));

  setResults(value) async => await setString(_sk.results, jsonEncode(value));
  Future<String?> get getResults async => await (await getString(_sk.results));

  //Methods store and obtain
  Future<bool> setBool(String key, bool value) async =>
      (await _storage).setBool(key, value);

  Future<bool?> getBool(String key) async => (await _storage).getBool(key);

  Future<bool> setString(String key, String value) async =>
      (await _storage).setString(key, value);

  Future<String?> getString(String key) async =>
      (await _storage).getString(key);

  Future<bool> clearData() async {
    try {
      (await _storage).remove(_sk.onBoarding);
      return true;
    } catch (_) {}
    return false;
  }
}

class _StorageKeys {
  final String onBoarding = 'settings:on_boarding';
  final String language = 'settings:language';
  final String country = 'localData:country';
  final String answers = 'localData:answers';
  final String results = 'localData:results';
}
