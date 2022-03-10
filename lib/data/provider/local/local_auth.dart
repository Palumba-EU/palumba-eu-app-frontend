import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

class LocalAuth {
  static const KEY = "token";
  final FlutterSecureStorage _storage = Get.find<FlutterSecureStorage>();

  Future<void> setSession(String token) async {
    await _storage.write(key: KEY, value: token);
  }

  Future<void> clearSession() async {
    await _storage.delete(key: KEY);
  }

  Future<String?> getSession() async {
    return await _storage.read(key: KEY);
  }
}
