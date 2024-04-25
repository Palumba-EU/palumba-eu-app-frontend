import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:palumba_eu/data/model/user_model.dart';
import 'package:palumba_eu/global_widgets/custom_button.dart';
import 'package:palumba_eu/modules/home/home_page_controller.dart';
import 'package:palumba_eu/modules/onboarding/components/last_step_title.dart';
import 'package:palumba_eu/utils/common_ui/app_colors.dart';
import 'package:palumba_eu/utils/common_ui/app_dimens.dart';
import 'package:palumba_eu/utils/managers/i18n_manager/translations/generated/l10n.dart';

import 'components/buttons/decision_buttons.dart';
import '../../global_widgets/card/custom_card.dart';
import '../../global_widgets/custom_container_curve.dart';
import 'components/custom_header.dart';
import 'statements_screen_controller.dart';

class StatementsPage extends GetView<StatementsController> {
  const StatementsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          SizedBox(
            height: Get.height,
            child: Stack(
              children: [
                //Card container
                Stack(
                  children: [
                    CustomContainerCurve(
                      height: Get.height * .82,
                      curveRadius: 200,
                      color: AppColors.secondary,
                    ),
                  ],
                ),

                //Buttons
                Obx(
                  () => controller.loadingQuestions
                      ? Center(
                          child: CircularProgressIndicator(
                            color: AppColors.primary,
                          ),
                        )
                      : Align(
                          alignment: Alignment.bottomCenter,
                          child: SizedBox(
                            height: Get.height * .3,
                            child: Stack(
                              children: [
                                Padding(
                                  padding:
                                      EdgeInsets.only(top: Get.height * .08),
                                  child: Align(
                                    alignment: Alignment.topCenter,
                                    child: Obx(
                                      () => AnimatedOpacity(
                                        duration: Durations.long4,
                                        opacity:
                                            controller.fromOnboarding ? 0 : 1,
                                        child: IgnorePointer(
                                            ignoring: controller.buttonsBlocked,
                                            child: CustomButton(
                                              text: S.of(context).neutral,
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: AppDimens
                                                          .lateralPaddingValue *
                                                      .5),
                                              onPressed: controller
                                                      .fromOnboarding
                                                  ? null
                                                  : () =>
                                                      controller.activateButton(
                                                          StatementResponse
                                                              .neutral),
                                              color: controller
                                                      .neutralButtonSelected
                                                  ? AppColors.secondary
                                                  : AppColors.primary,
                                              textColor: AppColors.text,
                                              radius:
                                                  AppDimens.largeBorderRadius,
                                              border: ButtonBorderParameters(
                                                  color: controller
                                                          .neutralButtonSelected
                                                      ? AppColors.primary
                                                      : AppColors.lightPrimary,
                                                  width: 2,
                                                  isOutside: true),
                                            )),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: double.infinity,
                                  height: Get.height * .3,
                                  child: DecisionButtons(
                                    //Strongly disagree taps
                                    onTapStronglyDisagrementButton: () =>
                                        controller.activateButton(
                                            StatementResponse.stronglyDisagree),
                                    onLongPressStronglyDisagrementButton: () =>
                                        controller.onLongPressButton(
                                            StatementResponse.stronglyDisagree),
                                    onLongPressEndStronglyDisagrementButton:
                                        (_) => controller.activateButton(
                                      StatementResponse.stronglyDisagree,
                                    ),

                                    //Disagree taps
                                    onTapDisagrementButton: () =>
                                        controller.activateButton(
                                            StatementResponse.disagree),
                                    onLongPressDisgrementButton: () =>
                                        controller.onLongPressButton(
                                            StatementResponse.disagree),
                                    onLongPressEndDisgrementButton: (_) =>
                                        controller.activateButton(
                                            StatementResponse.disagree),

                                    //Agree taps
                                    onTapAgrementButton: () =>
                                        controller.activateButton(
                                            StatementResponse.agree),
                                    onLongPressAgrementButton: () =>
                                        controller.onLongPressButton(
                                            StatementResponse.agree),
                                    onLongPressEndAgrementButton: (_) =>
                                        controller.activateButton(
                                            StatementResponse.agree),

                                    //Strongly agree taps
                                    onTapStronglyAgrementButton: () =>
                                        controller.activateButton(
                                            StatementResponse.stronglyAgree),
                                    onLongPressStronglyAgrementButton: () =>
                                        controller.onLongPressButton(
                                            StatementResponse.stronglyAgree),
                                    onLongPressEndStronglyAgrementButton: (_) =>
                                        controller.activateButton(
                                            StatementResponse.stronglyAgree),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                ),
              ],
            ),
          ),
          Obx(
            () => controller.fromOnboarding
                ?
                //Onboarding header
                SafeArea(
                    child: Padding(
                      padding:
                          EdgeInsets.only(top: AppDimens.lateralPaddingValue),
                      child: Align(
                          alignment: Alignment.topCenter, child: LastStepTitle()

                          /*CustomProgressBar(
                          width: Get.width * 0.35,
                          step: 4,
                          totalSteps: 4,
                          progressColor: AppColors.primary,
                          backgroundColor: AppColors.lightPrimary,
                        ),*/
                          ),
                    ),
                  )
                :
                //Custom Plaumba header
                IgnorePointer(
                    ignoring: controller.isPanStarted.value,
                    child: Container(
                      color: AppColors.secondary,
                      child: SafeArea(
                        child: IntrinsicHeight(
                          child: AnimatedOpacity(
                              opacity: controller.isPanStarted.value ? 0.2 : 1,
                              duration: Durations.medium4,
                              child: CustomHeader(
                                //TODO: Fix me (fix: add correct routes)
                                homeTap: () =>
                                    Get.toNamed(HomePageController.route),
                                backTap: () =>
                                    controller.returnToPreviousCard(),
                              )),
                        ),
                      ),
                    ),
                  ),
          ),
          //Bird background image
          ClipPath(
            clipper: CustomContainerClipper(curveRadius: 200),
            child: SizedBox(
              height: Get.height * .82,
              child: Align(
                alignment: Alignment.bottomRight,
                child: SvgPicture.asset(
                  'assets/images/img_background_blue.svg',
                  fit: BoxFit.fitHeight,
                ),
              ),
            ),
          ),
          //Card
          GetBuilder<StatementsController>(
            id: controller.cardStackKey,
            init: controller,
            builder: (controller) => (controller.firstCard != null ||
                    controller.fromOnboarding)
                ? Stack(
                    children: [
                      if (controller.secondCard != null)
                        CustomCard(
                          card: controller.secondCard,
                          angleCard: controller.angle,
                          positionCard: controller.position,
                          bgPosition: controller.bgPosition,
                          isPanStarted: controller.isPanStarted,
                          cardAnimationDuration:
                              controller.cardAnimationDuration,
                          cardOpacity: controller.cardOpacity,
                          isFirstCard: false,
                          onPanStart: controller.onPanStart,
                          onPanUpdate: controller.onPanUpdate,
                          onPanEnd: controller.onPanEnd,
                          onTapDown: controller.onTapDown,
                          currentCardIndex: 0.obs,
                          //controller.currentCardIndex,
                          isOnboardingCard: false,
                          //onSkipTap: controller.onSkipTap,
                        ),
                      Obx(
                        () => CustomCard(
                          isFirstCard: true,
                          card: controller.firstCard,
                          onPanStart: controller.onPanStart,
                          onPanUpdate: controller.onPanUpdate,
                          onPanEnd: controller.onPanEnd,
                          onTapDown: controller.onTapDown,
                          currentCardIndex: controller.currentCardIndex,
                          angleCard: controller.angle,
                          positionCard: controller.position,
                          bgPosition: controller.bgPosition,
                          isPanStarted: controller.isPanStarted,
                          cardAnimationDuration:
                              controller.cardAnimationDuration,
                          cardOpacity: controller.cardOpacity,
                          isOnboardingCard: controller.fromOnboarding,
                          scale: controller.scale.value,
                          isZoneButtonEntered: controller.isZoneButtonEntered,
                          onSkipTap: () =>
                              controller.activateButton(StatementResponse.skip),
                        ),
                      )
                    ],
                  )
                : SizedBox.shrink(),
          ),
        ],
      ),
    );
  }
}
