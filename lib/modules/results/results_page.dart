import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:palumba_eu/global_widgets/custom_button.dart';
import 'package:palumba_eu/global_widgets/custom_progress_bar.dart';
import 'package:palumba_eu/global_widgets/custom_spacer.dart';
import 'package:get/get.dart';
import 'package:palumba_eu/utils/common_ui/app_colors.dart';
import 'package:palumba_eu/utils/common_ui/app_dimens.dart';
import 'package:palumba_eu/utils/common_ui/app_texts.dart';
import 'package:palumba_eu/utils/managers/i18n_manager/translations/generated/l10n.dart';
import 'package:screenshot/screenshot.dart';

import 'components/custom_mds_graphic/dotted_container.dart';
import 'results_controller.dart';

class ResultsPage extends GetView<ResultsController> {
  const ResultsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopScope(
      child: Screenshot(
        controller: controller.screenshotPagesControllers[3]!,
        child: Scaffold(
            key: controller.globalKey,
            backgroundColor: AppColors.background,
            body: Screenshot(
              controller: controller.screenshotPagesControllers[8]!,
              child: Stack(
                children: [
                  //Animate background color for special pages
                  Obx(
                    () => AnimatedOpacity(
                      duration: Durations.medium2,
                      opacity: controller.isSpecialPage ? 1 : 0,
                      child: Container(
                        color: AppColors.blue,
                        child: Stack(
                          children: [
                            Align(
                              alignment: Alignment.topLeft,
                              child: Padding(
                                padding: EdgeInsets.only(top: 180),
                                child: SvgPicture.asset(
                                  'assets/images/ic_sticker_ballot_box1.svg',
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.topRight,
                              child: Padding(
                                padding: EdgeInsets.only(top: 190),
                                child: SvgPicture.asset(
                                  'assets/images/ic_sticker_ballot_box2.svg',
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.bottomLeft,
                              child: Padding(
                                padding: EdgeInsets.only(bottom: 40),
                                child: SvgPicture.asset(
                                  'assets/images/ic_sticker_ballot_box3.svg',
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.bottomRight,
                              child: Padding(
                                padding: EdgeInsets.only(right: 10),
                                child: SvgPicture.asset(
                                  'assets/images/ic_sticker_ballot_box4.svg',
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),

                  Obx(() => controller.currentPage == 3
                      ? Expanded(
                          child: DottedContainer(
                              width: double.infinity,
                              height: Get.height,
                              pointColor:
                                  AppColors.lightPrimary.withOpacity(.35)),
                        )
                      : SizedBox.shrink()),

                  SafeArea(
                    bottom: false,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        CustomSpacer(
                          multiplier: 3,
                        ),
                        //Progressbar
                        Padding(
                          padding: AppDimens.lateralPadding,
                          child: Obx(() => controller.loadingShare
                              ? SizedBox.shrink()
                              : CustomProgressBar(
                                  step: controller.currentPage,
                                  totalSteps: controller.pages.length,
                                  width: double.infinity,
                                  isDotted: true,
                                  progressColor: AppColors.primary,
                                  backgroundColor: AppColors.lightPrimary,
                                )),
                        ),
                        CustomSpacer(
                          multiplier: 3,
                        ),

                        //Rounded image and #appname
                        Obx(
                          () => controller.loadingShare
                              ? SizedBox.shrink()
                              : Padding(
                                  padding: AppDimens.lateralPadding,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SvgPicture.asset(
                                        'assets/images/logo_circle.svg',
                                        height: 40,
                                      ),
                                      Spacer(),
                                      AppTexts.title(
                                          '#${S.of(context).shortAppName}',
                                          color: AppColors.primary),
                                    ],
                                  ),
                                ),
                        ),

                        //Pages
                        Expanded(
                          child: GestureDetector(
                            onTapDown: controller.changePage,
                            behavior: HitTestBehavior.translucent,
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

                  //Share button only showed in showButtonSharePages
                  Obx(
                    () => controller.loadingShare
                        ? SizedBox.shrink()
                        : controller.showButtonSharePages
                                .contains(controller.currentPage)
                            ? Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal:
                                        AppDimens.bigLateralPaddingValue * 2,
                                    vertical: AppDimens.bigLateralPaddingValue),
                                child: Align(
                                  alignment: Alignment.bottomCenter,
                                  child: CustomButton(
                                    loading: controller.loadingShare,
                                    text: S.of(context).resultsShare,
                                    expanded: true,
                                    onPressed: controller.shareContent,
                                    prefixIcon: IconButtonParameters('ic_share',
                                        size: 18,
                                        color: AppColors
                                            .primary //Color(0XFFAEAEAE),
                                        ),
                                    radius: AppDimens.borderRadius,
                                    color: AppColors.yellow,
                                    //Color(0XFF1F1F1F),
                                    textColor: AppColors.primary,
                                    //Color(0XFFAEAEAE),
                                    bold: true,
                                    border: ButtonBorderParameters(
                                        isOutside: true,
                                        width: 3,
                                        color: AppColors
                                            .lightYellow //Color(0XFFAEAEAE),
                                        ),
                                  ),
                                ),
                              )
                            : SizedBox.shrink(),
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
