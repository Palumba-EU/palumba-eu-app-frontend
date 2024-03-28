import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:palumba_eu/data/model/card_model.dart';
import 'package:palumba_eu/modules/welcome/language/models/language_data.dart';
import 'package:palumba_eu/utils/managers/i18n_manager/translations/generated/l10n.dart';

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
    var heightSize = Get.height;
    if (currentStep.value == 1) {
      height.value = heightSize * 0.065;
      radius.value = Radius.elliptical(500, 250);
      margin.value = EdgeInsets.symmetric(horizontal: Get.width * 0.2);
    } else if (currentStep.value == 2) {
      height.value = heightSize * 0.37;
      radius.value = Radius.circular(250);
      margin.value = EdgeInsets.zero;
    } else if (currentStep.value == 3) {
      height.value = heightSize * 0.4725;
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
        await Future.delayed(Duration(milliseconds: 2000));
        _cardAnimationDuration.value = 0;
        finalAnimationFinished.value = true;
      });
      //TODO: init bubble buttons animation
    }
  }

  ////////////////////////
  ///
  /// CARD ANIMATION
  ///
  ////////////////////////
  List<CardModel> cards = [
    CardModel(
        id: 'Card01',
        main: 'Whistleblowers* should be protected no matter what they reveal.',
        whistleblowe:
            '️‍An individual who exposes wrongdoing, corruption, or unethical behavior within an organization or institution to the public or authorities, often at great personal risk. (Oxford Dictionary)',
        context:
            'Since a few years, several individuals have revealed key internal information about the wrongdoings of their organisations. This led to massive scandals about the safety of those whistleblowers and their responsibility before the law. Therefore, the EU passed the Whistleblower Directive to regulate this practice in our democracies.',
        favorArgs: 'Cooming soon',
        againstArgs: 'Cooming soon'),
    CardModel(
        id: 'Card02',
        main:
            'Card 2 Whistleblowers* should be protected no matter what they reveal.',
        whistleblowe:
            '️‍An individual who exposes wrongdoing, corruption, or unethical behavior within an organization or institution to the public or authorities, often at great personal risk. (Oxford Dictionary)',
        context:
            'Since a few years, several individuals have revealed key internal information about the wrongdoings of their organisations. This led to massive scandals about the safety of those whistleblowers and their responsibility before the law. Therefore, the EU passed the Whistleblower Directive to regulate this practice in our democracies.',
        favorArgs: 'Cooming soon',
        againstArgs: 'Cooming soon'),
    CardModel(
        id: 'Card03',
        main:
            'Card 3 Whistleblowers* should be protected no matter what they reveal.',
        whistleblowe:
            '️‍An individual who exposes wrongdoing, corruption, or unethical behavior within an organization or institution to the public or authorities, often at great personal risk. (Oxford Dictionary)',
        context:
            'Since a few years, several individuals have revealed key internal information about the wrongdoings of their organisations. This led to massive scandals about the safety of those whistleblowers and their responsibility before the law. Therefore, the EU passed the Whistleblower Directive to regulate this practice in our democracies.',
        favorArgs: 'Cooming soon',
        againstArgs: 'Cooming soon')
  ];
  List<CardModel> _currentCards = [];
  //List<CardModel> get currentCards => _currentCards;
  CardModel? get firstCard =>
      _currentCards.length > 0 ? _currentCards[0] : null;
  CardModel? get secondCard =>
      _currentCards.length > 1 ? _currentCards[1] : null;
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

  double _cardOpacity = 1;
  double get cardOpacity => _cardOpacity;

  RxInt _currentCardIndex = 0.obs;
  RxInt get currentCardIndex => _currentCardIndex;

  @override
  void onInit() {
    _currentCards = List.from(cards);
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
    _setBackgroundCardPosition();

    final opacity = 1 - _position.value.dy.abs() / (Get.height * .9) * .28;
    _cardOpacity = opacity.clamp(0, .8);
  }

  void _setAngle(DragUpdateDetails details) {
    final x = _position.value.dx + details.delta.dx;
    final centerX = Get.width * .25;
    final difference = x - centerX;
    _angle = -difference / centerX * 8;
  }

  void _setBackgroundCardPosition() {
    final y = _position.value.dy;
    // Calculate the distance from the center of the screen
    final distanceFromCenter = (y - Get.height * .25).abs();
    // Map the distance to the range [(Get.height * .9) * .5, (Get.height * .9) * .25]
    final mappedY = lerpDouble((Get.height * .9) * .55, (Get.height * .9) * .25,
        distanceFromCenter / (Get.height * .25));
    final bgY = (mappedY ?? y) < (Get.height * .9) * .28
        ? (Get.height * .9) * .28
        : mappedY;
    _bgPosition.value = Offset(Get.width * .25, bgY!);
  }

  void onPanEnd(DragEndDetails details) {
    _isPanStarted.value = false;
    // final decision = _checkActionSelected();
    /* switch (decision) {
      case _Decision.agree:
        onTapAgrementButton();

        break;
      case _Decision.halfAgree:
        onTapHalfAgrementButton();
        break;
      case _Decision.halfDisagree:
        onTapHalfDisagrementButton();
        break;
      case _Decision.disagree:
        onTapDisagrementButton();
        break;
      case _Decision.neutral:
        onTapNeutralButton();
        break;
      default:
        _nothingHappen();
      // resetAnimation();
    }*/

    // resetAnimation();
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
    _cardOpacity = 1;
    _angle = 0;
    await Future.delayed(Duration(milliseconds: 250));
    _cardAnimationDuration.value = 0;
    _buttonsBlocked.value = false;
  }

  nextCard() async {
    _currentCards.removeAt(0);
    if (_currentCards.length < 3) {
      await Future.delayed(const Duration(milliseconds: 250));
      //TODO: fecth new cards
      _currentCards += cards;
    }
    //update([cardStackKey]);
    // resetAnimation();
  }

  Future<void> disagreeAnimation() async {
    _buttonsBlocked.value = true;
    _isPanStarted.value = true;
    _cardAnimationDuration.value = 600;
    final x = _position.value.dx - (Get.width * .5);
    final centerX = Get.width * .25;
    final difference = x - centerX;
    _angle = -difference / centerX * 8;
    _position.value = Offset(-((Get.width * .5) + 50), Get.height * .4);
    _bgPosition.value = Offset(Get.width * .25, (Get.height * .9) * .28);
    await Future.delayed(const Duration(milliseconds: 650));
    _cardAnimationDuration.value = 0;
    _isPanStarted.value = false;
  }

  Future<void> agreeAnimation() async {
    _buttonsBlocked.value = true;
    _isPanStarted.value = true;
    _cardAnimationDuration.value = 600;
    final x = _position.value.dx + (Get.width * .5);
    final centerX = Get.width * .25;
    final difference = x - centerX;
    _angle = -difference / centerX * 8;
    _position.value = Offset(((Get.width) + 50), Get.height * .4);
    _bgPosition.value = Offset(Get.width * .25, (Get.height * .9) * .28);
    await Future.delayed(const Duration(milliseconds: 650));
    _cardAnimationDuration.value = 0;
    _isPanStarted.value = false;
  }

  Future<void> neutralAnimation() async {
    _buttonsBlocked.value = true;
    _isPanStarted.value = true;
    _cardAnimationDuration.value = 600;

    _position.value = Offset(_position.value.dx, -Get.height * .3);
    _bgPosition.value = Offset(Get.width * .25, (Get.height * .9) * .28);
    await Future.delayed(const Duration(milliseconds: 650));
    _cardAnimationDuration.value = 0;
    _isPanStarted.value = false;
  }

  void onTapNeutralButton() async {
    await neutralAnimation();
    //TODO: send to api
    nextCard();
  }

  void onTapDisagrementButton() async {
    _disagrementButtonSelected.value = true;
    await disagreeAnimation();
    //TODO: send to api
    _disagrementButtonSelected.value = true;
    nextCard();
  }

  void onTapHalfDisagrementButton() async {
    _halfDisagrementButtonSelected.value = true;
    await disagreeAnimation();
    //TODO: send to api
    _halfDisagrementButtonSelected.value = false;
    nextCard();
  }

  void onTapHalfAgrementButton() async {
    _halfAgrementButtonSelected.value = true;
    await agreeAnimation();
    //TODO: send to api
    _halfAgrementButtonSelected.value = false;
    nextCard();
  }

  void onTapAgrementButton() async {
    _agrementButtonSelected.value = true;
    await agreeAnimation();
    //TODO: send to api
    _agrementButtonSelected.value = false;
    nextCard();
  }
}

enum gender { woman, man, nonBinary, intersex, other, none }
