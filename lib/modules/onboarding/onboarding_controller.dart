import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:palumba_eu/data/model/card_model.dart';
import 'package:palumba_eu/modules/statments/statements_screen_controller.dart';
import 'package:palumba_eu/modules/welcome/language/models/language_data.dart';
import 'package:palumba_eu/utils/managers/i18n_manager/translations/generated/l10n.dart';
import 'package:palumba_eu/utils/string_utils.dart';

class OnboardingController extends GetxController {
  static const route = '/onboarding';

  final totalSteps = 4;
  RxInt currentStep = 1.obs;

  final pageController = PageController();

  RxBool isButtonEnabled = false.obs;

  Rx<EdgeInsets> margin = EdgeInsets.zero.obs;
  Rx<Radius> radius = Radius.zero.obs;
  Rx<double> height = 0.0.obs;
  Rx<double> heighClippedContainer = (Get.height).obs;
  RxBool finalAnimationFinished = false.obs;

  RxBool _startAnimation = false.obs;
  get startAnimation => _startAnimation.value;

  CardModel get exampleCard => CardModel(
      id: 'Card01',
      main: 'Whistleblowers* should be protected no matter what they reveal.',
      whistleblowe:
          '️‍An individual who exposes wrongdoing, corruption, or unethical behavior within an organization or institution to the public or authorities, often at great personal risk. (Oxford Dictionary)',
      context:
          'Since a few years, several individuals have revealed key internal information about the wrongdoings of their organisations. This led to massive scandals about the safety of those whistleblowers and their responsibility before the law. Therefore, the EU passed the Whistleblower Directive to regulate this practice in our democracies.',
      favorArgs: 'Cooming soon',
      againstArgs: 'Cooming soon');

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

  RxBool _showFinalView = false.obs;
  bool get showFinalView => _showFinalView.value;

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
    updateBackgroundShape();
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

  void updateBackgroundShape() {
    bool isSmallScreen = Get.height < 800;
    var heightSize = Get.height;
    if (currentStep.value <= 1) {
      height.value = heightSize * .0415;
      radius.value = Radius.elliptical(900, 300);
      margin.value = EdgeInsets.symmetric(horizontal: Get.width * 0.18);
    } else if (currentStep.value == 2) {
      height.value = isSmallScreen ? heightSize * 0.27 : heightSize * 0.37;
      radius.value = Radius.circular(250);
      margin.value = EdgeInsets.zero;
    } else if (currentStep.value == 3) {
      height.value = isSmallScreen ? heightSize * 0.3725 : heightSize * 0.4725;
      radius.value = Radius.circular(250);
      margin.value = EdgeInsets.zero;
    } else {
      height.value = Get.height;
      radius.value = Radius.circular(250);
      radius.value = Radius.zero;

      Future.delayed(Duration(milliseconds: 750), () async {
        _showFinalView.value = true;
        await Future.delayed(Duration(milliseconds: 250));
        heighClippedContainer.value = Get.height * .82;
        height.value = Get.height * .72;
        margin.value = EdgeInsets.zero;
        radius.value = Radius.elliptical(240, 280);
        _cardAnimationDuration.value = 650;
        _position.value = Offset(Get.width * .25, (Get.height * .9) * .28);
      }).then((value) async {
        await Future.delayed(Duration(milliseconds: 350));
        _bigButtonsPosition.value = Offset(0, 0);
        await Future.delayed(Duration(milliseconds: 450));
        _smallButtonsPosition.value = Offset(0, 0);
        await Future.delayed(Duration(milliseconds: 1500));
        _cardAnimationDuration.value = 0;
        finalAnimationFinished.value = true;
        onTapDisagrementButton();
        await Future.delayed(Durations.long3);
        onTapHalfDisagrementButton();
        await Future.delayed(Durations.long3);
        onTapHalfAgrementButton();
        await Future.delayed(Durations.long3);
        onTapAgrementButton();
        await Future.delayed(Durations.long3);
        Get.toNamed(StatementsController.route,
            arguments: {StringUtils.fromOnboardingKey: true});
      });
      //TODO: init bubble buttons animation
    }
  }

  ////////////////////////
  ///
  /// CARD ANIMATION
  ///
  ////////////////////////

  RxInt _cardAnimationDuration = 0.obs;
  RxInt get cardAnimationDuration => _cardAnimationDuration;

  final RxBool _buttonsBlocked = false.obs;
  bool get buttonsBlocked => _buttonsBlocked.value;

