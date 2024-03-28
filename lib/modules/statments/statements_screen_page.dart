import 'package:dui/dui.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
                CustomContainerCurve(
                  height: Get.height * .82,
                  curveRadius: 200,
                ),

                //Buttons
                Align(
                  alignment: Alignment.bottomCenter,
                  child: SizedBox(
                    height: Get.height * .3,
                    child: Stack(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: Get.height * .08),
                          child: Align(
                            alignment: Alignment.topCenter,
                            child: Obx(
                              () => IgnorePointer(
                                ignoring: controller.buttonsBlocked,
                                child: SizedBox(
                                  width: 90,
                                  height: 28,
                                  child: DUI.button.button(
                                    context,
                                    'Neutral',
                                    controller.onTapNeutralButton,
                                    color:
                                        Theme.of(context).colorScheme.secondary,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        DecisionButtons(
                          onTapDisagrementButton:
                              controller.onTapDisagrementButton,
                          onTapHalfDisagrementButton:
                              controller.onTapHalfDisagrementButton,
                          onTapHalfAgrementButton:
                              controller.onTapHalfAgrementButton,
                          onTapAgrementButton: controller.onTapAgrementButton,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          IgnorePointer(
            child: Obx(
              () => Container(
                height: 160,
                color: Theme.of(context).colorScheme.primary,
                child: SafeArea(
                  child: AnimatedOpacity(
                      opacity: controller.isPanStarted.value ? 0.2 : 1,
                      duration: Durations.medium4,
                      child: CustomHeader()),
                ),
              ),
            ),
          ),
          //Card
          GetBuilder<StatementsController>(
            id: controller.cardStackKey,
            init: controller,
            builder: (controller) => controller.firstCard != null
                ? Stack(
                    children: [
                      if (controller.secondCard != null)
                        CustomCard(
                          card: controller.secondCard!,
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
                          currentCardIndex: controller.currentCardIndex,
                        ),
                      CustomCard(
                        isFirstCard: true,
                        card: controller.firstCard!,
                        onPanStart: controller.onPanStart,
                        onPanUpdate: controller.onPanUpdate,
                        onPanEnd: controller.onPanEnd,
                        onTapDown: controller.onTapDown,
                        currentCardIndex: controller.currentCardIndex,
                        angleCard: controller.angle,
                        positionCard: controller.position,
                        bgPosition: controller.bgPosition,
                        isPanStarted: controller.isPanStarted,
                        cardAnimationDuration: controller.cardAnimationDuration,
                        cardOpacity: controller.cardOpacity,
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
