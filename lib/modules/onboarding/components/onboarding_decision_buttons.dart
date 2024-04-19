import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:palumba_eu/modules/onboarding/onboarding_controller.dart';

import '../../../../global_widgets/bubble_buttons/custom_big_button.dart';
import '../../../../global_widgets/bubble_buttons/custom_small_button.dart';

class DecisionButtonsOnBoarding extends GetView<OnboardingController> {
  const DecisionButtonsOnBoarding({
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
        Obx(
          () => AnimatedContainer(
            duration: const Duration(milliseconds: 800),
            transform: Matrix4.identity()
              ..translate(
                controller.smallButtonsPosition.dx,
                controller.smallButtonsPosition.dy,
                0,
              ),
            child: Padding(
              padding: EdgeInsets.only(top: Get.height * .1),
              child: Obx(() => Stack(
                    children: [
                      _nonSelectedButtons(),
                      if (controller.halfAgrementButtonSelected)
                        _selectedButtons(true),
                      if (controller.halfDisagrementButtonSelected)
                        _selectedButtons(false),
                    ],
                  )), //_nonSelectedButtons(),
            ),
          ),
        ),
        Obx(
          () => AnimatedContainer(
            duration: const Duration(milliseconds: 800),
            transform: Matrix4.identity()
              ..translate(
                controller.bigButtonsPosition.dx,
                controller.bigButtonsPosition.dy,
                0,
              ),
            child: Stack(
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
                          icon: 'ic_cross',
                          flip: true,
                          onTap: onTapDisagrementButton,
                        ),
                      ),
                    ),
                  ),
                ),
                //  Spacer(),
                Positioned(
                  right: 0,
                  bottom: 0,
                  child: Obx(
                    () => SizedBox(
                      height: Get.height * .3 -
                          (controller.agrementButtonSelected ? 0 : 15),
                      width: Get.width * .35 +
                          (controller.agrementButtonSelected
                              ? Get.width * .07
                              : 0),
                      child: IgnorePointer(
                        ignoring: controller.buttonsBlocked,
                        child: CustomBigButtonCurve(
                          curveRadius: 25,
                          isSelected: controller.agrementButtonSelected,
                          icon: 'ic_check',
                          onTap: onTapAgrementButton,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
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
            () => controller.halfDisagrementButtonSelected
                ? SizedBox.shrink()
                : IgnorePointer(
                    ignoring: controller.buttonsBlocked,
                    child: CustomSmallButtonCurve(
                      curveRadius: 50,
                      isSelected: controller.halfDisagrementButtonSelected,
                      icon: 'ic_cross',
                      flip: false,
                      onTap: onTapHalfDisagrementButton,
                    ),
                  ),
          ),
        ),
        if (!controller.halfDisagrementButtonSelected &&
            !controller.halfAgrementButtonSelected)
          SizedBox(
            width: 2,
          ),
        Expanded(
          flex: 2,
          child: Obx(
            () => controller.halfAgrementButtonSelected
                ? SizedBox.shrink()
                : IgnorePointer(
                    ignoring: controller.buttonsBlocked,
                    child: CustomSmallButtonCurve(
                      curveRadius: 50,
                      isSelected: controller.halfAgrementButtonSelected,
                      icon: 'ic_check',
                      flip: true,
                      onTap: onTapHalfAgrementButton,
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
