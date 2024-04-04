import 'package:palumba_eu/data/repositories/local/local_auth_repository.dart';
import 'package:palumba_eu/data/repositories/remote/user_repository.dart';
import 'package:palumba_eu/modules/results/results_controller.dart';

import 'package:get/get.dart';
import 'package:palumba_eu/modules/welcome/language/language_controller.dart';

class SplashController extends GetxController {
  static const route = '/splash';

  final LocalAuthRepository _localAuthRepository =
      Get.find<LocalAuthRepository>();

  final UserRepository _userRepository = Get.find<UserRepository>();

  @override
  void onReady() {
    super.onReady();
    _init();
  }

  _init() async {
    var authToken = await _localAuthRepository.session;
    if (authToken != null) {
      _initData();
    } else {
      Get.offNamed(
        LanguageController.route,
      );
    }
  }

  _initData() async {
    var user = await _userRepository.fetchUser();
    if (user != null) {
      /*Get.offNamed(
        AppRoutes.home,
      );*/
    } else {
      /*Get.offNamed(
        AppRoutes.signUp,
      );*/
    }
  }
}
