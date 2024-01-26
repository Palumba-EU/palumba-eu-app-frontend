import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

class LocalAuth {
  final FlutterSecureStorage _storage = Get.find<FlutterSecureStorage>();

  static const keyToken = "token";
  static const keyTokenType = "token_type";
  static const keyRefreshToken = "refresh_token";

  Future<void> setSession(String token) async {
    await _storage.write(key: keyToken, value: token);
  }

  Future<void> clearSession() async {
    await _storage.delete(key: keyToken);
  }

  Future<String?> getSession() async {
    return await _storage.read(key: keyToken);
  }

  Future<void> setTokenType(String? type) async {
    await _storage.write(key: keyTokenType, value: type);
  }

  Future<void> clearTokenType() async {
    await _storage.delete(key: keyTokenType);
  }

  Future<String?> getTokenType() async {
    return await _storage.read(key: keyTokenType);
  }

  Future<void> setRefreshToken(String? token) async {
    await _storage.write(key: keyRefreshToken, value: token);
  }

  Future<void> clearRefreshToken() async {
    await _storage.delete(key: keyRefreshToken);
  }

  Future<String?> getRefreshToken() async {
    return await _storage.read(key: keyRefreshToken);
  }

  Future<void> clear() async {
    await clearSession();
    await clearRefreshToken();
    await clearTokenType();
  }
}
