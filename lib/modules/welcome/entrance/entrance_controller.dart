import 'package:palumba_eu/data/repositories/remote/user_repository.dart';

import 'package:get/get.dart';
import 'package:palumba_eu/modules/onboarding/onboarding_controller.dart';

class EntranceController extends GetxController {
  static const route = '/entrance';

  final UserRepository _userRepository = Get.find<UserRepository>();

  /**
   * On Click Actions
   */
  void onContinueTap() {
    Get.offNamed(OnboardingController.route);
  }
}
