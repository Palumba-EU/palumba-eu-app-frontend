import 'dart:async';
import 'dart:ui';
import 'package:flip_card/flip_card_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:palumba_eu/data/manager/data_manager.dart';
import 'package:palumba_eu/data/model/card_model.dart';
import 'package:palumba_eu/data/model/statements_data.dart';
import 'package:palumba_eu/data/model/user_model.dart';
import 'package:palumba_eu/modules/results/loading/loading_results_controller.dart';
import 'package:palumba_eu/modules/statments/helpers/statements_parser_helper.dart';
import 'package:palumba_eu/utils/managers/user_manager.dart';

enum _WidthScreenPart { maxLeft, middleLeft, center, middleRight, maxRight }

enum _HeightScreenPart { top, middle, bottom }

class StatementsController extends GetxController {
  static const route = '/statements';
  final String cardStackKey = "cardStackKey";

  List<CardModel> _allCards = [];
  List<CardModel> _currentCards = [];
  CardModel? get frontCard =>
      _currentCards.length > 0 ? _currentCards[0] : null;
  CardModel? get backCard => _currentCards.length > 1 ? _currentCards[1] : null;

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
  StatementResponse _statementResponse = StatementResponse.neutral;
  StatementResponse get selectedButton => _statementResponse;

//This is front card position
  final Rx<Offset> _frontCardposition = Offset(0, 0).obs;
  Rx<Offset> get frontCardposition => _frontCardposition;

//This is back card position
  final Rx<Offset> _backCardPosition = Offset(0, 0).obs;
  Rx<Offset> get backCardPosition => _backCardPosition;

  final Offset positionDefault =
      Offset(Get.width * .25, (Get.height * .9) * .28);
  final Offset bgPositionDefault =
      Offset(Get.width * .25, (Get.height * .9) * .55);

//This is front card angle
  RxDouble _angle = 0.0.obs;
  double get angle => _angle.value;

//This defines if the pan gesture has started
  RxBool _isPanStarted = false.obs;
  RxBool get isPanStarted => _isPanStarted;

//This define if card is dragged in a buttone zone
  Rxn<StatementResponse> currentDraggedResponseStatement = Rxn();
  Rxn<StatementResponse> selectedResponseStatement = Rxn();

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

  FlipCardController flipCardcontroller = FlipCardController();

