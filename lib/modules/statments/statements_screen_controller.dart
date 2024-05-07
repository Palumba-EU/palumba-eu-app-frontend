import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:palumba_eu/data/manager/data_manager.dart';
import 'package:palumba_eu/data/model/card_model.dart';
import 'package:palumba_eu/data/model/statements_data.dart';
import 'package:palumba_eu/data/model/user_model.dart';
import 'package:palumba_eu/data/repositories/remote/data_repository.dart';
import 'package:palumba_eu/modules/results/loading/loading_results_controller.dart';
import 'package:palumba_eu/modules/statments/helpers/statements_parser_helper.dart';
import 'package:palumba_eu/utils/common_ui/app_colors.dart';
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

//Flag to decide if previous button is shown or not
  RxBool _previousCardButtonActivated = false.obs;
  RxBool get previousCardButtonActivated => _previousCardButtonActivated;

///////////////////////////////////
///////////////////////////////////
/////ANIMATIONS
///////////////////////////////////
//////////////////////////////////
  RxInt _cardAnimationDuration = 0.obs;
  RxInt get cardAnimationDuration => _cardAnimationDuration;

  final RxBool _buttonsBlocked = false.obs;
  bool get buttonsBlocked => _buttonsBlocked.value;

//Selected button type
  StatementResponse _statementResponse = StatementResponse.skip;
  StatementResponse get selectedButton => _statementResponse;

//This is front card position
  final Rx<Offset> _position = Offset(0, 0).obs;
  Rx<Offset> get position => _position;

//This is back card position
  final Rx<Offset> _bgPosition = Offset(0, 0).obs;
  Rx<Offset> get bgPosition => _bgPosition;

//This is front card angle
  RxDouble _angle = 0.0.obs;
  double get angle => _angle.value;

//This defines if the pan gesture has started
  RxBool _isPanStarted = false.obs;
  RxBool get isPanStarted => _isPanStarted;

//This define if card is dragged in a buttone zone
  RxBool _isZoneButtonEntered = false.obs;
  RxBool get isZoneButtonEntered => _isZoneButtonEntered;

