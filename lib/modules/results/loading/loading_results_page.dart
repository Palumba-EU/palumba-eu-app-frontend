import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:palumba_eu/global_widgets/custom_progress_bar.dart';

import 'package:palumba_eu/global_widgets/custom_spacer.dart';
import 'package:palumba_eu/modules/results/loading/loading_results_controller.dart';
import 'package:lottie/lottie.dart';
import 'package:get/get.dart';

import 'package:palumba_eu/utils/common_ui/app_dimens.dart';
import 'package:palumba_eu/utils/common_ui/app_texts.dart';
import 'package:palumba_eu/utils/managers/i18n_manager/translations/generated/l10n.dart';

class LoadingResultsPage extends StatelessWidget {
  const LoadingResultsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoadingResultsController>(
      builder: (_) => Scaffold(
          body: Stack(
        children: [
          Align(
            alignment: Alignment.bottomRight,
            child: Obx(() => SvgPicture.asset(
                  'assets/images/img_background_blue${_.currentStep.value}.svg',
                  fit: BoxFit.fitWidth,
                )),
          ),
          Column(
            children: [
              Expanded(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Center(
                    child: SizedBox(
                      width: 100,
                      height: 75,
                      child: Lottie.asset('assets/anims/loading.json'),
                    ),
                  ),
                  CustomSpacer(
                    small: true,
                  ),
                  Padding(
                    padding: AppDimens.lateralPadding,
                    child: Obx(() {
                      var text = '';
                      if (_.currentStep.value == 1) {
                        text = S.of(context).loadingResultsPageTitle1;
                      } else if (_.currentStep.value == 2) {
                        text = S.of(context).loadingResultsPageTitle2;
                      } else if (_.currentStep.value == 3) {
                        text = S.of(context).loadingResultsPageTitle3;
                      } else if (_.currentStep.value == 4) {
                        text = S.of(context).loadingResultsPageTitle4;
                      } else if (_.currentStep.value == 5) {
                        text = S.of(context).loadingResultsPageTitle5;
                      }

                      return AppTexts.title(text,
                          textAlign: TextAlign.center,
                          color: Theme.of(context).primaryColor);
                    }),
                  ),
                  CustomSpacer(
                    multiplier: 7,
                  ),
                  Obx(() => CustomProgressBar(
                        width: Get.width * 0.675,
                        step: _.currentStep.value,
                        totalSteps: _.totalSteps,
                        progressColor: Theme.of(context).primaryColor,
                        backgroundColor: Colors.white.withOpacity(0.25),
                      ))
                ],
              )),
              Expanded(child: SizedBox.shrink())
            ],
          )
        ],
      )),
    );
  }
}
