import 'package:flutter/material.dart';
import 'package:bondy/data/repositories/remote/authentication_repository.dart';
import 'package:bondy/data/repositories/remote/user_repository.dart';
import 'package:bondy/routes/app_routes.dart';
import 'package:get/get.dart';

class LogInController extends GetxController {
  final AuthenticationRepository _authenticationRepository =
  Get.find<AuthenticationRepository>();
  final UserRepository _userRepository = Get.find<UserRepository>();

  final _emailController = TextEditingController();
  final _emailFocusNode = FocusNode();
  final _passwordController = TextEditingController();
  final _passwordFocusNode = FocusNode();
  bool _isPasswordVisible = false;
  bool _isLoading = false;

  TextEditingController get emailController => _emailController;

  FocusNode get emailFocusNode => _emailFocusNode;

  TextEditingController get passwordController => _passwordController;

  FocusNode get passwordFocusNode => _passwordFocusNode;

  bool get isPasswordVisible => _isPasswordVisible;

  bool get isLoading => _isLoading;

  @override
  void onInit() {
    super.onInit();
  }

  void changePasswordVisibility() {
    _isPasswordVisible = !_isPasswordVisible;
    update();
  }

  void logIn() async {
    Get.focusScope!.unfocus();

    _isLoading = true;
    update(['loading']);

    var signIn = await _authenticationRepository.signIn(
        email: _emailController.text, password: _passwordController.text);
    if (signIn != null) {
      var user = await _userRepository.fetchUser();
      if (user != null) {
        /*Get.offNamed(
          user.acceptedTermsAndConditions
              ? AppRoutes.HOME
              : AppRoutes.TERMS_PRIVACY_POLICIES,
        );*/
        return;
      }
    }

    _isLoading = false;
    update(['loading']);
  }

  void forgotPassword() {
    Get.toNamed(AppRoutes.recoverPassword);
  }
}
