import 'package:palumba_eu/data/provider/local/local_auth.dart';
import 'package:get/get.dart';

class LocalAuthRepository {
  final LocalAuth _localAuth = Get.find<LocalAuth>();

  Future<void> setSession(String token) => _localAuth.setSession(token);

  Future<String?> get session => _localAuth.getSession();

  Future<void> clearSession() => _localAuth.clearSession();
}
