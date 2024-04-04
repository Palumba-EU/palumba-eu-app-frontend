import 'dart:ui';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:palumba_eu/data/model/card_model.dart';
import 'package:palumba_eu/modules/results/loading/loading_results_controller.dart';
import 'package:palumba_eu/utils/string_utils.dart';

enum _WidthScreenPart { maxLeft, middleLeft, center, middleRight, maxRight }

enum _HeightScreenPart { top, middle, bottom }

enum _Decision { agree, halfAgree, halfDisagree, disagree, neutral, skip }

class StatementsController extends GetxController {
  static const route = '/statements';
  final String cardStackKey = "cardStackKey";

  List<CardModel> cards = CardModel.mockCards;
  List<CardModel> _currentCards = [];
  //List<CardModel> get currentCards => _currentCards;
  CardModel? get firstCard =>
      _currentCards.length > 0 ? _currentCards[0] : null;
  CardModel? get secondCard =>
      _currentCards.length > 1 ? _currentCards[1] : null;

  int _count = 0;
///////////////////////////////////
///////////////////////////////////
/////ANIMATIONS
///////////////////////////////////
//////////////////////////////////
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

  double scrollMaxWidthToDecideInside = Get.width * .25;

  double scrollMaxWidthToDecideOutside = Get.width * .5;

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

  RxBool _fromOnboarding = false.obs;
  bool get fromOnboarding => _fromOnboarding.value;

  @override
  void onInit() {
    final args = Get.arguments;
    if (args != null) {
      try {
        _fromOnboarding.value = args[StringUtils.fromOnboardingKey] as bool;
      } catch (e) {}
    }
    _currentCards = List.from(cards);
    resetAnimation();
    super.onInit();
  }

  void onPanStart(DragStartDetails details) {
    _isPanStarted.value = true;
  }

  void onPanUpdate(DragUpdateDetails details) {
    _checkActionSelected();
    _setAngle(details);
    _position.value += Offset(details.delta.dx * .65, details.delta.dy * .65);
    _setBackgroundCardPosition();

    final opacity = 1 - _position.value.dy.abs() / (Get.height * .9) * .28;
    _cardOpacity.value = opacity.clamp(0, .8);
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
    final decision = _checkActionSelected();
    switch (decision) {
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
    }

    // resetAnimation();
  }

  void _nothingHappen() async {
    _buttonsBlocked.value = true;
    _cardAnimationDuration.value = 250;
    _position.value = Offset(Get.width * .25, (Get.height * .9) * .28);
    _bgPosition.value = Offset(Get.width * .25, (Get.height * .9) * .55);
    _cardOpacity.value = 1;
    _angle = 0;
    await Future.delayed(Duration(milliseconds: 250));
    _cardAnimationDuration.value = 0;
    _buttonsBlocked.value = false;
  }

  void onVerticalDragUpdate(DragUpdateDetails details) {}

  void onTapDown(TapDownDetails details) async {
    changePage(details);
  }

  void resetAnimation() {
    _position.value = Offset(Get.width * .25, (Get.height * .9) * .28);
    _bgPosition.value = Offset(Get.width * .25, (Get.height * .9) * .55);
    _angle = 0;
    _cardAnimationDuration.value = 0;
    _cardOpacity.value = 1;
    _disagrementButtonSelected.value = false;
    _halfDisagrementButtonSelected.value = false;
    _halfAgrementButtonSelected.value = false;
    _agrementButtonSelected.value = false;
    _buttonsBlocked.value = false;
    _currentCardIndex.value = 0;
  }

  _Decision? _checkActionSelected() {
    final widthPart = currentWidthScreeenPart(_position.value.dx);
    final heightPart = currentHeightScreeenPart();

    switch (heightPart) {
      case _HeightScreenPart.bottom:
        switch (widthPart) {
          case _WidthScreenPart.maxLeft:
            _disagrementButtonSelected.value = true;
            _halfDisagrementButtonSelected.value = false;
            _halfAgrementButtonSelected.value = false;
            _agrementButtonSelected.value = false;
            return _Decision.disagree;

          case _WidthScreenPart.middleLeft:
            _disagrementButtonSelected.value = false;
            _halfDisagrementButtonSelected.value =
                (_position.value.dy < Get.height * .35) ? false : true;
            _halfAgrementButtonSelected.value = false;
            _agrementButtonSelected.value = false;
            return (_position.value.dy < Get.height * .35)
                ? null
                : _Decision.halfDisagree;
          case _WidthScreenPart.center:
            return null;
          case _WidthScreenPart.middleRight:
            _disagrementButtonSelected.value = false;
            _halfDisagrementButtonSelected.value = false;
            _halfAgrementButtonSelected.value =
                (_position.value.dy < Get.height * .35) ? false : true;
            _agrementButtonSelected.value = false;
            return (_position.value.dy < Get.height * .35)
                ? null
                : _Decision.halfAgree;
          case _WidthScreenPart.maxRight:
            _disagrementButtonSelected.value = false;
            _halfDisagrementButtonSelected.value = false;
            _halfAgrementButtonSelected.value = false;
            _agrementButtonSelected.value = true;
            return _Decision.agree;
        }
      case _HeightScreenPart.top:
        _disagrementButtonSelected.value = false;
        _halfDisagrementButtonSelected.value = false;
        _halfAgrementButtonSelected.value = false;
        _agrementButtonSelected.value = false;
        return _Decision.neutral;

      default:
        _disagrementButtonSelected.value = false;
        _halfDisagrementButtonSelected.value = false;
        _halfAgrementButtonSelected.value = false;
        _agrementButtonSelected.value = false;
        return null;
    }
  }

  _WidthScreenPart currentWidthScreeenPart(double x) {
    if (x < Get.width * .15) {
      return _WidthScreenPart.maxLeft;
    } else if (x < Get.width * .25) {
      return _WidthScreenPart.middleLeft;
    } else if (x == Get.width * .5) {
      return _WidthScreenPart.center;
    } else if (x < Get.width * .35) {
      return _WidthScreenPart.middleRight;
    } else {
      return _WidthScreenPart.maxRight;
    }
  }

  _HeightScreenPart currentHeightScreeenPart() {
    if (_position.value.dy < Get.height * .15) {
      return _HeightScreenPart.top;
    } else if (_position.value.dy > Get.height * .15 &&
        _position.value.dy < Get.height * .22) {
      return _HeightScreenPart.middle;
    } else {
      return _HeightScreenPart.bottom;
    }
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

  nextCard() async {
    _count++;
    _currentCards.removeAt(0);
    if (_currentCards.length < 3) {
      await Future.delayed(const Duration(milliseconds: 250));
      //TODO: fecth new cards
      // _currentCards += cards;
    }
    update([cardStackKey]);
    resetAnimation();
    if (_fromOnboarding.value) {
      _fromOnboarding.value = false;
    }
    if (_count >= 4) {
      Get.offAllNamed(LoadingResultsController.route);
    }
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
    _disagrementButtonSelected.value = false;
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

  void onSkipTap() {}
}
