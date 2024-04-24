import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:palumba_eu/data/repositories/local/local_data_repository.dart';
import 'package:palumba_eu/modules/onboarding/onboarding_controller.dart';
import 'package:palumba_eu/modules/results/results_controller.dart';
import 'package:palumba_eu/modules/welcome/entrance/entrance_controller.dart';
import 'package:palumba_eu/utils/managers/user_manager.dart';
import 'package:palumba_eu/utils/string_utils.dart';

class HomePageController extends GetxController {
  static const route = '/home';

  final String resultsExistsKey = 'lastResultsExists';

  PageController pageController = PageController();

  LocalDataRepository _localDataRepository = Get.find<LocalDataRepository>();

  List<Map> resultsData = [];

  bool get isTestRunning => UserManager.isTestRunning;

  @override
  void onInit() {
    obtainLocalStoredLastResults();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  Future<void> obtainLocalStoredLastResults() async {
    try {
      final jsonEncoded = await _localDataRepository.results;
      final results = jsonDecode(jsonEncoded ?? '[]');
      resultsData = List<Map<String, dynamic>>.from(results);
    } catch (e) {
      debugPrint(e.toString());
    }
    //Update the results button
    update([resultsExistsKey]);
  }

  void backToresultsOrTest() {
    if (isTestRunning) {
      Get.back();
      return;
    }
    Get.toNamed(ResultsController.route, arguments: {
      StringUtils.resultsDataKey: resultsData,
    });
  }

  void goToSettings() {
    Get.toNamed(OnboardingController.route);
  }

  void goToFirstPage() {
    Get.offAllNamed(EntranceController.route);
  }
}
