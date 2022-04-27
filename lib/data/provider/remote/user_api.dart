import 'dart:convert';
import 'dart:io';
import 'package:bondy/data/model/user.dart';
import 'package:bondy/data/repositories/local/config_data_repository.dart';
import 'package:bondy/global_controllers/user_controller.dart';
import 'package:bondy/utils/managers/credentials_manager.dart';
import 'package:bondy/utils/utils.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';

class UserAPI {
  final LocalAuthRepository _localAuthRepository =
  Get.find<LocalAuthRepository>();

  final userMe = '';
  final passwordRecovery = '';
  final passwordReset = '';

  final UserController _userController = Get.find<UserController>();

  Future<User?> fetchUser() async {
    try {
      return null;
    } catch (c) {
      Logger.log('Fetch User Failed: $c');
      return null;
    }
  }

  Future<bool> recoverPassword(email) async {
    try {
      return true;
    } catch (c) {
      Logger.log('RecoverPasswordResponse Failed: $c');
      return false;
    }
  }

  Future<bool> changePassword(password) async {
    try {
      return true;
    } catch (c) {
      Logger.log('Change Password Failed: $c');
      return false;
    }
  }
}
