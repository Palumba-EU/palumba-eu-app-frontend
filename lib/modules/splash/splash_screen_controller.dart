import 'package:palumba_eu/data/repositories/local/local_auth_repository.dart';
import 'package:palumba_eu/data/repositories/remote/user_repository.dart';
import 'package:palumba_eu/global_controllers/user_controller.dart';
import 'package:palumba_eu/routes/app_routes.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
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
        AppRoutes.signUp,
      );
    }
  }

  _initData() async {
    var user = await _userRepository.fetchUser();
    if (user != null) {
      //TODO: Go To Home.
    } else {
      Get.offNamed(AppRoutes.signUp,);
    }
  }
}
