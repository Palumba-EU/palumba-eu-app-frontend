import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../statements_screen_controller.dart';
import '../../../../global_widgets/bubble_buttons/custom_big_button.dart';
import '../../../../global_widgets/bubble_buttons/custom_small_button.dart';

class DecisionButtons extends GetView<StatementsController> {
  const DecisionButtons({
    super.key,
    required this.onTapStronglyDisagrementButton,
    required this.onTapDisagrementButton,
    required this.onTapAgrementButton,
    required this.onTapStronglyAgrementButton,
  });
  final Function() onTapStronglyDisagrementButton;
  final Function() onTapDisagrementButton;
  final Function() onTapAgrementButton;
  final Function() onTapStronglyAgrementButton;

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
                      (controller.StronglyDisagrementButtonSelected ? 0 : 15),
                  width: Get.width * .35 +
                      (controller.StronglyDisagrementButtonSelected
                          ? Get.width * .07
                          : 0),
                  child: IgnorePointer(
                    ignoring: controller.buttonsBlocked,
                    child: CustomBigButtonCurve(
                      curveRadius: 25,
                      isSelected: controller.StronglyDisagrementButtonSelected,
                      icon: 'ic_cross',
                      flip: true,
                      onTap: onTapStronglyDisagrementButton,
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
                      (controller.StronglyAgrementButtonSelected ? 0 : 15),
                  width: Get.width * .35 +
                      (controller.StronglyAgrementButtonSelected
                          ? Get.width * .07
                          : 0),
                  child: IgnorePointer(
                    ignoring: controller.buttonsBlocked,
                    child: CustomBigButtonCurve(
                      curveRadius: 25,
                      isSelected: controller.StronglyAgrementButtonSelected,
                      icon: 'ic_check',
                      onTap: onTapStronglyAgrementButton,
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
            () => controller.disagrementButtonSelected
                ? SizedBox.shrink()
                : IgnorePointer(
                    ignoring: controller.buttonsBlocked,
                    child: CustomSmallButtonCurve(
                      curveRadius: 50,
                      isSelected: false,
                      icon: 'ic_cross',
                      flip: false,
                      onTap: onTapDisagrementButton,
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
            () => controller.agrementButtonSelected
                ? SizedBox.shrink()
                : IgnorePointer(
                    ignoring: controller.buttonsBlocked,
                    child: CustomSmallButtonCurve(
                      curveRadius: 50,
                      isSelected: false,
                      icon: 'ic_check',
                      flip: true,
                      onTap: onTapAgrementButton,
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
