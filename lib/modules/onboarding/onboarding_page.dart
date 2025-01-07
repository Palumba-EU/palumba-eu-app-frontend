import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:palumba_eu/global_widgets/card/custom_card.dart';
import 'package:palumba_eu/global_widgets/custom_button.dart';
import 'package:palumba_eu/global_widgets/custom_container_curve.dart';
import 'package:palumba_eu/global_widgets/custom_horizontal_spacer.dart';
import 'package:palumba_eu/global_widgets/custom_spacer.dart';
import 'package:palumba_eu/global_widgets/custom_progress_bar.dart';
import 'package:palumba_eu/modules/onboarding/components/last_step_title.dart';
import 'package:palumba_eu/modules/onboarding/components/step2.dart';
import 'package:palumba_eu/modules/onboarding/components/step3.dart';
import 'package:palumba_eu/modules/onboarding/components/step4.dart';
import 'package:palumba_eu/modules/onboarding/helpers/onboarding_clipper.dart';
import 'package:palumba_eu/modules/onboarding/onboarding_controller.dart';
import 'package:palumba_eu/modules/statments/components/stickers.dart';
import 'package:palumba_eu/utils/common_ui/app_colors.dart';
import 'package:palumba_eu/utils/common_ui/app_dimens.dart';
import 'package:palumba_eu/utils/common_ui/app_texts.dart';
import 'package:palumba_eu/utils/managers/i18n_manager/translations/generated/l10n.dart';
import 'components/onboarding_decision_buttons.dart';
import 'components/step1.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OnboardingController>(
      builder: (_) => Scaffold(
          backgroundColor: AppColors.background,
          body: Stack(
            children: [
              //Content
              SafeArea(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomSpacer(),
                    Expanded(
                        child: PageView.builder(
                            controller: _.pageController,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              if (index == 0) {
                                return Step1(
                                    countries: _.countries,
                                    indexSelected: _.indexCountrySelected,
                                    onCountryPressed: _.onCountryPressed);
                              }
                              if (index == 1) {
                                return Padding(
                                  padding:
                                      EdgeInsets.only(top: _.height.value - 40),
                                  child: Step2(
                                      minAge: _.minAge,
                                      maxAge: _.maxAge,
                                      indexSelected: _.indexAgeSelected,
                                      onAgePressed: _.onAgePressed),
                                );
                              }

                              if (index == 2) {
                                return Padding(
                                  padding:
                                      EdgeInsets.only(top: _.height.value - 30),
                                  child: Step3(
                                      genders: _.genders,
                                      indexSelected: _.indexGenderSelected,
                                      onGenderPressed: _.onGenderPressed,
                                      acceptDataPrivacy: _.acceptDataPrivacy,
                                      onDataPrivacyToggle:
                                          _.onDataPrivacyToggle,
                                      launchDataPrivcay: _.launchDataPrivcay),
                                );
                              }

                              if (index == 3) {
                                return Padding(
                                    padding: EdgeInsets.only(
                                        top: _.height.value - 30),
                                    child: Step4(
                                      levelsofEducation: _.levelsofEducation,
                                      indexSelected:
                                          _.indexLevelOfEducationSelected,
                                      onLevelOfEducationPressed:
                                          _.onLevelOfEducationPressed,
                                    ));
                              }

                              return Container();
                            })),
                    CustomSpacer(),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Padding(
                        padding: AppDimens.lateralPadding,
                        child: Wrap(
                          alignment: WrapAlignment.end,
                          children: [
                            Obx(() {
                              if (_.currentStep.value == 1 ||
                                  _.currentStep.value == _.totalSteps) {
                                return const SizedBox.shrink();
                              }

                              return Opacity(
                                  opacity:
                                      _.isPreferNotToSayEnabled.value ? 1 : 0.5,
                                  child: TextButton(
                                    onPressed: _.isPreferNotToSayEnabled.value
                                        ? () {
                                            _.onContinueTap();
                                          }
                                        : null,
                                    child: AppTexts.regular(
                                        S.of(context).onBoardingNotAnswerButton,
                                        bold: true,
                                        textAlign: TextAlign.right,
                                        color: AppColors.primary),
                                  ));
                            }),
                            CustomHorizontalSpacer(
                              multiplier: Get.width < 400 ? 1 : 2,
                            ),
                            Obx(() {
                              if (_.currentStep.value == _.totalSteps) {
                                return const SizedBox.shrink();
                              }

                              return CustomButton(
                                onPressed: _.isButtonEnabled.value
                                    ? () {
                                        _.onContinueTap();
                                      }
                                    : null,
                                text: S.of(context).textContinue,
                                //Default parameters
                                border: ButtonBorderParameters(),
                              );
                            })
                          ],
                        ),
                      ),
                    ),
                    CustomSpacer(multiplier: 7),
                  ],
                ),
              ),
              Obx(
                () => _.showFinalView
                    ? Container(
                        margin: EdgeInsets.only(top: 100),
                        height: double.infinity,
                        width: double.infinity,
                        color: Colors.white,
                      )
                    : SizedBox.shrink(),
              ),
              //Over Background
              Obx(
                () => AnimatedContainer(
                  duration: const Duration(milliseconds: 250),
                  height: _.height.value,
                  margin: EdgeInsets.zero, //_.margin.value,
                  decoration: BoxDecoration(
                      color: AppColors.blue,
                      borderRadius: BorderRadius.only(
                          bottomLeft: _.radius.value,
                          bottomRight: _.radius.value)),
                ),
              ),

              Obx(
                () => _.showFinalView
                    ? Stack(
                        children: [
                          IgnorePointer(
                            child: Align(
                              alignment: Alignment.bottomCenter,
                              child: SizedBox(
                                height: Get.height * .3,
                                child: DecisionButtonsOnBoarding(
                                  onTapDisagrementButton: () {},
                                  onTapHalfDisagrementButton: () {},
                                  onTapHalfAgrementButton: () {},
                                  onTapAgrementButton: () {},
                                ),
                              ),
                            ),
                          ),
                          Obx(
                            () => AnimatedContainer(
                              duration: const Duration(milliseconds: 650),
                              height: _.heighClippedContainer.value,
                              padding: EdgeInsets.only(top: 100),
                              child: CustomContainerCurve(
                                height: Get.height * .82,
                                curveRadius: 200,
                                color: AppColors.blue,
                              ),
                            ),
                          ),
                          Positioned(
                            top: Get.height * .14,
                            child: SizedBox(
                              height: Get.height * .5,
                              width: Get.width,
                              child: Stickers(),
                            ),
                          ),
                          Obx(
                            () => _.finalAnimationFinished.value
                                ? CustomCard(
                                    isFirstCard: true,
                                    angleCard: _.angle,
                                    bgPosition: _.bgPosition,
                                    positionCard: _.position,
                                    cardAnimationDuration:
                                        _.cardAnimationDuration,
                                    isOnboardingCard: _.isOnBoardingCard,
                                    isPanStarted: false.obs,
                                    card: _.cardData,
                                    onBoardingButtonSelected:
                                        _.buttonEventSelected.value,
                                  )
                                : AnimatedContainer(
                                    duration: const Duration(milliseconds: 650),
                                    height: _.heighClippedContainer.value,
                                    child: CustomCard(
                                      isFirstCard: true,
                                      angleCard: _.angle,
                                      bgPosition: _.bgPosition,
                                      positionCard: _.position,
                                      cardAnimationDuration:
                                          _.cardAnimationDuration,
                                      isOnboardingCard: _.isOnBoardingCard,
                                      isPanStarted: false.obs,
                                      card: _.cardData,
                                      selectedBackgroundColor:
                                          _.getBackgroundColor(),
                                    ),
                                  ),
                          ),
                        ],
                      )
                    : SizedBox.shrink(),
              ),
              //Stickers
              Obx(() {
                return _.showFinalView
                    ? SizedBox.shrink()
                    : Positioned(
                        top: Get.height * .14,
                        child: ClipPath(
                          clipper: OnboardingClipper(
                            radius: _.radius.value,
                            height: _.height.value - Get.height * .14,
                          ),
                          child: SizedBox(
                            height: Get.height * .5,
                            width: Get.width,
                            child: Stickers(),
                          ),
                        ),
                      );
              }),
              //Progress
              SafeArea(
                  child: Padding(
                padding: EdgeInsets.only(top: AppDimens.lateralPaddingValue),
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Obx(() => _.showLastStepTitle
                      ? LastStepTitle()
                      : CustomProgressBar(
                          width: Get.width * 0.35,
                          step: _.currentStep.value,
                          totalSteps: _.totalSteps,
                          progressColor: AppColors.primary,
                          backgroundColor: AppColors.lightPrimary,
                        )),
                ),
              )),
            ],
          )),
    );
  }
}
