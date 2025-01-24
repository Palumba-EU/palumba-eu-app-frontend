import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:palumba_eu/data/manager/data_manager.dart';
import 'package:palumba_eu/data/model/election.dart';
import 'package:palumba_eu/data/model/sponsors_data.dart';
import 'package:palumba_eu/data/repositories/local/local_data_repository.dart';
import 'package:palumba_eu/modules/onboarding/onboarding_controller.dart';
import 'package:palumba_eu/modules/results/results_controller.dart';
import 'package:palumba_eu/modules/settings/settings_page_controller.dart';
import 'package:palumba_eu/modules/statments/statements_screen_controller.dart';
import 'package:palumba_eu/utils/managers/plausible_manager.dart';
import 'package:palumba_eu/utils/managers/user_manager.dart';
import 'package:palumba_eu/utils/string_utils.dart';
import 'package:palumba_eu/utils/utils.dart';

class HomePageController extends GetxController {
  static const route = '/home';

  final String resultsExistsKey = 'lastResultsExists';

  PageController pageController = PageController();

  LocalDataRepository _localDataRepository = Get.find<LocalDataRepository>();

  List<Map> answersData = [];

  List<Map> resultsData = [];

  bool get isTestRunning => UserManager.isTestRunning;

  RxBool _showBanner = false.obs;
  bool get showBanner => _showBanner.value;

  @override
  void onInit() {
    obtainLocalStoredLastResults();
    conditionallyShowEYCABanner();
    super.onInit();
    PlausibleManager.trackPage(route);
  }

  Future<void> obtainLocalStoredLastResults() async {
    try {
      final jsonAnswersEncoded = await _localDataRepository.answers;
      final answers = jsonDecode(jsonAnswersEncoded ?? '[]');
      answersData = List<Map<String, dynamic>>.from(answers);
    } catch (e) {
      answersData = [];
      debugPrint("no answers found in local storage");
    }
    try {
      final jsonResultsEncoded = await _localDataRepository.results;
      final results = jsonDecode(jsonResultsEncoded ?? '[]');
      resultsData = List<Map<String, dynamic>>.from(results);
    } catch (e) {
      resultsData = [];
      debugPrint("no results found in local storage");
    }
    //Update the results button
    update([resultsExistsKey]);
  }

  Future<void> conditionallyShowEYCABanner() async {
    final args = Get.arguments;
    if (args != null) {
      final comingFromResults = args[StringUtils.fromResultsKey];
      final seenEYCA = (await _localDataRepository.seenEYCA) ?? false;

      _showBanner.value = comingFromResults && !seenEYCA;
      _localDataRepository.seenEYCA = true;
    }
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
    return sponsors
        .firstWhere((e) => e.name == "European Youth Card Association");
  }

  void backToResultsOrTest() {
    if (isTestRunning) {
      Get.toNamed(StatementsController.route);
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

  String imageForIndex(int index, Election election) {
    if (index == 0) {
      return election.pigeon;
    } else if (index == 1) {
      return 'assets/images/img_swipe.svg';
    }
    return 'assets/images/img_results.svg';
  }
}
