import 'package:shared_preferences/shared_preferences.dart';

class LocalAuth {
  static const keyToken = "token";
  static const keyTokenType = "token_type";
  static const keyRefreshToken = "refresh_token";

  Future<void> setSession(String token) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(keyToken, token);
  }

  Future<void> clearSession() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(keyToken);
  }

  Future<String?> getSession() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(keyToken);
  }

  Future<void> setTokenType(String type) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(keyTokenType, type);
  }

  Future<void> clearTokenType() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(keyTokenType);
  }

  Future<String?> getTokenType() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(keyTokenType);
  }

  Future<void> setRefreshToken(String token) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(keyRefreshToken, token);
  }

  Future<void> clearRefreshToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(keyRefreshToken);
  }

  Future<String?> getRefreshToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(keyRefreshToken);
  }

  //////////////////////////////////////////////////////////////////////////

  Future<void> signOutCleanProcess() async {
    await clearSession();
    await clearRefreshToken();
    await clearTokenType();
  }
}
