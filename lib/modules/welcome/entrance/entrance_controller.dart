import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:palumba_eu/modules/onboarding/onboarding_controller.dart';
import 'package:palumba_eu/utils/utils.dart';

class EntranceController extends GetxController {
  static const route = '/entrance';

  PageController pageController = PageController();

  /**
   * On Click Actions
   */
  void onContinueTap() {
    Get.offAllNamed(OnboardingController.route);
  }

  void onTikTokTap() {
    Utils.launch('https://www.tiktok.com/@palumba.eu');
  }

  void onInstagramTap() {
    Utils.launch('https://www.instagram.com/palumba.eu');
  }
}
