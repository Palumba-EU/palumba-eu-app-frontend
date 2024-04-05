import 'dart:async';

import 'package:get/get.dart';
import 'package:palumba_eu/data/repositories/remote/data_repository.dart';

class LoadingResultsController extends GetxController {
  static const route = '/loading_results';

  final DataRepository _dataRepository = Get.find<DataRepository>();

  final totalSteps = 6;

  RxInt currentStep = 1.obs;

  @override
  void onReady() {
    super.onReady();
    _init();
    _initData();
  }

  void _init() {
    Timer.periodic(const Duration(seconds: 2), (timer) {
      if (currentStep.value < 5) {
        currentStep.value = currentStep.value + 1;
      }
    });
  }

  void _initData() async {
    var response = await _dataRepository.fetchResultsInfo();
    if (response == null) {

    }
  }
}
