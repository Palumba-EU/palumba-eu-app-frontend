import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../statements_screen_controller.dart';
import '../../../../global_widgets/bubble_buttons/custom_big_button.dart';
import '../../../../global_widgets/bubble_buttons/custom_small_button.dart';

class DecisionButtons extends GetView<StatementsController> {
  const DecisionButtons({
    super.key,
    required this.onTapDisagrementButton,
    required this.onTapHalfDisagrementButton,
    required this.onTapHalfAgrementButton,
    required this.onTapAgrementButton,
  });
  final Function() onTapDisagrementButton;
  final Function() onTapHalfDisagrementButton;
  final Function() onTapHalfAgrementButton;
  final Function() onTapAgrementButton;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: EdgeInsets.only(top: Get.height * .1),
          child: Row(
            children: [
              Expanded(child: SizedBox.shrink()),
              Expanded(
                flex: 2,
                child: Obx(
                  () => IgnorePointer(
                    ignoring: controller.buttonsBlocked,
                    child: CustomSmallButtonCurve(
                      curveRadius: 50,
                      isSelected: controller.halfDisagrementButtonSelected,
                      icon: Icons.close,
                      flip: false,
                      onTap: onTapHalfDisagrementButton,
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 2,
              ),
              Expanded(
                flex: 2,
                child: Obx(
                  () => IgnorePointer(
                    ignoring: controller.buttonsBlocked,
                    child: CustomSmallButtonCurve(
                      curveRadius: 50,
                      isSelected: controller.halfAgrementButtonSelected,
                      icon: Icons.check,
                      flip: true,
                      onTap: onTapHalfAgrementButton,
                    ),
                  ),
                ),
              ),
              Expanded(child: SizedBox.shrink()),
            ],
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
                      (controller.disagrementButtonSelected ? 0 : 15),
                  width: Get.width * .35 +
                      (controller.disagrementButtonSelected
                          ? Get.width * .07
                          : 0),
                  child: IgnorePointer(
                    ignoring: controller.buttonsBlocked,
                    child: CustomBigButtonCurve(
                      curveRadius: 25,
                      isSelected: controller.disagrementButtonSelected,
                      icon: Icons.close,
                      flip: true,
                      onTap: onTapDisagrementButton,
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
                      (controller.agrementButtonSelected ? 0 : 15),
                  width: Get.width * .35 +
                      (controller.agrementButtonSelected ? Get.width * .07 : 0),
                  child: IgnorePointer(
                    ignoring: controller.buttonsBlocked,
                    child: CustomBigButtonCurve(
                      curveRadius: 25,
                      isSelected: controller.agrementButtonSelected,
                      icon: Icons.check,
                      onTap: onTapAgrementButton,
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
}