//The next 5 variables define wich button is Selected
  RxBool _stronglyDisagrementButtonSelected = false.obs;
  bool get stronglyDisagrementButtonSelected =>
      _stronglyDisagrementButtonSelected.value;

  RxBool _disagrementButtonSelected = false.obs;
  bool get disagrementButtonSelected => _disagrementButtonSelected.value;

  RxBool _stronglyAgrementButtonSelected = false.obs;
  bool get stronglyAgrementButtonSelected =>
      _stronglyAgrementButtonSelected.value;

  RxBool _agrementButtonSelected = false.obs;
  bool get agrementButtonSelected => _agrementButtonSelected.value;

  RxBool _neutralButtonSelected = false.obs;
  bool get neutralButtonSelected => _neutralButtonSelected.value;

  RxInt _currentCardIndex = 0.obs;
  RxInt get currentCardIndex => _currentCardIndex;

  RxBool _fromOnboarding = false.obs;
  bool get fromOnboarding => _fromOnboarding.value;

  RxBool _loadingQuestions = true.obs;
  bool get loadingQuestions => _loadingQuestions.value;

  List<Statement>? _statementsData;
  List<Statement> get statements => _statementsData ?? [];

  RxDouble _scale = 1.0.obs;
  RxDouble get scale => _scale;

  int _cardAnimationTime = 300;
  int _awaitAnimationTime = 325;

  @override
  void onInit() {
    clearUserStoredStatements();
    _getArgumentsAndFetch();
    resetAnimation();
    //Set test is started
    UserManager.setTestRuning(true);
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void clearUserStoredStatements() {
    UserManager.clearAllStatements();
  }

  Future<void> _getArgumentsAndFetch() async {
    final args = Get.arguments;

    try {
      _fromOnboarding.value = args[StringUtils.fromOnboardingKey] as bool;
      _currentCards.add(null);
      _loadingQuestions.value = false;
    } catch (e) {}
    try {
      _statementsData = DataManager().getStatements();
    } catch (e) {}
    if (_statementsData == null) {
      await _fetchStatements();
    }

    _currentCards.addAll(StatementsParser.getCardModelList(statements));
    update([cardStackKey]);
    _loadingQuestions.value = false;
  }

  Future<void> _fetchStatements() async {
    final result = await _dataRepository.fetchStatements();
    if (result != null) {
      _statementsData = result.data ?? [];
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
  }

  void _setAngle(DragUpdateDetails details) {
    final x = _position.value.dx + details.delta.dx;
    final centerX = Get.width * .25;
    final difference = x - centerX;
    _angle.value = -difference / centerX * 8;
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

//Decide wich button to activate
  void activateButton(
    StatementResponse? decision,
  ) {
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
      case StatementResponse.skip:
        onSkipTap();
        break;
      default:
        _nothingHappen();
      // resetAnimation();
    }
    if (decision != null) {
      storeAnswerData(decision);
    }
  }

//Handle user LongPress, activate button color but not card animation, animation will be triggered when user release the button
  void onLongPressButton(
    StatementResponse? decision,
  ) {
    switch (decision) {
      case StatementResponse.stronglyAgree:
        _stronglyAgrementButtonSelected.value = true;

        break;
      case StatementResponse.agree:
        _agrementButtonSelected.value = true;
        break;
      case StatementResponse.disagree:
        _disagrementButtonSelected.value = true;
        break;
      case StatementResponse.stronglyDisagree:
        _stronglyDisagrementButtonSelected.value = true;
        break;
      case StatementResponse.neutral:
        break;
      default:
        break;
    }
  }

//Handle animation after a user drag a card without selecting a button
  void _nothingHappen() async {
    _buttonsBlocked.value = true;
    _cardAnimationDuration.value = 250;
    _position.value = Offset(Get.width * .25, (Get.height * .9) * .28);
    _bgPosition.value = Offset(Get.width * .25, (Get.height * .9) * .55);
    _angle.value = 0;
    await Future.delayed(Duration(milliseconds: 250));
    _cardAnimationDuration.value = 0;
    _buttonsBlocked.value = false;
  }

  void onTapDown(TapDownDetails details) async {
    changeCardPage(details);
  }

//Reset all animations and set cards in the initial position
  void resetAnimation() {
    _position.value = Offset(Get.width * .25, (Get.height * .9) * .28);
    _bgPosition.value = Offset(Get.width * .25, (Get.height * .9) * .55);
    _angle.value = 0;
    _cardAnimationDuration.value = 0;
    _stronglyDisagrementButtonSelected.value = false;
    _disagrementButtonSelected.value = false;
    _agrementButtonSelected.value = false;
    _stronglyAgrementButtonSelected.value = false;
    _buttonsBlocked.value = false;
    _currentCardIndex.value = 0;
  }

//When card is dragged handle wich button is selected depending on the part of the screen user drops the card
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
            _stronglyAgrementButtonSelected.value = false;
            _isZoneButtonEntered.value = true;
            return StatementResponse.stronglyDisagree;

          case _WidthScreenPart.middleLeft:
            _stronglyDisagrementButtonSelected.value = false;
            _disagrementButtonSelected.value =
                (_position.value.dy < Get.height * .35) ? false : true;
            _agrementButtonSelected.value = false;
            _stronglyAgrementButtonSelected.value = false;
            _isZoneButtonEntered.value =
                (_position.value.dy < Get.height * .35) ? false : true;
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
            _stronglyAgrementButtonSelected.value = false;
            _isZoneButtonEntered.value =
                (_position.value.dy < Get.height * .35) ? false : true;
            return (_position.value.dy < Get.height * .35)
                ? null
                : StatementResponse.agree;
          case _WidthScreenPart.maxRight:
            _stronglyDisagrementButtonSelected.value = false;
            _disagrementButtonSelected.value = false;
            _agrementButtonSelected.value = false;
            _stronglyAgrementButtonSelected.value = true;
            _isZoneButtonEntered.value = true;
            return StatementResponse.stronglyAgree;
        }
      case _HeightScreenPart.top:
        _stronglyDisagrementButtonSelected.value = false;
        _disagrementButtonSelected.value = false;
        _agrementButtonSelected.value = false;
        _stronglyAgrementButtonSelected.value = false;
        _isZoneButtonEntered.value = true;
        if (widthPart == _WidthScreenPart.maxRight) {
          _neutralButtonSelected.value = false;
          _stronglyAgrementButtonSelected.value = true;
          return StatementResponse.stronglyAgree;
        } else if (widthPart == _WidthScreenPart.maxLeft) {
          _neutralButtonSelected.value = false;
          _stronglyDisagrementButtonSelected.value = true;

          return StatementResponse.stronglyDisagree;
        }
        _neutralButtonSelected.value = true;
        return StatementResponse.neutral;

      default:
        _stronglyDisagrementButtonSelected.value = false;
        _disagrementButtonSelected.value = false;
        _agrementButtonSelected.value = false;
        _stronglyAgrementButtonSelected.value = false;
        _neutralButtonSelected.value = false;
        _isZoneButtonEntered.value = false;
        if (widthPart == _WidthScreenPart.maxRight) {
          _neutralButtonSelected.value = false;
          _stronglyAgrementButtonSelected.value = true;
          _isZoneButtonEntered.value = true;
          return StatementResponse.stronglyAgree;
        } else if (widthPart == _WidthScreenPart.maxLeft) {
          _neutralButtonSelected.value = false;
          _stronglyDisagrementButtonSelected.value = true;
          _isZoneButtonEntered.value = true;
          return StatementResponse.stronglyDisagree;
        }
        return null;
    }
  }

