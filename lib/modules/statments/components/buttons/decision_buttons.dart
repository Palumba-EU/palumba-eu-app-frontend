import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../statements_screen_controller.dart';
import '../../../../global_widgets/bubble_buttons/custom_big_button.dart';
import '../../../../global_widgets/bubble_buttons/custom_small_button.dart';

class DecisionButtons extends GetView<StatementsController> {
  const DecisionButtons({
    super.key,
    required this.onTapStronglyDisagrementButton,
    required this.onLongPressStronglyDisagrementButton,
    required this.onLongPressEndStronglyDisagrementButton,
    required this.onTapDisagrementButton,
    required this.onLongPressDisgrementButton,
    required this.onLongPressEndDisgrementButton,
    required this.onTapAgrementButton,
    required this.onLongPressAgrementButton,
    required this.onLongPressEndAgrementButton,
    required this.onTapStronglyAgrementButton,
    required this.onLongPressStronglyAgrementButton,
    required this.onLongPressEndStronglyAgrementButton,
  });
  final Function() onTapStronglyDisagrementButton;
  final Function() onLongPressStronglyDisagrementButton;
  final Function(LongPressEndDetails) onLongPressEndStronglyDisagrementButton;
  final Function() onTapDisagrementButton;
  final Function() onLongPressDisgrementButton;
  final Function(LongPressEndDetails) onLongPressEndDisgrementButton;
  final Function() onTapAgrementButton;
  final Function() onLongPressAgrementButton;
  final Function(LongPressEndDetails) onLongPressEndAgrementButton;
  final Function() onTapStronglyAgrementButton;
  final Function() onLongPressStronglyAgrementButton;
  final Function(LongPressEndDetails) onLongPressEndStronglyAgrementButton;

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
                if (controller.agrementButtonSelected) _selectedButtons(true),
                if (controller.disagrementButtonSelected)
                  _selectedButtons(false),
              ],
            ),
          ),
        ),
        Stack(
          children: [
            Positioned(
              left: 0,
              bottom: 0,
              child: Obx(
                () => SizedBox(
                  height: Get.height * .3 -
                      (controller.stronglyDisagrementButtonSelected ? 0 : 15),
                  width: Get.width * .35 +
                      (controller.stronglyDisagrementButtonSelected
                          ? Get.width * .07
                          : 0),
                  child: IgnorePointer(
                    ignoring: controller.buttonsBlocked,
                    child: CustomBigButtonCurve(
                      curveRadius: 25,
                      isSelected: controller.stronglyDisagrementButtonSelected,
                      icon: 'ic_cross',
                      flip: true,
                      onTap: onTapStronglyDisagrementButton,
                      onLongPress: onLongPressStronglyDisagrementButton,
                      onLongPressEnd: onLongPressEndStronglyDisagrementButton,
                    ),
                  ),
                ),
              ),
            ),
            //Spacer(),
            Positioned(
              right: 0,
              bottom: 0,
              child: Obx(
                () => SizedBox(
                  height: Get.height * .3 -
                      (controller.stronglyAgrementButtonSelected ? 0 : 15),
                  width: Get.width * .35 +
                      (controller.stronglyAgrementButtonSelected
                          ? Get.width * .07
                          : 0),
                  child: IgnorePointer(
                    ignoring: controller.buttonsBlocked,
                    child: CustomBigButtonCurve(
                      curveRadius: 25,
                      isSelected: controller.stronglyAgrementButtonSelected,
                      icon: 'ic_check',
                      onTap: onTapStronglyAgrementButton,
                      onLongPress: onLongPressStronglyAgrementButton,
                      onLongPressEnd: onLongPressEndStronglyAgrementButton,
                    ),
                  ),
                ),
              ),
            ),
          ],
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
              opacity: controller.disagrementButtonSelected ? 0 : 1,
              child: IgnorePointer(
                ignoring: controller.buttonsBlocked,
                child: CustomSmallButtonCurve(
                  curveRadius: 50,
                  isSelected: false,
                  icon: 'ic_cross',
                  flip: false,
                  onTap: onTapDisagrementButton,
                  onLongPress: onLongPressDisgrementButton,
                  onLongPressEnd: onLongPressEndDisgrementButton,
                ),
              ),
            ),
          ),
        ),
        if (!controller.disagrementButtonSelected &&
            !controller.agrementButtonSelected)
          SizedBox(
            width: 2,
          ),
        Expanded(
          flex: 2,
          child: Obx(
            () => Opacity(
              opacity: controller.agrementButtonSelected ? 0 : 1,
              child: IgnorePointer(
                ignoring: controller.buttonsBlocked,
                child: CustomSmallButtonCurve(
                  curveRadius: 50,
                  isSelected: false,
                  icon: 'ic_check',
                  flip: true,
                  onTap: onTapAgrementButton,
                  onLongPress: onLongPressAgrementButton,
                  onLongPressEnd: onLongPressEndAgrementButton,
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