  @override
  void onInit() {
    _getArgumentsAndFetch();
    resetAnimation();

    if (UserManager.isTestRunning) {
      final answeredQuestionIds =
          UserManager.userData.answers.map((e) => e.statementId);

      // remove questions that have already been answered
      UserManager.userData.answers.forEach((userAnswer) {
        _currentCards
            .removeWhere((card) => answeredQuestionIds.contains(card.id));
      });
    }

    //Set test is started
    UserManager.setTestRuning(true);
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<void> _getArgumentsAndFetch() async {
    try {
      _statementsData = DataManager().getStatements();
    } catch (e) {}

    _currentCards.addAll(StatementsParser.getCardModelList(statements));
    _currentCards.insert(0, StatementsParser.getIntroCard(Get.context!, true));
    // .toList() makes copy, otherwise just a ref
    _allCards = _currentCards.toList();

    update([cardStackKey]);
    _loadingQuestions.value = false;
  }

  void onPanStart(DragStartDetails details) {
    _isPanStarted.value = true;
  }

  void onPanUpdate(DragUpdateDetails details) {
    currentDraggedResponseStatement.value = _checkActionSelected();
    _setAngle(details);
    _frontCardposition.value +=
        Offset(details.delta.dx * .65, details.delta.dy * .65);
    _setBackgroundCardPosition();
  }

  void _setAngle(DragUpdateDetails details) {
    final x = _frontCardposition.value.dx + details.delta.dx;
    final centerX = Get.width * .25;
    final difference = x - centerX;
    _angle.value = -difference / centerX * 8;
  }

  void _setBackgroundCardPosition() {
    final y = _frontCardposition.value.dy;
    var screeHeight = (Get.height * .9);
    // Calculate the distance from the center of the screen
    final distanceFromCenter = (y - Get.height * .25).abs();
    // Map the distance to the range [(Get.height * .9) * .5, (Get.height * .9) * .25]
    final mappedY = lerpDouble(screeHeight * .55, screeHeight * .25,
        distanceFromCenter / (Get.height * .25));
    final bgY =
        (mappedY ?? y) < screeHeight * .28 ? screeHeight * .28 : mappedY;
    _backCardPosition.value = Offset(Get.width * .25, bgY!);
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
    currentDraggedResponseStatement.value = null;
    switch (decision) {
      case StatementResponse.stronglyAgree:
        return onTapStronglyAgrementButton();
      case StatementResponse.agree:
        return onTapAgrementButton();
      case StatementResponse.disagree:
        return onTapDisagrementButton();
      case StatementResponse.stronglyDisagree:
        return onTapStronglyDisagrementButton();
      case StatementResponse.neutral:
        return onTapNeutralButton();
      default:
        _nothingHappen();
    }
    if (decision != null) {
      storeAnswerData(decision);
    }
  }

//Handle user LongPress, activate button color but not card animation, animation will be triggered when user release the button
  void onLongPressButton(
    StatementResponse? decision,
  ) {
    selectedResponseStatement.value = decision;
  }

//Handle animation after a user drag a card without selecting a button
  void _nothingHappen() async {
    _buttonsBlocked.value = true;
    _cardAnimationDuration.value = 250;
    _frontCardposition.value = positionDefault;
    _backCardPosition.value = bgPositionDefault;
    _angle.value = 0;
    await Future.delayed(Duration(milliseconds: 250));
    _cardAnimationDuration.value = 0;
    _buttonsBlocked.value = false;
  }

//Reset all animations and set cards in the initial position
  void resetAnimation() {
    _frontCardposition.value = positionDefault;
    _backCardPosition.value = bgPositionDefault;
    _angle.value = 0;
    _cardAnimationDuration.value = 0;
    selectedResponseStatement.value = null;
    _buttonsBlocked.value = false;
  }

//When card is dragged handle wich button is selected depending on the part of the screen user drops the card
  StatementResponse? _checkActionSelected() {
    final widthPart = currentWidthScreeenPart(_frontCardposition.value.dx);
    final heightPart = currentHeightScreeenPart();

    switch (heightPart) {
      case _HeightScreenPart.bottom:
        switch (widthPart) {
          case _WidthScreenPart.maxLeft:
            return StatementResponse.stronglyDisagree;
          case _WidthScreenPart.middleLeft:
            return (_frontCardposition.value.dy < Get.height * .35)
                ? null
                : StatementResponse.disagree;
          case _WidthScreenPart.center:
            return null;
          case _WidthScreenPart.middleRight:
            return (_frontCardposition.value.dy < Get.height * .35)
                ? null
                : StatementResponse.agree;
          case _WidthScreenPart.maxRight:
            return StatementResponse.stronglyAgree;
        }
      case _HeightScreenPart.top:
        if (widthPart == _WidthScreenPart.maxRight) {
          return StatementResponse.stronglyAgree;
        } else if (widthPart == _WidthScreenPart.maxLeft) {
          return StatementResponse.stronglyDisagree;
        }
        return StatementResponse.neutral;
      default:
        if (widthPart == _WidthScreenPart.maxRight) {
          return StatementResponse.stronglyAgree;
        } else if (widthPart == _WidthScreenPart.maxLeft) {
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
    if (_frontCardposition.value.dy < Get.height * .15) {
      return _HeightScreenPart.top;
    } else if (_frontCardposition.value.dy > Get.height * .15 &&
        _frontCardposition.value.dy < Get.height * .22) {
      return _HeightScreenPart.middle;
    } else {
      return _HeightScreenPart.bottom;
    }
  }

  nextCard() async {
    _checkIfNeedToShowBanner();
    _currentCards.removeAt(0);
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
    _cardAnimationDuration.value = _cardAnimationTime;
    final x = _frontCardposition.value.dx - (Get.width * .5);
    final centerX = Get.width * .25;
    final difference = x - centerX;
    _angle.value = -difference / centerX * 8;
    _frontCardposition.value =
        Offset(-((Get.width * .5) + 50), Get.height * .4);
    _backCardPosition.value = Offset(Get.width * .25, (Get.height * .9) * .28);
    await Future.delayed(Duration(milliseconds: _awaitAnimationTime));
    _cardAnimationDuration.value = 0;
    _isPanStarted.value = false;
  }

  Future<void> agreeAnimation() async {
    _buttonsBlocked.value = true;
    _isPanStarted.value = true;
    _cardAnimationDuration.value = _cardAnimationTime;
    final x = _frontCardposition.value.dx + (Get.width * .5);
    final centerX = Get.width * .25;
    final difference = x - centerX;
    _angle.value = -difference / centerX * 8;
    _frontCardposition.value = Offset(((Get.width) + 50), Get.height * .4);
    _backCardPosition.value = Offset(Get.width * .25, (Get.height * .9) * .28);
    await Future.delayed(Duration(milliseconds: _awaitAnimationTime));
    _cardAnimationDuration.value = 0;
    _isPanStarted.value = false;
  }

  Future<void> neutralAnimation() async {
    _buttonsBlocked.value = true;
    _isPanStarted.value = true;
    _cardAnimationDuration.value = _cardAnimationTime;

    _frontCardposition.value =
        Offset(_frontCardposition.value.dx, -Get.height * .3);
    _backCardPosition.value = Offset(Get.width * .25, (Get.height * .9) * .28);
    await Future.delayed(Duration(milliseconds: _awaitAnimationTime));
    _cardAnimationDuration.value = 0;
    _isPanStarted.value = false;
  }

  void onTapNeutralButton() async {
    selectedResponseStatement.value = StatementResponse.neutral;
    await neutralAnimation();
    selectedResponseStatement.value = null;
    nextCard();
  }

  void onTapStronglyDisagrementButton() async {
    selectedResponseStatement.value = StatementResponse.stronglyDisagree;
    await disagreeAnimation();
    selectedResponseStatement.value = null;
    nextCard();
  }

  void onTapDisagrementButton() async {
    selectedResponseStatement.value = StatementResponse.disagree;
    await disagreeAnimation();
    selectedResponseStatement.value = null;
    nextCard();
  }

  void onTapAgrementButton() async {
    selectedResponseStatement.value = StatementResponse.agree;
    await agreeAnimation();
    selectedResponseStatement.value = null;
    nextCard();
  }

  void onTapStronglyAgrementButton() async {
    selectedResponseStatement.value = StatementResponse.stronglyAgree;
    await agreeAnimation();
    selectedResponseStatement.value = null;
    nextCard();
  }

  storeAnswerData(StatementResponse answer) {
    if (fromOnboarding) return;
    try {
      UserManager.addStatment(frontCard!.id, answer);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  returnToPreviousCard() {
    if (frontCard == null) {
      debugPrint("front card was null");
      return;
    }

    try {
      final currentIndex = _allCards.indexWhere((e) => e.id == frontCard!.id);

      if (currentIndex >= 1) {
        _currentCards.insert(0, _allCards[currentIndex - 1]);
        resetAnimation();
        update([cardStackKey]);
        UserManager.deleteLastStatement();
      }
    } catch (e) {
      debugPrint("error returnToPreviousCard");
    }
  }
  ////////////////////
  ///
  ///BANNER ANIMATION
  ///
  ////////////////////

  Rx<Offset> _bannerPosition = Offset(0, -(Get.height * .1)).obs;
  Offset get bannerPosition => _bannerPosition.value;

  bool _halfBannerShowed = false;
  bool get halfBannerShowed => _halfBannerShowed;

  RxDouble _bannerOpacity = 0.0.obs;
  double get bannerOpacity => _bannerOpacity.value;

  final bannerDuration = Durations.long4;

  _checkIfNeedToShowBanner() async {
    final allStatementsList = DataManager().getStatements();
    final currentIndex =
        allStatementsList.indexWhere((e) => e.id == frontCard?.id);
    final middleIndex = (allStatementsList.length / 2).floor();
    if (currentIndex == middleIndex) {
      await _showBanner();
      _halfBannerShowed = true;
      return;
    }
    if (currentIndex == allStatementsList.length - 6) {
      await _showBanner();
    }
  }

  Future<void> _showBanner() async {
    _bannerOpacity.value = 1;
    _bannerPosition.value = Offset(0, Get.height * .075);
    await Future.delayed(Duration(milliseconds: 2500));
    _bannerPosition.value = Offset(0, -(Get.height * .1));
    await Future.delayed(bannerDuration);
    _bannerOpacity.value = 0;
  }
}
