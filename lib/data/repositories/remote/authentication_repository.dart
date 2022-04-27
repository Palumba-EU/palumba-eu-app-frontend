import 'package:flutter_boilerplate/data/provider/remote/authentication_api.dart';
import 'package:get/get.dart';
import 'package:meta/meta.dart' show required;

class AuthenticationRepository {
  final AuthenticationAPI _api = Get.find<AuthenticationAPI>();

  Future<String?>? signIn({required String email, required String password}) => _api.signIn(email, password);
  Future<String?>? signUp({required String email, required String password}) => _api.signUp(email, password);
  Future<String?>? passwordRecovery({required String email}) => _api.passwordRecovery(email);
  Future<bool> signOut() => _api.signOut();
  Future<bool> refreshToken() => _api.refreshToken();
  Future<bool> validateJWT() => _api.validateJWT();
}
