import 'dart:convert';
import 'package:flutter_boilerplate/data/repositories/local/config_data_repository.dart';
import 'package:flutter_boilerplate/utils/managers/credentials_manager.dart';
import 'package:flutter_boilerplate/utils/utils.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class AuthenticationAPI {
  final LocalAuthRepository _localAuthRepository =
      Get.find<LocalAuthRepository>();

  final logInEndpoint = '';
  final signUpEndpoint = '';
  final pwdRecoveryEndpoint = '';
  final validateJWTEndpoint = '';
  final signOutEndpoint = '';
  final refreshTokenEndpoint = '';

  Future<String?> signIn(String email, String password) async {
    try {
      logger("");
      return null;
    } catch (c) {
      logger("$c");
      return null;
    }
  }
  Future<String?> signUp(String email, String password) async {
    try {
      logger("");
      return null;
    } catch (c) {
      logger("$c");
      return null;
    }
  }
  Future<String?> passwordRecovery(String email) async {
    try {
      logger("");
      return null;
    } catch (c) {
      logger("$c");
      return null;
    }
  }
  Future<bool> refreshToken() async {
    try {
      logger("");
      return false;
    } catch (c) {
      logger("$c");
      return false;
    }
  }
  Future<bool> signOut() async {
    try {
      logger("");
      return false;
    } catch (c) {
      logger("$c");
      return false;
    }
  }
  Future<bool> validateJWT() async {
    try {
      logger("");
      return false;
    } catch (c) {
      logger("$c");
      return false;
    }
  }
}
