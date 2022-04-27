import 'package:bondy/data/model/user.dart';
import 'package:bondy/data/provider/remote/user_api.dart';
import 'package:get/get.dart';

class UserRepository {
  final UserAPI _api = Get.find<UserAPI>();

  Future<User?> fetchUser() => _api.fetchUser();
  Future<bool> recoverPassword(String password) => _api.recoverPassword(password);
  Future<bool> changePassword(String password) => _api.changePassword(password);
}
