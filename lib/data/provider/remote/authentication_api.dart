import 'package:palumba_eu/data/repositories/local/local_auth_repository.dart';

import 'package:palumba_eu/utils/utils.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class AuthenticationAPI {
  final LocalAuthRepository _localAuthRepository =
      Get.find<LocalAuthRepository>();

  Future<String?> signUp() async {
    try {
      Logger.log("");
      return null;
    } catch (c) {
      Logger.log("$c");
      return null;
    }
  }
}
