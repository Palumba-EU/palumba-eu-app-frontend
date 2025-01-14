import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:palumba_eu/data/manager/data_manager.dart';
import 'package:palumba_eu/data/model/card_model.dart';
import 'package:palumba_eu/data/model/gender_model.dart';
import 'package:palumba_eu/data/model/levelOfStudy_model.dart';
import 'package:palumba_eu/data/model/localization_data.dart';
import 'package:palumba_eu/data/repositories/local/local_data_repository.dart';
import 'package:palumba_eu/modules/statments/helpers/statements_parser_helper.dart';
import 'package:palumba_eu/modules/statments/statements_screen_controller.dart';
import 'package:palumba_eu/utils/managers/user_manager.dart';
import 'package:palumba_eu/utils/string_utils.dart';
import 'package:palumba_eu/utils/utils.dart';

class OnboardingController extends GetxController {
  static const route = '/onboarding';

  final LocalDataRepository _localDataRepository =
      Get.find<LocalDataRepository>();

  final totalSteps = 5;
  RxInt currentStep = 1.obs;

  final pageController = PageController();

  RxBool isButtonEnabled = false.obs;
  RxBool isPreferNotToSayEnabled = true.obs;

  ///fields for background
  Rx<EdgeInsets> margin = EdgeInsets.zero.obs;
  Rx<Radius> radius = Radius.zero.obs;
  Rx<double> height = 0.0.obs;
  Rx<double> heighClippedContainer = (Get.height).obs;

  ///Step1
  List<Country>? _countries = DataManager().getCountries();
  List<Country>? get countries => _countries;
  RxInt indexCountrySelected = (-1).obs;

  ///Step2
  final int minAge = 14;
  final int maxAge = 115;
  RxInt indexAgeSelected = (-1).obs;

  ///Step3
  final List<GenderModel> _genders = GenderModel.allGenders(Get.context!);
  List<String> get genders => _genders.map((gender) => gender.name).toList();
  RxInt indexGenderSelected = (-1).obs;
  RxBool acceptDataPrivacy = (false).obs;

  ///Step 4
  List<LevelOfEducation> levelsofEducation = LevelOfEducation.values;
  RxInt indexLevelOfEducationSelected = (-1).obs;

  ///Step5
  RxBool _showLastStepTitle = false.obs;
  bool get showLastStepTitle => _showLastStepTitle.value;

  bool isSmallScreen = Get.height < 800;
  late int topInset = isSmallScreen ? 0 : 30;

  /// animate statementUI
  Rx<Offset> smallButtonsPosition = Offset(0, Get.height * .3).obs;
  Rx<Offset> bigButtonsPosition = Offset(0, Get.height * .3).obs;
  RxBool showFinalView = false.obs;
  final Rx<Offset> cardPosition = Offset(Get.width * .25, Get.height).obs;
  late CardModel cardData;
  RxBool finalAnimationFinished = false.obs;

  @override
  void onInit() {
    clearUserStoredStatements();
    updateBackgroundShape();
    super.onInit();
    trackSteps();
    cardData = StatementsParser.getIntroCard(Get.context!, true);
  }

  void trackSteps() {
    debugPrint('currentOnbStep: ' + currentStep.value.toString());
    currentStep.listen((step) {
      debugPrint('currentOnbStep: ' + step.toString());
    });
  }

  void clearUserStoredStatements() {
    UserManager.clearAllStatements();
  }

  /**
   * On Click Actions
   */
  void onCountryPressed(int index) {
    if (index == -1) {
      onContinueTap();
      return;
    }
    UserManager.setCountry(_countries![index]);
    indexCountrySelected.value = index;
    _localDataRepository.country = _countries![index].toJson();
    updateButtonState();
  }

  void onAgePressed(int index) {
    indexAgeSelected.value = index;
    UserManager.setAge(index + minAge);
    updateButtonState();
  }

  void onGenderPressed(int index) {
    indexGenderSelected.value = index;
    UserManager.setGender(_genders[index].genderEnum);
    updateButtonState();
  }

