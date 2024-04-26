import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:palumba_eu/data/manager/data_manager.dart';
import 'package:palumba_eu/data/model/card_model.dart';
import 'package:palumba_eu/data/model/localization_data.dart';
import 'package:palumba_eu/data/repositories/local/local_data_repository.dart';
import 'package:palumba_eu/modules/statments/helpers/statements_parser_helper.dart';
import 'package:palumba_eu/modules/statments/statements_screen_controller.dart';
import 'package:palumba_eu/utils/common_ui/app_colors.dart';
import 'package:palumba_eu/utils/managers/i18n_manager/translations/generated/l10n.dart';
import 'package:palumba_eu/utils/managers/user_manager.dart';
import 'package:palumba_eu/utils/string_utils.dart';

class OnboardingController extends GetxController {
  static const route = '/onboarding';

  //final DataRepository _dataRepository = Get.find<DataRepository>();

  final LocalDataRepository _localDataRepository =
      Get.find<LocalDataRepository>();

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

  bool _isOnBoardingCard = false;
  bool get isOnBoardingCard => _isOnBoardingCard;

  CardModel? _cardData;
  CardModel? get cardData => _cardData;

  get startAnimation => _startAnimation.value;

  ///Step1
  List<Country>? _countries = DataManager().getCountries();

  List<Country>? get countries => _countries;

  RxInt indexCountrySelected = (-1).obs;

  RxBool _showFinalView = false.obs;

  bool get showFinalView => _showFinalView.value;

  ///Step2
  final int minAge = 16;
  final int maxAge = 115;

  RxInt indexAgeSelected = (-1).obs;

  ///Step3
  final List<GenderModel> _genders = [
    GenderModel(
        name: S.of(Get.context!).onBoardingStep3Option1,
        genderEnum: gender.woman),
    GenderModel(
        name: S.of(Get.context!).onBoardingStep3Option2,
        genderEnum: gender.man),
    GenderModel(
        name: S.of(Get.context!).onBoardingStep3Option3,
        genderEnum: gender.genderFluid),
    GenderModel(
        name: S.of(Get.context!).onBoardingStep3Option4,
        genderEnum: gender.nonBinary),
    GenderModel(
        name: S.of(Get.context!).onBoardingStep3Option5,
        genderEnum: gender.other),
  ];

  List<String> get genders => _genders.map((gender) => gender.name).toList();

  RxInt indexGenderSelected = (-1).obs;

  //Step 4
  RxBool _showLastStepTitle = false.obs;
  bool get showLastStepTitle => _showLastStepTitle.value;

  @override
  void onInit() {
    updateBackgroundShape();
    _initialCardPosition(true);
    super.onInit();
  }

