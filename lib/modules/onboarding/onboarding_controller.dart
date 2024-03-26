import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:palumba_eu/modules/welcome/language/models/language_data.dart';
import 'package:palumba_eu/utils/managers/i18n_manager/translations/generated/l10n.dart';

class OnboardingController extends GetxController {
  static const route = '/onboarding';

  final totalSteps = 4;
  RxInt currentStep = 1.obs;

  final pageController = PageController();

  RxBool isButtonEnabled = false.obs;

  ///Step1
  final List<LanguageData> _countries = [
    LanguageData(
        asset: 'assets/images/flags/hungary.svg',
        text: S.of(Get.context!).hungary),
    LanguageData(
        asset: 'assets/images/flags/denmark.svg',
        text: S.of(Get.context!).denmark),
    LanguageData(
        asset: 'assets/images/flags/germany.svg',
        text: S.of(Get.context!).germany),
    LanguageData(
        asset: 'assets/images/flags/spain.svg', text: S.of(Get.context!).spain),
    LanguageData(
        asset: 'assets/images/flags/france.svg',
        text: S.of(Get.context!).france),
    LanguageData(
        asset: 'assets/images/flags/poland.svg',
        text: S.of(Get.context!).poland),
    LanguageData(
        asset: 'assets/images/flags/romania.svg',
        text: S.of(Get.context!).romania),
    LanguageData(
        asset: 'assets/images/flags/sweden.svg',
        text: S.of(Get.context!).sweden),
  ];

  List<LanguageData> get countries => _countries;

  RxInt indexCountrySelected = (-1).obs;

  ///Step2
  final int minAge = 16;
  final int maxAge = 115;

  RxInt indexAgeSelected = (-1).obs;

  ///Step3
  final List<String> _genders = [
    S.of(Get.context!).onBoardingStep3Option1,
    S.of(Get.context!).onBoardingStep3Option2,
    S.of(Get.context!).onBoardingStep3Option3,
    S.of(Get.context!).onBoardingStep3Option4,
    S.of(Get.context!).onBoardingStep3Option5,
  ];

  List<String> get genders => _genders;

  RxInt indexGenderSelected = (-1).obs;

  /**
   * On Click Actions
   */
  void onCountryPressed(int index) {
    if (index == -1) {
      onContinueTap();
      return;
    }

    indexCountrySelected.value = index;
    updateButtonState();
  }

  void onAgePressed(int index) {
    indexAgeSelected.value = index;
    updateButtonState();
  }

  void onGenderPressed(int index) {
    indexGenderSelected.value = index;
    updateButtonState();
  }

  void onContinueTap() {
    currentStep.value = currentStep.value + 1;
    pageController.jumpToPage(pageController.page!.toInt() + 1);
    updateButtonState();
  }

  /**
   * Functions
   */
  void updateButtonState() {
    isButtonEnabled.value =
        currentStep.value == 1 && indexCountrySelected.value != -1 ||
            currentStep.value == 2 && indexAgeSelected.value != -1 ||
            currentStep.value == 3 && indexGenderSelected.value != -1;
  }
}

enum gender { woman, man, nonBinary, intersex, other, none }