  final Rx<Offset> _position = Offset(0, 0).obs;
  Rx<Offset> get position => _position;

  final Rx<Offset> _bgPosition = Offset(0, 0).obs;
  Rx<Offset> get bgPosition => _bgPosition;

  double _angle = 0;
  double get angle => _angle;
  RxBool _isPanStarted = false.obs;
  RxBool get isPanStarted => _isPanStarted;

  RxBool _disagrementButtonSelected = false.obs;
  bool get disagrementButtonSelected => _disagrementButtonSelected.value;

  RxBool _halfDisagrementButtonSelected = false.obs;
  bool get halfDisagrementButtonSelected =>
      _halfDisagrementButtonSelected.value;

  RxBool _agrementButtonSelected = false.obs;
  bool get agrementButtonSelected => _agrementButtonSelected.value;

  RxBool _halfAgrementButtonSelected = false.obs;
  bool get halfAgrementButtonSelected => _halfAgrementButtonSelected.value;

  RxDouble _cardOpacity = 1.0.obs;
  RxDouble get cardOpacity => _cardOpacity;

  RxInt _currentCardIndex = 0.obs;
  RxInt get currentCardIndex => _currentCardIndex;

  Rx<Offset> _smallButtonsPosition = Offset(0, Get.height * .3).obs;
  Offset get smallButtonsPosition => _smallButtonsPosition.value;
  Rx<Offset> _bigButtonsPosition = Offset(0, Get.height * .3).obs;
  Offset get bigButtonsPosition => _bigButtonsPosition.value;

  @override
  void onInit() {
    updateBackgroundShape();
    _nothingHappen(true);
    super.onInit();
  }

  void onPanStart(DragStartDetails details) {
    _isPanStarted.value = true;
  }

  void onPanUpdate(DragUpdateDetails details) {
    // _checkActionSelected();
    _setAngle(details);
    _position.value += Offset(details.delta.dx * .65, details.delta.dy * .65);

    final opacity = 1 - _position.value.dy.abs() / (Get.height * .9) * .28;
    _cardOpacity.value = opacity.clamp(0, .8);
  }

  void _setAngle(DragUpdateDetails details) {
    final x = _position.value.dx + details.delta.dx;
    final centerX = Get.width * .25;
    final difference = x - centerX;
    _angle = -difference / centerX * 8;
  }

  void onPanEnd(DragEndDetails details) {
    _isPanStarted.value = false;

    _nothingHappen();
  }

  void onTapDown(TapDownDetails details) async {
    changePage(details);
  }

  void changePage(TapDownDetails event) async {
    await Future.delayed(Duration(milliseconds: 100));
    if (_isPanStarted.value) return;
    final isNext = event.localPosition.dx > Get.width / 2;
    if (isNext) {
      if (_currentCardIndex < 3) {
        _currentCardIndex.value++;
      }
    } else {
      if (_currentCardIndex > 0) {
        _currentCardIndex.value--;
      }
    }
  }

  void _nothingHappen([bool initial = false]) async {
    _buttonsBlocked.value = true;
    _cardAnimationDuration.value = 250;
    initial
        ? _position.value = Offset(Get.width * .25, ((Get.height)))
        : _position.value = Offset(Get.width * .25, (Get.height * .9) * .28);
    _bgPosition.value = Offset(Get.width * .25, (Get.height * .9) * .55);
    _cardOpacity.value = 1;
    _angle = 0;
    await Future.delayed(Duration(milliseconds: 250));
    _cardAnimationDuration.value = 0;
    _buttonsBlocked.value = false;
  }

  void onTapDisagrementButton() async {
    _disagrementButtonSelected.value = true;
    await Future.delayed(Durations.long3);
    _disagrementButtonSelected.value = false;
  }

  void onTapHalfDisagrementButton() async {
    _halfDisagrementButtonSelected.value = true;
    await Future.delayed(Durations.long3);
    _halfDisagrementButtonSelected.value = false;
  }

  void onTapHalfAgrementButton() async {
    _halfAgrementButtonSelected.value = true;
    await Future.delayed(Durations.long3);
    _halfAgrementButtonSelected.value = false;
  }

  void onTapAgrementButton() async {
    _agrementButtonSelected.value = true;
    await Future.delayed(Durations.long3);
    _agrementButtonSelected.value = false;
  }
}

enum gender { woman, man, nonBinary, intersex, other, none }
