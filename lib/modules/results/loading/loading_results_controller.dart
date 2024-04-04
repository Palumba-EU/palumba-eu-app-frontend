import 'dart:async';

import 'package:get/get.dart';
import 'package:palumba_eu/modules/results/results_controller.dart';

class LoadingResultsController extends GetxController {
  static const route = '/loading_results';

  final totalSteps = 6;

  RxInt currentStep = 1.obs;

  @override
  void onReady() {
    super.onReady();
    _init();
  }

  void _init() {
    Timer.periodic(const Duration(seconds: 2), (timer) {
      if (currentStep.value < 5) {
        currentStep.value = currentStep.value + 1;
      } else {
        timer.cancel();
        Get.offAllNamed(ResultsController.route);
      }
    });
  }
}
