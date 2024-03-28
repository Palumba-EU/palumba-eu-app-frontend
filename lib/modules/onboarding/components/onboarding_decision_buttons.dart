import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
            child: Row(
              children: [
                Expanded(
                  child: Obx(
                    () => IgnorePointer(
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
                Spacer(),
                Expanded(
                  child: Obx(
                    () => IgnorePointer(
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
              ],
            ),
          ),
        ),
      ],
    );
  }
}
