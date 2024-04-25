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
import 'package:palumba_eu/utils/managers/i18n_manager/translations/generated/l10n.dart';

class LoadingResultsPage extends StatelessWidget {
  const LoadingResultsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final compassWidth = Get.width * 1.05;
    return GetBuilder<LoadingResultsController>(
      builder: (_) => Scaffold(
          backgroundColor: AppColors.primary,
          body: SizedBox.expand(
            child: Stack(
              children: [
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                          child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CustomSpacer(
                            multiplier: 7,
                          ),
                          Obx(() => CustomProgressBar(
                                duration: Duration(seconds: _.secondsStep),
                                width: Get.width * 0.675,
                                step: _.currentStep.value,
                                totalSteps: _.totalSteps,
                                progressColor: AppColors.text,
                                backgroundColor: AppColors.lightPrimary,
                              )),
                          CustomSpacer(multiplier: 3),
                          Padding(
                            padding: AppDimens.lateralPadding,
                            child: Obx(() {
                              var text = '';
                              if (_.currentStep.value == 1) {
                                text = S.of(context).loadingResultsPageTitle1;
                              } else if (_.currentStep.value == 2) {
                                text = S.of(context).loadingResultsPageTitle2;
                              } else if (_.currentStep.value == 3) {
                                text = S
                                    .of(context)
                                    .loadingResultsPageTitle3(_.countryName);
                              } else if (_.currentStep.value == 4) {
                                text = S.of(context).loadingResultsPageTitle4;
                              }

                              return AppTexts.title(
                                text,
                                textAlign: TextAlign.center,
                              );
                            }),
                          ),
                        ],
                      )),
                      Expanded(child: SizedBox.shrink()),
                      /*  SizedBox(
                          width: Get.width * 2,
                          child: FittedBox(
                              fit: BoxFit.fitWidth,
                              child: SvgPicture.asset(
                                  'assets/images/ic_compass.svg')))*/
                    ],
                  ),
                ),
                Positioned(
                  bottom: -Get.width * .05,
                  left: -Get.width * .05,
                  right: -Get.width * .05,
                  child: Obx(
                    () => AnimatedContainer(
                      width: compassWidth,
                      duration: const Duration(seconds: 2),
                      transform: Matrix4Transform()
                          .rotateDegrees(_.currentStep.value % 2 == 0 ? -5 : 5,
                              origin:
                                  Offset(compassWidth * .5, compassWidth * .5))
                          .matrix4,
                      child: FittedBox(
                          fit: BoxFit.fitWidth,
                          child:
                              SvgPicture.asset('assets/images/img_compass.svg')),
                    ),
                  ),
                )
              ],
            ),
          )),
    );
  }
}
