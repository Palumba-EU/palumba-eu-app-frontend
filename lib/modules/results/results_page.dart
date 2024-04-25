import 'package:flutter/material.dart';
import 'package:palumba_eu/global_widgets/custom_button.dart';
import 'package:palumba_eu/global_widgets/custom_progress_bar.dart';
import 'package:palumba_eu/global_widgets/custom_spacer.dart';
import 'package:get/get.dart';
import 'package:palumba_eu/utils/common_ui/app_colors.dart';
import 'package:palumba_eu/utils/common_ui/app_dimens.dart';
import 'package:palumba_eu/utils/common_ui/app_texts.dart';
import 'package:palumba_eu/utils/managers/i18n_manager/translations/generated/l10n.dart';

import 'results_controller.dart';

class ResultsPage extends GetView<ResultsController> {
  const ResultsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopScope(
      child: Scaffold(
          backgroundColor: AppColors.background,
          body: Stack(
            children: [
              //Animate background color for pages 4, 5
              Obx(
                () => AnimatedOpacity(
                  duration: Durations.medium2,
                  opacity: controller.isSpecialPage ? 1 : 0,
                  child: Container(
                    color: AppColors.secondary,
                  ),
                ),
              ),
              SafeArea(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CustomSpacer(
                      multiplier: 3,
                    ),
                    //Progressbar
                    Padding(
                      padding: AppDimens.lateralPadding,
                      child: Obx(() => CustomProgressBar(
                            step: controller.currentPage,
                            totalSteps: controller.pages.length,
                            width: double.infinity,
                            isDotted: true,
                            progressColor: AppColors.primary,
                            backgroundColor: controller.isSpecialPage
                                ? Colors.white
                                : AppColors.lightPrimary,
                          )),
                    ),
                    CustomSpacer(
                      multiplier: 3,
                    ),
                    //Rounded image and #appname
                    Padding(
                      padding: AppDimens.lateralPadding,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 40,
                            width: 24,
                            child: Image.asset(
                              'assets/images/pigeon.png',
                              height: 24,
                              width: 24,
                            ),
                          ),
                          Spacer(),
                          Obx(() => AppTexts.regular(
                              '#${S.of(context).shortAppName}',
                              color: controller.isSpecialPage
                                  ? Colors.white
                                  : AppColors.primary)),
                        ],
                      ),
                    ),
                    CustomSpacer(
                      multiplier: 3,
                    ),
                    //Pages
                    Expanded(
                      child: GestureDetector(
                        onTapDown: controller.changePage,
                        child: PageView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            allowImplicitScrolling: true,
                            controller: controller.pageController,
                            itemCount: controller.pages.length,
                            itemBuilder: (context, index) =>
                                controller.pages[index]),
                      ),
                    ),
                  ],
                ),
              ),
              //Share button only showed in pages 2, 3, 6
              Obx(
                () => controller.showButtonSharePages
                        .contains(controller.currentPage)
                    ? Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: AppDimens.bigLateralPaddingValue * 2,
                            vertical: AppDimens.bigLateralPaddingValue),
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: CustomButton(
                            text: S.of(context).resultsShare,
                            expanded: true,
                            onPressed: controller.shareContent,
                            prefixIcon:
                                IconButtonParameters('ic_share', size: 18),
                            radius: AppDimens.borderRadius,
                            color: AppColors.yellow,
                            textColor: AppColors.primary,
                            bold: true,
                            border: ButtonBorderParameters(
                                isOutside: true, width: 4),
                          ),
                        ),
                      )
                    : SizedBox.shrink(),
              ),
              // Container(color: Color(0xFF261930).withOpacity(.9)),
            ],
          )),
    );
  }
}
