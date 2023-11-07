import 'package:flutter_boilerplate/data/repositories/local/config_data_repository.dart';

import 'package:flutter_boilerplate/utils/utils.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class AuthenticationAPI {
  final LocalAuthRepository _localAuthRepository =
      Get.find<LocalAuthRepository>();

  Future<String?> signIn(String email, String password) async {
    try {
      Logger.log("");
      return null;
    } catch (c) {
      Logger.log("$c");
      return null;
    }
  }

  Future<String?> signUp(String email, String password) async {
    try {
      Logger.log("");
      return null;
    } catch (c) {
      Logger.log("$c");
      return null;
    }
  }

  Future<String?> passwordRecovery(String email) async {
    try {
      Logger.log("");
      return null;
    } catch (c) {
      Logger.log("$c");
      return null;
    }
  }

  Future<bool> refreshToken() async {
    try {
      Logger.log("");
      return false;
    } catch (c) {
      Logger.log("$c");
      return false;
    }
  }

  Future<bool> signOut() async {
    try {
      Logger.log("");
      return false;
    } catch (c) {
      Logger.log("$c");
      return false;
    }
  }

  Future<bool> validateJWT() async {
    try {
      Logger.log("");
      return false;
    } catch (c) {
      Logger.log("$c");
      return false;
    }
  }
}
