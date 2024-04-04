import 'package:palumba_eu/data/model/user.dart';
import 'package:palumba_eu/data/provider/remote/user_api.dart';
import 'package:get/get.dart';

class UserRepository {
  final UserAPI _api = Get.find<UserAPI>();

  Future<User?> fetchUser() => _api.fetchUser();

}
