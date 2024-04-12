import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:palumba_eu/data/manager/data_manager.dart';
import 'package:palumba_eu/data/model/localization_data.dart';
import 'package:palumba_eu/data/model/statements_data.dart';
import 'package:palumba_eu/data/repositories/remote/data_repository.dart';
import 'package:palumba_eu/modules/statments/statements_screen_controller.dart';
import 'package:palumba_eu/utils/managers/i18n_manager/translations/generated/l10n.dart';
import 'package:palumba_eu/utils/managers/user_manager.dart';
import 'package:palumba_eu/utils/string_utils.dart';

class OnboardingController extends GetxController {
  static const route = '/onboarding';

  final DataRepository _dataRepository = Get.find<DataRepository>();

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

  ///Step1
  List<Country>? _countries = DataManager().getCountries();

  List<Country>? get countries => _countries;

  RxInt indexCountrySelected = (-1).obs;

  RxBool _showFinalView = false.obs;

  bool get showFinalView => _showFinalView.value;

  StatementsData? _statements;

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
        genderEnum: gender.nonBinary),
    GenderModel(
        name: S.of(Get.context!).onBoardingStep3Option4,
        genderEnum: gender.intersex),
    GenderModel(
        name: S.of(Get.context!).onBoardingStep3Option5,
        genderEnum: gender.other),
  ];

  List<String> get genders => _genders.map((gender) => gender.name).toList();

  RxInt indexGenderSelected = (-1).obs;

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
    UserManager.setCountryId(_countries![index].id!);
    indexCountrySelected.value = index;
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

  void _fetchStatements() async {
    //Fetch statements data here to send to the next screen
    final result = await _dataRepository.fetchStatements();
    if (result != null) {
      _statements = result;
      print(_statements!.data!.first.details);
      print(_statements!.data!.first.statement);
      print(_statements!.data!.first.footnote);
      print(_statements!.data!.first.vector);
    }
  }

  void updateButtonState() {
    isButtonEnabled.value =
        currentStep.value == 1 && indexCountrySelected.value != -1 ||
            currentStep.value == 2 && indexAgeSelected.value != -1 ||
            currentStep.value == 3 && indexGenderSelected.value != -1;
  }

  void updateBackgroundShape() {
    //Update the background shape
    bool isSmallScreen = Get.height < 800;
    var heightSize = Get.height;
    if (currentStep.value <= 1) {
      //
      height.value = heightSize * .0415;
      radius.value = Radius.elliptical(900, 300);
      margin.value = EdgeInsets.symmetric(horizontal: Get.width * 0.18);
    } else if (currentStep.value == 2) {
      //Call fetch statments here (when we reach step 2 and know the country selected)
      _fetchStatements();
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
        //Finally when animation finish we navigate to statments screen
        Get.toNamed(StatementsController.route, arguments: {
          StringUtils.fromOnboardingKey: true,
          StringUtils.statementsDataKey: _statements?.toJson()
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
    _cardOpacity.value = 1;
    _angle = 0;
    await Future.delayed(Duration(milliseconds: 250));
    _cardAnimationDuration.value = 0;
    _buttonsBlocked.value = false;
  }

  void onTapDisagrementButton() async {
    //Fake button is tapped
    _disagrementButtonSelected.value = true;
    await Future.delayed(Durations.long3);
    _disagrementButtonSelected.value = false;
  }

  void onTapHalfDisagrementButton() async {
    //Fake button is tapped
    _halfDisagrementButtonSelected.value = true;
    await Future.delayed(Durations.long3);
    _halfDisagrementButtonSelected.value = false;
  }

  void onTapHalfAgrementButton() async {
    //Fake button is tapped
    _halfAgrementButtonSelected.value = true;
    await Future.delayed(Durations.long3);
    _halfAgrementButtonSelected.value = false;
  }

  void onTapAgrementButton() async {
    //Fake button is tapped
    _agrementButtonSelected.value = true;
    await Future.delayed(Durations.long3);
    _agrementButtonSelected.value = false;
  }
}

enum gender { woman, man, nonBinary, intersex, other, none }

class GenderModel {
  final String name;
  final gender genderEnum;

  GenderModel({required this.name, required this.genderEnum});
}
