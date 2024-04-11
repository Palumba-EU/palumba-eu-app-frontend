import 'dart:ui';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:palumba_eu/data/model/card_model.dart';
import 'package:palumba_eu/data/model/statements_data.dart';
import 'package:palumba_eu/data/model/user_model.dart';
import 'package:palumba_eu/data/repositories/remote/data_repository.dart';
import 'package:palumba_eu/modules/results/loading/loading_results_controller.dart';
import 'package:palumba_eu/modules/statments/helpers/html_parser_helper.dart';
import 'package:palumba_eu/utils/managers/user_manager.dart';
import 'package:palumba_eu/utils/string_utils.dart';

enum _WidthScreenPart { maxLeft, middleLeft, center, middleRight, maxRight }

enum _HeightScreenPart { top, middle, bottom }

class StatementsController extends GetxController {
  static const route = '/statements';
  final String cardStackKey = "cardStackKey";

  final DataRepository _dataRepository = Get.find<DataRepository>();

  List<CardModel?> _currentCards = [];
  CardModel? get firstCard =>
      _currentCards.length > 0 ? _currentCards[0] : null;
  CardModel? get secondCard =>
      _currentCards.length > 1 ? _currentCards[1] : null;

///////////////////////////////////
///////////////////////////////////
/////ANIMATIONS
///////////////////////////////////
//////////////////////////////////
  RxInt _cardAnimationDuration = 0.obs;
  RxInt get cardAnimationDuration => _cardAnimationDuration;

  final RxBool _buttonsBlocked = false.obs;
  bool get buttonsBlocked => _buttonsBlocked.value;

//This is front card position
  final Rx<Offset> _position = Offset(0, 0).obs;
  Rx<Offset> get position => _position;

//This is back card position
  final Rx<Offset> _bgPosition = Offset(0, 0).obs;
  Rx<Offset> get bgPosition => _bgPosition;

//This is front card angle
  double _angle = 0;
  double get angle => _angle;

//This defines if the pan gesture has started
  RxBool _isPanStarted = false.obs;
  RxBool get isPanStarted => _isPanStarted;

//The next 4 variables define
  RxBool _stronglyDisagrementButtonSelected = false.obs;
  bool get StronglyDisagrementButtonSelected =>
      _stronglyDisagrementButtonSelected.value;

  RxBool _disagrementButtonSelected = false.obs;
  bool get disagrementButtonSelected => _disagrementButtonSelected.value;

  RxBool _StronglyAgrementButtonSelected = false.obs;
  bool get StronglyAgrementButtonSelected =>
      _StronglyAgrementButtonSelected.value;

  RxBool _agrementButtonSelected = false.obs;
  bool get agrementButtonSelected => _agrementButtonSelected.value;

  RxDouble _cardOpacity = 1.0.obs;
  RxDouble get cardOpacity => _cardOpacity;

  RxInt _currentCardIndex = 0.obs;
  RxInt get currentCardIndex => _currentCardIndex;

  RxBool _fromOnboarding = false.obs;
  bool get fromOnboarding => _fromOnboarding.value;

  RxBool _loadingQuestions = true.obs;
  bool get loadingQuestions => _loadingQuestions.value;

  StatementsData? _statementsData;
  List<Statement> get statements => _statementsData?.data ?? [];

  @override
  void onInit() {
    _getArgumentsAndFetch();
    resetAnimation();
    super.onInit();
  }

  Future<void> _getArgumentsAndFetch() async {
    final args = Get.arguments;

    try {
      _fromOnboarding.value = args[StringUtils.fromOnboardingKey] as bool;
      _currentCards.add(null);
    } catch (e) {}
    try {
      final argStatments =
          args[StringUtils.statementsDataKey] as Map<String, dynamic>;
      _statementsData = StatementsData.fromJson(argStatments);
    } catch (e) {}
    if (_statementsData == null) {
      await _fetchStatements();
    }

    _currentCards.addAll(HtmlStatementsParser.getCardModelList(statements));
    update([cardStackKey]);
    _loadingQuestions.value = false;
  }

  Future<void> _fetchStatements() async {
    final result = await _dataRepository.fetchStatements();
    if (result != null) {
      _statementsData = result;
    }
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
    activateButton(decision);
  }

