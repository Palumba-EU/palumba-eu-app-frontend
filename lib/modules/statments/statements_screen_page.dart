import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:palumba_eu/data/model/statement_response.dart';
import 'package:palumba_eu/global_widgets/card/custom_card.dart';
import 'package:palumba_eu/global_widgets/custom_button.dart';
import 'package:palumba_eu/global_widgets/custom_container_curve.dart';
import 'package:palumba_eu/modules/onboarding/components/last_step_title.dart';
import 'package:palumba_eu/modules/statments/components/stickers.dart';
import 'package:palumba_eu/utils/common_ui/app_colors.dart';
import 'package:palumba_eu/utils/common_ui/app_dimens.dart';
import 'package:palumba_eu/utils/common_ui/app_texts.dart';
import 'package:palumba_eu/utils/managers/i18n_manager/translations/generated/l10n.dart';
import 'components/buttons/decision_buttons.dart';
import 'components/custom_header.dart';
import 'statements_screen_controller.dart';

class StatementsPage extends GetView<StatementsController> {
  const StatementsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
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
                      color: AppColors.blue,
                    ),
                  ],
                ),
              ],
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

          //Custom Plaumba header
          Obx(
            () => controller.tutorialOngoing.value
                ? SafeArea(
                    child: Padding(
                      padding:
                          EdgeInsets.only(top: AppDimens.lateralPaddingValue),
                      child: Align(
                          alignment: Alignment.topCenter,
                          child: LastStepTitle()),
                    ),
                  )
                : SafeArea(
                    child: IntrinsicHeight(
                      child: AnimatedOpacity(
                        opacity: controller.isPanStarted.value ? 0.2 : 1,
                        duration: Durations.medium4,
                        child: GetBuilder<StatementsController>(
                            id: controller.cardStackKey,
                            builder: (controller) => CustomHeader(
                                  homeTap: controller.homeTap,
                                  backTap: controller.returnToPreviousCard,
                                  isBackButtonActive:
                                      controller.frontCard?.id !=
                                          controller.firstCardId,
                                )),
                      ),
                    ),
                  ),
          ),

          //Card
          GetBuilder<StatementsController>(
            id: controller.cardStackKey,
            init: controller,
            builder: (controller) => (controller.frontCard != null)
                ? Stack(
                    children: [
                      if (controller.backCard != null)
                        // background card
                        CustomCard(
                          isFrontCard: false,
                          card: controller.backCard,
                          angleCard: controller.angle,
                          position: controller.backCardPosition,
                          isPanStarted: controller.isPanStarted,
                          cardAnimationDuration:
                              controller.cardAnimationDuration,
                        ),
                      Obx(
                        // front card
                        () => CustomCard(
                            isFrontCard: true,
                            card: controller.frontCard,
                            onPanStart: controller.onPanStart,
                            onPanUpdate: controller.onPanUpdate,
                            onPanEnd: controller.onPanEnd,
                            angleCard: controller.angle,
                            position: controller.frontCardposition,
                            isPanStarted: controller.isPanStarted,
                            cardAnimationDuration:
                                controller.cardAnimationDuration,
                            currentDraggedResponseStatement:
                                controller.currentDraggedResponseStatement,
                            flipCardController: controller.flipCardController,
                            selectedResponseStatement:
                                controller.selectedResponseStatement.value,
                            onFlip: controller.onFlip,
                            scrollController:
                                controller.frontCardScrollController),
                      )
                    ],
                  )
                : SizedBox.shrink(),
          ),

          //Buttons
          Align(
            alignment: Alignment.bottomCenter,
            child: SizedBox(
              height: Get.height * .3,
              child: Stack(
                children: [neutralButton(context), agreeButtons()],
              ),
            ),
          ),

          //TOP BANNER SHOWED IN HALF AND LAST 5 STATEMENTS
          Obx(() => IntrinsicHeight(
                child: Opacity(
                  opacity: controller.bannerOpacity,
                  child: AnimatedContainer(
                    duration: controller.bannerDuration,
                    curve: Curves.easeInOutBack,
                    transform: Matrix4.identity()
                      ..translate(controller.bannerPosition.dx,
                          controller.bannerPosition.dy, 0),
                    margin: AppDimens.lateralPadding,
                    padding: EdgeInsets.symmetric(
                        horizontal: AppDimens.smallLateralPaddingValue,
                        vertical: AppDimens.lateralPaddingValue),
                    width: double.infinity,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: AppColors.primary,
                        borderRadius: BorderRadius.all(
                            Radius.circular(AppDimens.largeBorderRadius)),
                        border: Border.all(
                          color: AppColors.lightPrimary,
                          width: AppDimens.borderWidth * 2,
                        )),
                    child: AppTexts.regular(
                        controller.halfBannerShowed
                            ? S.of(context).message_five_cards_left
                            : S.of(context).message_half_test_done,
                        bold: true,
                        black: false,
                        textAlign: TextAlign.center),
                  ),
                ),
              ))
        ],
      ),
    );
  }

  Widget neutralButton(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: Get.height * .08),
      child: Align(
        alignment: Alignment.topCenter,
        child: Obx(
          () => IgnorePointer(
              ignoring: controller.buttonsBlocked,
              child: CustomButton(
                text: S.of(context).neutral,
                padding: EdgeInsets.symmetric(
                    horizontal: AppDimens.lateralPaddingValue * .5),
                onPressed: () =>
                    controller.activateButton(StatementResponse.neutral),
                color: controller.isSelectedOrHovered(StatementResponse.neutral)
                    ? AppColors.lightPrimary
                    : AppColors.primary,
                textColor:
                    controller.isSelectedOrHovered(StatementResponse.neutral)
                        ? AppColors.primary
                        : AppColors.text,
                radius: AppDimens.largeBorderRadius,
                border: ButtonBorderParameters(
                    color: AppColors.lightPrimary, width: 2, isOutside: true),
              )),
        ),
      ),
    );
  }

  Widget agreeButtons() {
    return SizedBox(
      width: double.infinity,
      height: Get.height * .3,
      child: DecisionButtons(
        onTap: controller.activateButton,
        onLongPressStart: controller.onLongPressButton,
        onLongPressEnd: (statement, _) => controller.activateButton(statement),
      ),
    );
  }
}
