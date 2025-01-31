import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:matrix4_transform/matrix4_transform.dart';
import 'package:palumba_eu/global_widgets/custom_progress_bar.dart';
import 'package:palumba_eu/global_widgets/custom_spacer.dart';
import 'package:palumba_eu/modules/results/loading/loading_results_controller.dart';
import 'package:get/get.dart';
import 'package:palumba_eu/utils/common_ui/app_colors.dart';
import 'package:palumba_eu/utils/common_ui/app_dimens.dart';
import 'package:palumba_eu/utils/common_ui/app_texts.dart';
import 'package:palumba_eu/utils/managers/election_manager.dart';

class LoadingResultsPage extends StatelessWidget {
  const LoadingResultsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final compassWidth = Get.width * 1.05;
    return GetBuilder<LoadingResultsController>(
      builder: (_) => Scaffold(
        backgroundColor: AppColors.primary,
        body: Stack(
          fit: StackFit.expand,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Spacer(
                  flex: 3,
                ),
                CustomSpacer(
                  multiplier: 7,
                ),
                Obx(() => CustomProgressBar(
                      duration: Duration(milliseconds: _.milliSecondsStep),
                      width: Get.width * 0.675,
                      step: _.currentStep.value,
                      totalSteps: _.totalSteps,
                      progressColor: AppColors.text,
                      backgroundColor: AppColors.lightPrimary,
                    )),
                CustomSpacer(multiplier: 3),
                SizedBox(
                  height: 200,
                  child: Padding(
                    padding: AppDimens.lateralPadding,
                    child: Obx(() {
                      return AppTexts.title(
                        _.titleForIndex(
                            context, ElectionManager.currentElection.value),
                        textAlign: TextAlign.center,
                      );
                    }),
                  ),
                ),
                Spacer(
                  flex: 10,
                )
              ],
            ),
            Positioned(
              bottom: -Get.width * .05,
              left: -Get.width * .05,
              right: -Get.width * .05,
              child: Obx(
                () => AnimatedContainer(
                  width: compassWidth,
                  duration: Duration(milliseconds: _.milliSecondsStep),
                  transform: Matrix4Transform()
                      .rotateDegrees(_.currentStep.value % 2 == 0 ? -5 : 5,
                          origin: Offset(compassWidth * .5, compassWidth * .5))
                      .matrix4,
                  child: FittedBox(
                      fit: BoxFit.fitWidth,
                      child: SvgPicture.asset('assets/images/img_compass.svg')),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
