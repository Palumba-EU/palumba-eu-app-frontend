import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:palumba_eu/data/model/statement_response.dart';
import 'package:palumba_eu/global_widgets/bubble_buttons/custom_big_button.dart';
import 'package:palumba_eu/global_widgets/bubble_buttons/custom_small_button.dart';
import '../../statements_screen_controller.dart';

class DecisionButtons extends GetView<StatementsController> {
  const DecisionButtons({
    super.key,
    required this.onTap,
    required this.onLongPressStart,
    required this.onLongPressEnd,
  });

  final Function(StatementResponse) onTap;
  final Function(StatementResponse) onLongPressStart;
  final Function(StatementResponse, LongPressEndDetails) onLongPressEnd;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: EdgeInsets.only(top: Get.height * .1),
          child: Obx(
            () => Stack(
              children: [
                _nonSelectedButtons(),
                // overlay agree and disagree buttons
                if (controller.isSelectedOrHovered(StatementResponse.agree))
                  _selectedButtons(true),
                if (controller.isSelectedOrHovered(StatementResponse.disagree))
                  _selectedButtons(false),
              ],
            ),
          ),
        ),
        _strongSelectedButtons()
      ],
    );
  }

  Widget _strongSelectedButtons() {
    return Stack(
      children: [
        Positioned(
          left: 0,
          bottom: 0,
          child: Obx(
            () => SizedBox(
              height: Get.height * .3 -
                  (controller.isSelectedOrHovered(
                          StatementResponse.stronglyDisagree)
                      ? 0
                      : 15),
              width: Get.width * .35 +
                  (controller.isSelectedOrHovered(
                          StatementResponse.stronglyDisagree)
                      ? Get.width * .07
                      : 0),
              child: IgnorePointer(
                ignoring: controller.buttonsBlocked,
                child: CustomBigButtonCurve(
                  curveRadius: 25,
                  isSelected: controller
                      .isSelectedOrHovered(StatementResponse.stronglyDisagree),
                  icon: 'ic_cross',
                  flip: true,
                  onTap: () => onTap(StatementResponse.stronglyDisagree),
                  onLongPress: () =>
                      onLongPressStart(StatementResponse.stronglyDisagree),
                  onLongPressEnd: (details) => onLongPressEnd(
                      StatementResponse.stronglyDisagree, details),
                ),
              ),
            ),
          ),
        ),
        Positioned(
          right: 0,
          bottom: 0,
          child: Obx(
            () => SizedBox(
              height: Get.height * .3 -
                  (controller
                          .isSelectedOrHovered(StatementResponse.stronglyAgree)
                      ? 0
                      : 15),
              width: Get.width * .35 +
                  (controller
                          .isSelectedOrHovered(StatementResponse.stronglyAgree)
                      ? Get.width * .07
                      : 0),
              child: IgnorePointer(
                ignoring: controller.buttonsBlocked,
                child: CustomBigButtonCurve(
                  curveRadius: 25,
                  isSelected: controller
                      .isSelectedOrHovered(StatementResponse.stronglyAgree),
                  icon: 'ic_check',
                  onTap: () => onTap(StatementResponse.stronglyAgree),
                  onLongPress: () =>
                      onLongPressStart(StatementResponse.stronglyAgree),
                  onLongPressEnd: (details) =>
                      onLongPressEnd(StatementResponse.stronglyAgree, details),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _nonSelectedButtons() {
    return Row(
      children: [
        Expanded(child: SizedBox.shrink()),
        Expanded(
          flex: 2,
          child: Obx(
            () => Opacity(
              opacity:
                  controller.isSelectedOrHovered(StatementResponse.disagree)
                      ? 0
                      : 1,
              child: IgnorePointer(
                ignoring: controller.buttonsBlocked,
                child: CustomSmallButtonCurve(
                  curveRadius: 50,
                  isSelected: false,
                  icon: 'ic_cross',
                  flip: false,
                  onTap: () => onTap(StatementResponse.disagree),
                  onLongPress: () =>
                      onLongPressStart(StatementResponse.disagree),
                  onLongPressEnd: (details) =>
                      onLongPressEnd(StatementResponse.disagree, details),
                ),
              ),
            ),
          ),
        ),
        if (!controller.isSelectedOrHovered(StatementResponse.agree) &&
            !controller.isSelectedOrHovered(StatementResponse.disagree))
          SizedBox(
            width: 2,
          ),
        Expanded(
          flex: 2,
          child: Obx(
            () => Opacity(
              opacity: controller.isSelectedOrHovered(StatementResponse.agree)
                  ? 0
                  : 1,
              child: IgnorePointer(
                ignoring: controller.buttonsBlocked,
                child: CustomSmallButtonCurve(
                  curveRadius: 50,
                  isSelected: false,
                  icon: 'ic_check',
                  flip: true,
                  onTap: () => onTap(StatementResponse.agree),
                  onLongPress: () => onLongPressStart(StatementResponse.agree),
                  onLongPressEnd: (details) =>
                      onLongPressEnd(StatementResponse.agree, details),
                ),
              ),
            ),
          ),
        ),
        Expanded(child: SizedBox.shrink()),
      ],
    );
  }

  Widget _selectedButtons(bool isAgree) {
    return Padding(
      padding: EdgeInsets.only(
          left: isAgree ? Get.width * .3 : 0,
          right: isAgree ? 0 : Get.width * .3),
      // bottom: 0,
      child: Obx(
        () => IgnorePointer(
          ignoring: controller.buttonsBlocked,
          child: CustomSmallButtonSelectedCurve(
            curveRadius: 120,
            isSelected: true,
            icon: isAgree ? 'ic_check' : 'ic_cross',
            flip: isAgree ? true : false,
            onTap: () {},
          ),
        ),
      ),
    );
  }
}