  void onDataPrivacyToggle(bool accept) {
    acceptDataPrivacy.value = accept;
    updateButtonState();
    updatePreferNotToSay();
  }

  void onLevelOfEducationPressed(int index) {
    indexLevelOfEducationSelected.value = index;
    UserManager.setLevelOfEducation(levelsofEducation[index]);
    updateButtonState();
  }

  void notAnsweredContinue() {
    if (currentStep.value == 2) {
      UserManager.setAge(null);
    } else if (currentStep.value == 3) {
      UserManager.setGender(null);
    } else if (currentStep.value == 3) {
      UserManager.setLevelOfEducation(null);
    }
    onContinueTap();
  }

  void onContinueTap() {
    currentStep.value = currentStep.value + 1;
    pageController.jumpToPage(pageController.page!.toInt() + 1);
    updateBackgroundShape();
    updateButtonState();
    updatePreferNotToSay();
  }

  /**
   * Functions
   */

  void launchDataPrivcay() {
    Utils.launch("https://www.palumba.eu/de/data-protection");
  }

  void updateButtonState() {
    updateBackgroundShape();
    isButtonEnabled.value =
        currentStep.value == 1 && indexCountrySelected.value != -1 ||
            currentStep.value == 2 && indexAgeSelected.value != -1 ||
            currentStep.value == 3 && indexLevelOfEducationSelected != -1 ||
            currentStep.value == 4 &&
                indexGenderSelected.value != -1 &&
                acceptDataPrivacy == true;
  }

  void updatePreferNotToSay() {
    isPreferNotToSayEnabled.value = currentStep == 1 ||
        currentStep == 2 ||
        currentStep == 3 ||
        currentStep == 4 && acceptDataPrivacy == true;
  }

  void updateBackgroundShape() {
    //Update the background shape

    var heightSize = Get.height;
    if (currentStep.value <= 1) {
      height.value = Get.width * .2; //34; //heightSize * .0415;
      radius.value = Radius.elliptical(900, 380);
      margin.value = EdgeInsets.symmetric(horizontal: Get.width * 0.18);
    } else if (currentStep.value == 2) {
      height.value = isSmallScreen ? heightSize * 0.2 : heightSize * 0.3;
      radius.value = Radius.circular(250);
      margin.value = EdgeInsets.zero;
    } else if (currentStep.value == 3) {
      height.value = isSmallScreen ? heightSize * 0.23 : heightSize * 0.33;
      radius.value = Radius.circular(250);
      margin.value = EdgeInsets.zero;
    } else if (currentStep.value == 4) {
      height.value = isSmallScreen ? heightSize * 0.25 : heightSize * 0.35;
      radius.value = Radius.circular(250);
      margin.value = EdgeInsets.zero;
    } else {
      height.value = Get.height;
      radius.value = Radius.circular(250);
      radius.value = Radius.zero;
      wrapUpScreenAndAnimateStatementUI();
    }
  }

  void wrapUpScreenAndAnimateStatementUI() {
    //When shape reach bottom of the screen we activate the rise card and buttons animation
    Future.delayed(Duration(milliseconds: 750), () async {
      showFinalView.value = true;
      await Future.delayed(Duration(milliseconds: 250));
      heighClippedContainer.value = Get.height * .82;
      height.value = Get.height * .72;
      margin.value = EdgeInsets.zero;
      radius.value = Radius.elliptical(240, 280);
    }).then((value) async {
      _showLastStepTitle.value = true;
      cardPosition.value =
          Offset(cardPosition.value.dx, (Get.height * .9) * .28);
      await Future.delayed(Duration(milliseconds: 350));
      bigButtonsPosition.value = Offset(0, 0);
      await Future.delayed(Duration(milliseconds: 450));
      smallButtonsPosition.value = Offset(0, 0);
      await Future.delayed(Duration(milliseconds: 1200));

      // Finally when animation finish we navigate to statments screen
      Get.offAllNamed(StatementsController.route, arguments: {
        StringUtils.fromOnboardingKey: true,
      });
    });
  }
}
