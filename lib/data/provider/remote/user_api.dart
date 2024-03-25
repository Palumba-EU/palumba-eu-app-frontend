import 'package:palumba_eu/data/model/user.dart';
import 'package:palumba_eu/data/repositories/local/local_auth_repository.dart';
import 'package:palumba_eu/global_controllers/user_controller.dart';

import 'package:palumba_eu/utils/utils.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';

class UserAPI {
  final LocalAuthRepository _localAuthRepository =
      Get.find<LocalAuthRepository>();

  final userMe = '';

  final UserController _userController = Get.find<UserController>();

  Future<User?> fetchUser() async {
    try {
      return null;
    } catch (c) {
      Logger.log('Fetch User Failed: $c');
      return null;
    }
  }
}
