import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:get/get.dart';
import 'package:palumba_eu/global_widgets/card/custom_card.dart';

import 'package:palumba_eu/global_widgets/custom_button.dart';
import 'package:palumba_eu/global_widgets/custom_container_curve.dart';
import 'package:palumba_eu/global_widgets/custom_horizontal_spacer.dart';

import 'package:palumba_eu/global_widgets/custom_spacer.dart';
import 'package:palumba_eu/global_widgets/custom_progress_bar.dart';
import 'package:palumba_eu/modules/onboarding/components/step2.dart';
import 'package:palumba_eu/modules/onboarding/components/step3.dart';
import 'package:palumba_eu/modules/onboarding/onboarding_controller.dart';

import 'package:palumba_eu/utils/common_ui/app_colors.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
          backgroundColor: AppColors.primary,
          body: Stack(
            children: [
              //Background
              if (_.currentStep != 4)
                Align(
                  alignment: Alignment.bottomRight,
                  child: SvgPicture.asset(
                    'assets/images/img_background_lilac.svg',
                    fit: BoxFit.fitWidth,
                  ),
                ),

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
                                    onCountryPressed: (int index) {
                                      _.onCountryPressed(index);
                                    });
                              }

                              if (index == 1) {
                                return Padding(
                                  padding:
                                      EdgeInsets.only(top: _.height.value - 40),
                                  child: Step2(
                                      minAge: _.minAge,
                                      maxAge: _.maxAge,
                                      indexSelected: _.indexAgeSelected,
                                      onAgePressed: (int index) {
                                        _.onAgePressed(index);
                                      }),
                                );
                              }

                              if (index == 2) {
                                return Padding(
                                  padding:
                                      EdgeInsets.only(top: _.height.value - 30),
                                  child: Step3(
                                      genders: _.genders,
                                      indexSelected: _.indexGenderSelected,
                                      onGenderPressed: (int index) {
                                        _.onGenderPressed(index);
                                      }),
                                );
                              }

                              //TODO: Step4

                              return Container();
                            })),
                    CustomSpacer(),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Padding(
                        padding: AppDimens.lateralPadding,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Obx(() {
                              if (_.currentStep.value == 1 ||
                                  _.currentStep.value == _.totalSteps) {
                                return const SizedBox.shrink();
                              }

                              return TextButton(
                                onPressed: () {
                                  _.onContinueTap();
                                },
                                child: AppTexts.regular(
                                    S.of(context).onBoardingNotAnswerButton,
                                    bold: true),
                              );
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
                  duration: const Duration(milliseconds: 500),
                  height: _.height.value,
                  margin: _.margin.value,
                  decoration: BoxDecoration(
                      color: AppColors.background,
                      borderRadius: BorderRadius.only(
                          bottomLeft: _.radius.value,
                          bottomRight: _.radius.value)),
                ),
              ),
              //Progress
              SafeArea(
                  child: Padding(
                padding: EdgeInsets.only(top: AppDimens.lateralPaddingValue),
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Obx(() => CustomProgressBar(
                        width: Get.width * 0.35,
                        step: _.currentStep.value,
                        totalSteps: _.totalSteps,
                      )),
                ),
              )),

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
                                  onTapDisagrementButton:
                                      _.onTapDisagrementButton,
                                  onTapHalfDisagrementButton:
                                      _.onTapHalfDisagrementButton,
                                  onTapHalfAgrementButton:
                                      _.onTapHalfAgrementButton,
                                  onTapAgrementButton: _.onTapAgrementButton,
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
                                color: AppColors.background,
                              ),
                            ),
                          ),
                          Obx(
                            () => _.finalAnimationFinished.value
                                ? CustomCard(
                                    card: _.exampleCard,
                                    isFirstCard: true,
                                    angleCard: _.angle,
                                    bgPosition: _.bgPosition,
                                    positionCard: _.position,
                                    cardOpacity: _.cardOpacity,
                                    isPanStarted: _.isPanStarted,
                                    currentCardIndex: _.currentCardIndex,
                                    onPanStart: _.onPanStart,
                                    onPanUpdate: _.onPanUpdate,
                                    onPanEnd: _.onPanEnd,
                                    onTapDown: _.onTapDown,
                                    cardAnimationDuration:
                                        _.cardAnimationDuration,
                                    hasProgressBar: false,
                                  )
                                : AnimatedContainer(
                                    duration: const Duration(milliseconds: 650),
                                    height: _.heighClippedContainer.value,
                                    child: CustomCard(
                                      card: _.exampleCard,
                                      isFirstCard: true,
                                      angleCard: _.angle,
                                      bgPosition: _.bgPosition,
                                      positionCard: _.position,
                                      cardOpacity: _.cardOpacity,
                                      isPanStarted: _.isPanStarted,
                                      currentCardIndex: _.currentCardIndex,
                                      onPanStart: _.onPanStart,
                                      onPanUpdate: _.onPanUpdate,
                                      onPanEnd: _.onPanEnd,
                                      onTapDown: _.onTapDown,
                                      cardAnimationDuration:
                                          _.cardAnimationDuration,
                                      hasProgressBar: false,
                                    ),
                                  ),
                          ),
                        ],
                      )
                    : SizedBox.shrink(),
              ),
            ],
          )),
    );
  }
}
