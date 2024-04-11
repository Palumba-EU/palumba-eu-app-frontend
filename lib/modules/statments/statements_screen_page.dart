import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:palumba_eu/data/model/user_model.dart';
import 'package:palumba_eu/global_widgets/custom_progress_bar.dart';
import 'package:palumba_eu/utils/common_ui/app_colors.dart';
import 'package:palumba_eu/utils/common_ui/app_dimens.dart';
import 'package:palumba_eu/utils/common_ui/app_texts.dart';
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
                      color: Theme.of(context).colorScheme.background,
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
                                          child: TextButton(
                                            onPressed: controller.fromOnboarding
                                                ? null
                                                : () =>
                                                    controller.activateButton(
                                                        StatementResponse
                                                            .neutral),
                                            style: ElevatedButton.styleFrom(
                                                backgroundColor:
                                                    AppColors.primary,
                                                shape: StadiumBorder()),
                                            child: AppTexts.regular(
                                              S.of(context).neutral,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: double.infinity,
                                  height: Get.height * .3,
                                  child: DecisionButtons(
                                    onTapStronglyDisagrementButton: () =>
                                        controller.activateButton(
                                            StatementResponse.stronglyDisagree),
                                    onTapDisagrementButton: () =>
                                        controller.activateButton(
                                            StatementResponse.disagree),
                                    onTapAgrementButton: () =>
                                        controller.activateButton(
                                            StatementResponse.agree),
                                    onTapStronglyAgrementButton: () =>
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
                        alignment: Alignment.topCenter,
                        child: CustomProgressBar(
                          width: Get.width * 0.35,
                          step: 4,
                          totalSteps: 4,
                        ),
                      ),
                    ),
                  )
                :
                //Custom Plaumba header
                IgnorePointer(
                    ignoring: controller.isPanStarted.value,
                    child: Container(
                      color: Theme.of(context).colorScheme.background,
                      child: SafeArea(
                        child: IntrinsicHeight(
                          child: AnimatedOpacity(
                              opacity: controller.isPanStarted.value ? 0.2 : 1,
                              duration: Durations.medium4,
                              child: CustomHeader()),
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
            builder: (controller) =>
                (controller.firstCard != null || controller.fromOnboarding)
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
                              onSkipTap: controller.onSkipTap,
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
                              onSkipTap: controller.onSkipTap,
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
