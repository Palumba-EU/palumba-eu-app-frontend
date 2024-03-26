import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:palumba_eu/global_widgets/custom_button.dart';
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
                                return Step2(
                                    minAge: _.minAge,
                                    maxAge: _.maxAge,
                                    indexSelected: _.indexAgeSelected,
                                    onAgePressed: (int index) {
                                      _.onAgePressed(index);
                                    });
                              }

                              if (index == 2) {
                                return Step3(
                                    genders: _.genders,
                                    indexSelected: _.indexGenderSelected,
                                    onGenderPressed: (int index) {
                                      _.onGenderPressed(index);
                                    });
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
                              multiplier: 2,
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
              //Over Background
              Obx(() {
                var height = Get.height;
                var margin = EdgeInsets.zero;
                var radius = Radius.circular(250);
                if (_.currentStep.value == 1) {
                  height = height * 0.065;
                  margin = EdgeInsets.symmetric(horizontal: Get.width * 0.2);
                  radius = Radius.elliptical(500, 250);
                } else if (_.currentStep.value == 2) {
                  height = height * 0.37;
                } else if (_.currentStep.value == 3) {
                  height = height * 0.4725;
                } else {
                  radius = Radius.zero;
                }

                return AnimatedContainer(
                  duration: const Duration(milliseconds: 500),
                  height: height,
                  margin: margin,
                  decoration: BoxDecoration(
                      color: AppColors.background,
                      borderRadius: BorderRadius.only(
                          bottomLeft: radius, bottomRight: radius)),
                );
              }),
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
            ],
          )),
    );
  }
}
