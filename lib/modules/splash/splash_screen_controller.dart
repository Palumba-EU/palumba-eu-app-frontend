import 'package:flutter_boilerplate/data/repositories/local/config_data_repository.dart';
import 'package:flutter_boilerplate/data/repositories/remote/user_repository.dart';
import 'package:flutter_boilerplate/global_controllers/user_controller.dart';
import 'package:flutter_boilerplate/routes/app_routes.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  final LocalAuthRepository _localAuthRepository =
  Get.find<LocalAuthRepository>();
  final UserController _userController = Get.find<UserController>();
  final UserRepository _userRepository = Get.find<UserRepository>();

  @override
  void onReady() {
    _init();
    super.onReady();
  }

  _init() async {
    var authToken = await _localAuthRepository.session;
    if (authToken != null) {
      _initData();
    } else {
      Get.offNamed(
        AppRoutes.logIn,
      );
    }
  }

  _initData() async {
    var user = await _userRepository.fetchUser();
    if (user != null) {
      /*Get.offNamed(
        user.acceptedTermsAndConditions
            ? AppRoutes.HOME
            : AppRoutes.TERMS_PRIVACY_POLICIES,
      );*/
    } else {
      Get.offNamed(AppRoutes.logIn,);
    }
  }
}
