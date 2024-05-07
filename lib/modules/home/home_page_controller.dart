import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:palumba_eu/data/manager/data_manager.dart';
import 'package:palumba_eu/data/model/sponsors_data.dart';
import 'package:palumba_eu/data/repositories/local/local_data_repository.dart';
import 'package:palumba_eu/data/repositories/remote/data_repository.dart';
import 'package:palumba_eu/modules/onboarding/onboarding_controller.dart';
import 'package:palumba_eu/modules/results/results_controller.dart';
import 'package:palumba_eu/modules/settings/settings_page_controller.dart';
import 'package:palumba_eu/utils/managers/user_manager.dart';
import 'package:palumba_eu/utils/string_utils.dart';
import 'package:palumba_eu/utils/utils.dart';

class HomePageController extends GetxController {
  static const route = '/home';

  final String resultsExistsKey = 'lastResultsExists';

  PageController pageController = PageController();

  LocalDataRepository _localDataRepository = Get.find<LocalDataRepository>();

  final DataRepository _dataRepository = Get.find<DataRepository>();

  List<Map> answersData = [];

  List<Map> resultsData = [];

  bool get isTestRunning => UserManager.isTestRunning;

  RxBool _showBanner = false.obs;
  bool get showBanner => _showBanner.value;

  @override
  void onInit() {
    obtainLocalStoredLastResults();
    super.onInit();
  }

  Future<void> obtainLocalStoredLastResults() async {
    try {
      final jsonAnswersEncoded = await _localDataRepository.answers;
      final answers = jsonDecode(jsonAnswersEncoded ?? '[]');
      answersData = List<Map<String, dynamic>>.from(answers);

      final jsonResultsEncoded = await _localDataRepository.results;
      final results = jsonDecode(jsonResultsEncoded ?? '[]');
      resultsData = List<Map<String, dynamic>>.from(results);
    } catch (e) {
      debugPrint(e.toString());
    }
    //Update the results button
    update([resultsExistsKey]);
  }

  void launchFaqUrl() {
    Utils.launch(StringUtils.faqUrl);
  }

  void showBannerWidget() {
    _showBanner.value = !_showBanner.value;
  }

  void goToSettings() {
    Get.toNamed(SettingsPageController.route);
  }

  void launchUrl(String url) {
    Utils.launch(url);
  }

  Sponsor getYouthCardSponsor() {
    List<Sponsor> sponsors = DataManager().getSponsors();
    return sponsors.firstWhere((e) => e.id == 7);
  }

  void backToResultsOrTest() {
    if (isTestRunning) {
      Get.back();
      return;
    }
    Get.toNamed(ResultsController.route, arguments: {
      StringUtils.answersDataKey: answersData,
      StringUtils.resultsDataKey: resultsData,
    });
  }

  void startNewTest() {
    Get.offAllNamed(OnboardingController.route);
  }
}
