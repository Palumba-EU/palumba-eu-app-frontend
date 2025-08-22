import 'dart:convert';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:palumba_eu/data/manager/data_manager.dart';
import 'package:palumba_eu/data/model/election.dart';
import 'package:palumba_eu/data/model/elections_response.dart';
import 'package:palumba_eu/data/model/sponsors_data.dart';
import 'package:palumba_eu/data/repositories/local/local_data_repository.dart';
import 'package:palumba_eu/modules/message_widget.dart';
import 'package:palumba_eu/modules/onboarding/onboarding_controller.dart';
import 'package:palumba_eu/modules/results/results_controller.dart';
import 'package:palumba_eu/modules/settings/settings_page_controller.dart';
import 'package:palumba_eu/modules/statments/statements_screen_controller.dart';
import 'package:palumba_eu/utils/common_ui/app_colors.dart';
import 'package:palumba_eu/utils/managers/election_manager.dart';
import 'package:palumba_eu/utils/managers/plausible_manager.dart';
import 'package:palumba_eu/utils/managers/push_notification_service.dart';
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
    conditionallyShowEggScreenOnce();
    super.onInit();
    PlausibleManager.trackPage(route);
    PushNotificationService().fromForeground(_showSnackbar);
    PushNotificationService().fromBackground(_eggFromPush);
  }

  void _showSnackbar(RemoteMessage message) {
    Get.snackbar(
      message.notification?.title ?? '', // Title
      message.notification?.body ?? '', // Message
      snackPosition: SnackPosition.TOP,
      backgroundColor: AppColors.yellow,
      colorText: AppColors.primary,
      duration: Duration(seconds: 3),
      borderRadius: 10,
      margin: EdgeInsets.all(10),
      barBlur: 20,
      onTap: (snack) => _eggFromPush(message),
    );
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

  Future<void> conditionallyShowEggScreenOnce() async {
    final args = Get.arguments;
    final eggScreenSeen = (await _localDataRepository.seenEggScreen) ?? false;
    if (args != null && !eggScreenSeen) {
      final comingFromResults = args[StringUtils.fromResultsKey];
      if (comingFromResults) {
        eggPressed();
        _localDataRepository.seenEggScreen = true;
      }
    }
  }

  void launchFaqUrl() {
    Utils.launch(StringUtils.faqUrl);
  }

  void _eggFromPush(RemoteMessage message) {
    Get.closeCurrentSnackbar();
    try {
      var info = EggScreen.fromJson(json.decode(message.data["eggScreen"]));

      // due to 200 char limitation of the Firebase UI one can patch this
      // fields by setting extra custom data until the BE has a UI

      final extraDesc = message.data["eggScreenDescription"];
      if (extraDesc != null) info.description = extraDesc;

      final extraImg = message.data["eggImage"];
      if (extraImg != null) info.image = extraImg;

      MessageWidget.callAsBottomSheet(info);
    } catch (e) {
      debugPrint("could not decode push to eggScreen");
    }
  }

  void eggPressed() {
    var info = ElectionManager.eggInfo;
    if (info == null) return;
    MessageWidget.callAsBottomSheet(info);
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
      return election.swipe;
    }
    return 'assets/images/img_results.svg';
  }

  String textForIndex(BuildContext context, int index, Election election) {
    switch (index) {
      case 0:
        return election.entranceTitle1(context);
      case 1:
        return election.entranceTitle2(context);
      case 2:
        return election.entranceTitle3(context);
    }
    return '';
  }
}