//Define wich part of the screen the user is dragging the card
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

  void changeCardPage(TapDownDetails event) async {
    await Future.delayed(Duration(milliseconds: 100));
    if (_isPanStarted.value) return;
    final tapPos = event.localPosition.dx;
    final isNext = tapPos > Get.width * .65;
    final isPrevious = tapPos < Get.width * .35;

    if (isNext) {
      if (_currentCardIndex < 1) {
        _currentCardIndex.value++;
      }
    }
    if (isPrevious) {
      if (_currentCardIndex > 0) {
        _currentCardIndex.value--;
      }
    }
  }

  nextCard() async {
    _currentCards.removeAt(0);
    update([cardStackKey]);
    resetAnimation();
    if (_fromOnboarding.value) {
      _fromOnboarding.value = false;
    }
    if (_currentCards.length <= 0) {
      Get.offAllNamed(LoadingResultsController.route);
    }
    _previousCardButtonActivated.value = true;
  }

  Future<void> disagreeAnimation() async {
    _buttonsBlocked.value = true;
    _isPanStarted.value = true;
    _cardAnimationDuration.value = _cardAnimationTime;
    final x = _position.value.dx - (Get.width * .5);
    final centerX = Get.width * .25;
    final difference = x - centerX;
    _angle.value = -difference / centerX * 8;
    _position.value = Offset(-((Get.width * .5) + 50), Get.height * .4);
    _bgPosition.value = Offset(Get.width * .25, (Get.height * .9) * .28);
    await Future.delayed(Duration(milliseconds: _awaitAnimationTime));
    _cardAnimationDuration.value = 0;
    _isPanStarted.value = false;
  }

  Future<void> agreeAnimation() async {
    _buttonsBlocked.value = true;
    _isPanStarted.value = true;
    _cardAnimationDuration.value = _cardAnimationTime;
    final x = _position.value.dx + (Get.width * .5);
    final centerX = Get.width * .25;
    final difference = x - centerX;
    _angle.value = -difference / centerX * 8;
    _position.value = Offset(((Get.width) + 50), Get.height * .4);
    _bgPosition.value = Offset(Get.width * .25, (Get.height * .9) * .28);
    await Future.delayed(Duration(milliseconds: _awaitAnimationTime));
    _cardAnimationDuration.value = 0;
    _isPanStarted.value = false;
  }

  Future<void> neutralAnimation() async {
    _buttonsBlocked.value = true;
    _isPanStarted.value = true;
    _cardAnimationDuration.value = _cardAnimationTime;

    _position.value = Offset(_position.value.dx, -Get.height * .3);
    _bgPosition.value = Offset(Get.width * .25, (Get.height * .9) * .28);
    await Future.delayed(Duration(milliseconds: _awaitAnimationTime));
    _cardAnimationDuration.value = 0;
    _isPanStarted.value = false;
  }

  void onTapNeutralButton() async {
    _neutralButtonSelected.value = true;
    await neutralAnimation();
    _neutralButtonSelected.value = false;
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
    _stronglyAgrementButtonSelected.value = true;
    await agreeAnimation();
    _stronglyAgrementButtonSelected.value = false;
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

  void onSkipTap() async {
    _scale.value = 0.0;
    await Future.delayed(Durations.medium1);
    await neutralAnimation();
    _scale.value = 1.0;

    nextCard();
  }

  returnToPreviousCard() {
    try {
      final allStatementsList = DataManager().getStatements();
      final currentIndex =
          allStatementsList.indexWhere((e) => e.id == firstCard!.id);

      if (currentIndex >= 1) {
        _currentCards.insert(
            0,
            StatementsParser.getCardModelList(
                allStatementsList)[currentIndex - 1]);
        resetAnimation();
        update([cardStackKey]);
        UserManager.deleteLastStatement();
      }

      if (currentIndex == 1) {
        _previousCardButtonActivated.value = false;
      }
    } catch (e) {}
  }

  Color getBackgroundColor() {
    if (neutralButtonSelected) {
      return AppColors.lightPrimary;
    } else if (stronglyAgrementButtonSelected) {
      return AppColors.green;
    } else if (agrementButtonSelected) {
      return AppColors.lightGreen;
    } else if (stronglyDisagrementButtonSelected) {
      return AppColors.yellow;
    } else if (disagrementButtonSelected) {
      return AppColors.lightYellow;
    } else {
      return AppColors.lightPrimary;
    }
  }
}
