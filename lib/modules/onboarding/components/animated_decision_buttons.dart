import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:palumba_eu/global_widgets/bubble_buttons/custom_big_button.dart';
import 'package:palumba_eu/global_widgets/bubble_buttons/custom_small_button.dart';
import 'package:palumba_eu/modules/onboarding/onboarding_controller.dart';

class AnimatedDecisionButtons extends GetView<OnboardingController> {
  const AnimatedDecisionButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Obx(
          () => AnimatedContainer(
            duration: const Duration(milliseconds: 800),
            transform: Matrix4.identity()
              ..translate(
                0.0,
                controller.smallButtonsPosition.value.dy,
                0,
              ),
            child: Padding(
              padding: EdgeInsets.only(top: Get.height * .1),
              child: Stack(
                children: [
                  _innerButtons(),
                ],
              ),
            ),
          ),
        ),
        Obx(
          () => AnimatedContainer(
              duration: const Duration(milliseconds: 800),
              transform: Matrix4.identity()
                ..translate(
                  0.0,
                  controller.bigButtonsPosition.value.dy,
                  0,
                ),
              child: _outerButtons()),
        ),
      ],
    );
  }

  Widget _outerButtons() {
    return Stack(children: [
      Positioned(
        left: 0,
        bottom: 0,
        child: SizedBox(
          height: Get.height * .3 - 15,
          width: Get.width * .35,
          child: IgnorePointer(
            ignoring: true,
            child: CustomBigButtonCurve(
                curveRadius: 25,
                isSelected: false,
                icon: 'ic_cross',
                flip: true,
                onTap: () => {}),
          ),
        ),
      ),
      // Spacer(),
      Positioned(
        right: 0,
        bottom: 0,
        child: SizedBox(
          height: Get.height * .3 - 15,
          width: Get.width * .35,
          child: IgnorePointer(
            ignoring: true,
            child: CustomBigButtonCurve(
              curveRadius: 25,
              isSelected: false,
              icon: 'ic_check',
              onTap: () => {},
            ),
          ),
        ),
      ),
    ]);
  }

  Widget _innerButtons() {
    return Row(
      children: [
        Expanded(child: SizedBox.shrink()),
        Expanded(
          flex: 2,
          child: IgnorePointer(
            ignoring: true,
            child: CustomSmallButtonCurve(
              curveRadius: 50,
              isSelected: false,
              icon: 'ic_cross',
              flip: false,
              onTap: () => {},
            ),
          ),
        ),
        SizedBox(
          width: 2,
        ),
        Expanded(
          flex: 2,
          child: IgnorePointer(
            ignoring: true,
            child: CustomSmallButtonCurve(
              curveRadius: 50,
              isSelected: false,
              icon: 'ic_check',
              flip: true,
              onTap: () => {},
            ),
          ),
        ),
        Expanded(child: SizedBox.shrink()),
      ],
    );
  }
}