  /**
   * On Click Actions
   */
  void onCountryPressed(int index) {
    if (index == -1) {
      onContinueTap();
      return;
    }
    UserManager.setCountryId(_countries![index]);
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

  void notAnsweredContinue() {
    if (currentStep.value == 2) {
      UserManager.setAge(null);
    } else if (currentStep.value == 3) {
      UserManager.setGender(null);
    }
    onContinueTap();
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
    updateBackgroundShape();
    isButtonEnabled.value =
        currentStep.value == 1 && indexCountrySelected.value != -1 ||
            currentStep.value == 2 && indexAgeSelected.value != -1 ||
            currentStep.value == 3 && indexGenderSelected.value != -1;
  }

  void updateBackgroundShape() async {
    //Update the background shape
    bool isSmallScreen = Get.height < 800;
    var heightSize = Get.height;
    if (currentStep.value <= 1) {
      //
      height.value = 34; //heightSize * .0415;
      radius.value = Radius.elliptical(900, 380);
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
      final onBoarded = await _localDataRepository.onBoarded;
      _isOnBoardingCard = onBoarded != true;
      if (onBoarded == true) {
        try {
          _cardData =
              StatementsParser.getCardModelList(DataManager().statements!)
                  .first;
        } catch (e) {
          debugPrint(e.toString());
        }
      }

      //When shape reach bottom of the screen we activate the rise card and buttons animation
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
        _showLastStepTitle.value = true;
        await Future.delayed(Duration(milliseconds: 350));
        _bigButtonsPosition.value = Offset(0, 0);
        await Future.delayed(Duration(milliseconds: 450));
        _smallButtonsPosition.value = Offset(0, 0);
        await Future.delayed(Duration(milliseconds: 1500));
        _cardAnimationDuration.value = 0;
        finalAnimationFinished.value = true;
        if (onBoarded != true) {
          //If is already on boarded return to home page
          Get.offAllNamed(StatementsController.route);
          return;
        }
        onTapDisagrementButton();
        await Future.delayed(Durations.long3);
        onTapHalfDisagrementButton();
        await Future.delayed(Durations.long3);
        onTapHalfAgrementButton();
        await Future.delayed(Durations.long3);
        onTapAgrementButton();
        await Future.delayed(Durations.long3);

        //Set onBoarding as showed
        _localDataRepository.onBoarded = true;

        //Finally when animation finish we navigate to statments screen
        Get.offAllNamed(StatementsController.route, arguments: {
          StringUtils.fromOnboardingKey: true,
        });
      });
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

  RxBool _strognlyDisagrementButtonSelected = false.obs;
  bool get stronglyDisagrementButtonSelected =>
      _strognlyDisagrementButtonSelected.value;

  RxBool _disagrementButtonSelected = false.obs;
  bool get disagrementButtonSelected => _disagrementButtonSelected.value;

  RxBool _stronglyAgrementButtonSelected = false.obs;
  bool get stronglyAgrementButtonSelected =>
      _stronglyAgrementButtonSelected.value;

  RxBool _agrementButtonSelected = false.obs;
  bool get agrementButtonSelected => _agrementButtonSelected.value;

  Rx<Offset> _smallButtonsPosition = Offset(0, Get.height * .3).obs;
  Offset get smallButtonsPosition => _smallButtonsPosition.value;
  Rx<Offset> _bigButtonsPosition = Offset(0, Get.height * .3).obs;
  Offset get bigButtonsPosition => _bigButtonsPosition.value;

  void _initialCardPosition([bool initial = false]) async {
    _buttonsBlocked.value = true;
    _cardAnimationDuration.value = 250;
    initial
        ? _position.value = Offset(Get.width * .25, ((Get.height)))
        : _position.value = Offset(Get.width * .25, (Get.height * .9) * .28);
    _bgPosition.value = Offset(Get.width * .25, (Get.height * .9) * .55);

    _angle = 0;
    await Future.delayed(Duration(milliseconds: 250));
    _cardAnimationDuration.value = 0;
    _buttonsBlocked.value = false;
  }

  void onTapDisagrementButton() async {
    //Fake button is tapped
    _strognlyDisagrementButtonSelected.value = true;
    await Future.delayed(Durations.long3);
    _strognlyDisagrementButtonSelected.value = false;
  }

  void onTapHalfDisagrementButton() async {
    //Fake button is tapped
    _disagrementButtonSelected.value = true;
    await Future.delayed(Durations.long3);
    _disagrementButtonSelected.value = false;
  }

  void onTapHalfAgrementButton() async {
    //Fake button is tapped
    _agrementButtonSelected.value = true;
    await Future.delayed(Durations.long3);
    _agrementButtonSelected.value = false;
  }

  void onTapAgrementButton() async {
    //Fake button is tapped
    _stronglyAgrementButtonSelected.value = true;
    await Future.delayed(Durations.long3);
    _stronglyAgrementButtonSelected.value = false;
  }

  Color getBackgroundColor() {
    if (stronglyAgrementButtonSelected) {
      return AppColors.green;
    } else if (stronglyAgrementButtonSelected) {
      return AppColors.lightGreen;
    } else if (stronglyDisagrementButtonSelected) {
      return AppColors.lightYellow;
    } else if (stronglyDisagrementButtonSelected) {
      return AppColors.yellow;
    } else {
      return AppColors.lightPrimary;
    }
  }
}

enum gender { woman, man, nonBinary, genderFluid, other, none }

class GenderModel {
  final String name;
  final gender genderEnum;

  GenderModel({required this.name, required this.genderEnum});
}
