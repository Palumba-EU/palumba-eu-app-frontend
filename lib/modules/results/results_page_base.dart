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
        child: Scaffold(
      key: controller.globalKey,
      backgroundColor: AppColors.background,
      body: GestureDetector(
          onTapDown: controller.changePage,
          behavior: HitTestBehavior.translucent,
          child: Stack(
            children: [
              //Animate background color for special pages
              Screenshot(
                controller: controller.backgroundScreenshotController,
                child: Stack(children: [
                  Container(
                    color: AppColors.background,
                  ),

                  Obx(
                    () => Opacity(
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
                      ? DottedContainer(
                          width: double.infinity,
                          height: Get.height,
                          pointColor: AppColors.lightPrimary.withOpacity(.35))
                      : SizedBox.shrink()),

                  // HACK but content page has restricted size
                  Obx(() => controller.currentPage == 9
                      ? Align(
                          alignment: Alignment.bottomCenter,
                          child: Image.asset(
                            'assets/images/img_ballot_box_big.png',
                            fit: BoxFit.fitWidth,
                          ))
                      : SizedBox.shrink()),
                ]),
              ),

              SafeArea(
                bottom: false,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CustomSpacer(
                      multiplier: 1,
                    ),
                    //Progressbar
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: AppDimens.lateralPaddingValue),
                      child: Obx(() => CustomProgressBar(
                            step: controller.currentPage,
                            totalSteps: controller.pages.length,
                            width: double.infinity,
                            isDotted: true,
                            progressColor: AppColors.primary,
                            backgroundColor: AppColors.lightPrimary,
                          )),
                    ),

                    //Pages
                    Expanded(
                        child: Column(children: [
                      Screenshot(
                        controller: controller.foregroundScreenshotController,
                        child: AspectRatio(
                            aspectRatio: 9 / 16,
                            child: Column(
                              children: [
                                CustomSpacer(
                                  multiplier: 3,
                                ),
                                //Rounded image and #appname
                                Padding(
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
                                          forceCaprasimo: true,
                                          color: AppColors.primary),
                                    ],
                                  ),
                                ),
                                CustomSpacer(
                                  multiplier: 1,
                                ),
                                Expanded(
                                    child: PageView.builder(
                                        physics: NeverScrollableScrollPhysics(),
                                        allowImplicitScrolling: true,
                                        controller: controller.pageController,
                                        itemCount: controller.pages.length,
                                        itemBuilder: (context, index) =>
                                            controller.pages[index]))
                              ],
                            )),
                      )
                    ]))
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
                                prefixIcon: IconButtonParameters(
                                  'ic_share',
                                  size: 18,
                                  color: controller.isSpecialPage
                                      ? Colors.white
                                      : AppColors.primary,
                                ),
                                radius: AppDimens.borderRadius,
                                color: controller.isSpecialPage
                                    ? AppColors.primary
                                    : AppColors.yellow,
                                textColor: controller.isSpecialPage
                                    ? Colors.white
                                    : AppColors.primary,
                                bold: true,
                                border: ButtonBorderParameters(
                                    isOutside: true,
                                    width: 3,
                                    color: controller.isSpecialPage
                                        ? AppColors.lightPrimary
                                        : AppColors.lightYellow),
                              ),
                            ),
                          )
                        : SizedBox.shrink(),
              )
            ],
          )),
    ));
  }
}