  void activateButton(StatementResponse? decision) {
    switch (decision) {
      case StatementResponse.stronglyAgree:
        onTapStronglyAgrementButton();
        break;
      case StatementResponse.agree:
        onTapAgrementButton();
        break;
      case StatementResponse.disagree:
        onTapDisagrementButton();
        break;
      case StatementResponse.stronglyDisagree:
        onTapStronglyDisagrementButton();
        break;
      case StatementResponse.neutral:
        onTapNeutralButton();
        break;
      default:
        _nothingHappen();
      // resetAnimation();
    }
    if (decision != null) {
      storeAnswerData(decision);
    }
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
    _stronglyDisagrementButtonSelected.value = false;
    _disagrementButtonSelected.value = false;
    _agrementButtonSelected.value = false;
    _StronglyAgrementButtonSelected.value = false;
    _buttonsBlocked.value = false;
    _currentCardIndex.value = 0;
  }

  StatementResponse? _checkActionSelected() {
    final widthPart = currentWidthScreeenPart(_position.value.dx);
    final heightPart = currentHeightScreeenPart();

    switch (heightPart) {
      case _HeightScreenPart.bottom:
        switch (widthPart) {
          case _WidthScreenPart.maxLeft:
            _stronglyDisagrementButtonSelected.value = true;
            _disagrementButtonSelected.value = false;
            _agrementButtonSelected.value = false;
            _StronglyAgrementButtonSelected.value = false;
            return StatementResponse.stronglyDisagree;

          case _WidthScreenPart.middleLeft:
            _stronglyDisagrementButtonSelected.value = false;
            _disagrementButtonSelected.value =
                (_position.value.dy < Get.height * .35) ? false : true;
            _agrementButtonSelected.value = false;
            _StronglyAgrementButtonSelected.value = false;
            return (_position.value.dy < Get.height * .35)
                ? null
                : StatementResponse.disagree;
          case _WidthScreenPart.center:
            return null;
          case _WidthScreenPart.middleRight:
            _stronglyDisagrementButtonSelected.value = false;
            _disagrementButtonSelected.value = false;
            _agrementButtonSelected.value =
                (_position.value.dy < Get.height * .35) ? false : true;
            _StronglyAgrementButtonSelected.value = false;
            return (_position.value.dy < Get.height * .35)
                ? null
                : StatementResponse.agree;
          case _WidthScreenPart.maxRight:
            _stronglyDisagrementButtonSelected.value = false;
            _disagrementButtonSelected.value = false;
            _agrementButtonSelected.value = false;
            _StronglyAgrementButtonSelected.value = true;
            return StatementResponse.stronglyAgree;
        }
      case _HeightScreenPart.top:
        _stronglyDisagrementButtonSelected.value = false;
        _disagrementButtonSelected.value = false;
        _agrementButtonSelected.value = false;
        _StronglyAgrementButtonSelected.value = false;
        return StatementResponse.neutral;

      default:
        _stronglyDisagrementButtonSelected.value = false;
        _disagrementButtonSelected.value = false;
        _agrementButtonSelected.value = false;
        _StronglyAgrementButtonSelected.value = false;
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
      if (_currentCardIndex < 2) {
        _currentCardIndex.value++;
      }
    } else {
      if (_currentCardIndex > 0) {
        _currentCardIndex.value--;
      }
    }
  }

  nextCard() async {
    _currentCards.removeAt(0);
    /*  if (_currentCards.length < 3) {
      await Future.delayed(const Duration(milliseconds: 250));
      //TODO: fecth new cards
      // _currentCards += cards;
    }*/
    update([cardStackKey]);
    resetAnimation();
    if (_fromOnboarding.value) {
      _fromOnboarding.value = false;
    }
    if (_currentCards.length <= 0) {
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
    nextCard();
  }

  void onTapStronglyDisagrementButton() async {
    _stronglyDisagrementButtonSelected.value = true;
    await disagreeAnimation();
    _stronglyDisagrementButtonSelected.value = false;
    nextCard();
  }

  void onTapDisagrementButton() async {
    _disagrementButtonSelected.value = true;
    await disagreeAnimation();
    _disagrementButtonSelected.value = false;
    nextCard();
  }

  void onTapAgrementButton() async {
    _agrementButtonSelected.value = true;
    await agreeAnimation();
    _agrementButtonSelected.value = false;
    nextCard();
  }

  void onTapStronglyAgrementButton() async {
    _StronglyAgrementButtonSelected.value = true;
    await agreeAnimation();
    _StronglyAgrementButtonSelected.value = false;
    nextCard();
  }

  storeAnswerData(StatementResponse answer) {
    if (fromOnboarding) return;
    try {
      UserManager.addStatment(firstCard!.id!, answer);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  void onSkipTap() {}
}
