import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:palumba_eu/data/model/election.dart';
import 'package:palumba_eu/global_widgets/custom_button.dart';
import 'package:palumba_eu/global_widgets/custom_progress_bar.dart';
import 'package:palumba_eu/global_widgets/custom_spacer.dart';
import 'package:palumba_eu/modules/results/pages/results_shared/results_heart_stack.dart';
import 'package:palumba_eu/utils/common_ui/app_colors.dart';
import 'package:palumba_eu/utils/common_ui/app_dimens.dart';
import 'package:palumba_eu/utils/common_ui/app_texts.dart';
import 'package:palumba_eu/utils/managers/election_manager.dart';
import 'package:palumba_eu/utils/managers/i18n_manager/translations/generated/l10n.dart';
import 'package:screenshot/screenshot.dart';

import 'components/custom_mds_graphic/dotted_container.dart';
import 'results_controller.dart';

class ResultsPage extends GetView<ResultsController> {
  const ResultsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopScope(
        child: SafeArea(
      top: false,
      child: Scaffold(
        key: controller.globalKey,
        backgroundColor: ElectionManager.currentElection.value.background,
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
                      color: controller
                                  .pages[controller.currentPageIndex.value] ==
                              "ResultsPageMemes"
                          ? AppColors.yellow
                          : ElectionManager.currentElection.value.background,
                    ),
                    Obx(
                      () => Opacity(
                        opacity: controller.currentPage.showSpecialBackground
                            ? 1
                            : 0,
                        child: Container(
                          color:
                              ElectionManager.currentElection.value.background,
                          child: Stack(
                            children: [
                              Align(
                                alignment: Alignment.topLeft,
                                child: Padding(
                                  padding: EdgeInsets.only(top: 180),
                                  child: SvgPicture.asset(
                                    ElectionManager.currentElection.value
                                        .stickerBallotBox1,
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.topRight,
                                child: Padding(
                                  padding: EdgeInsets.only(top: 190),
                                  child: SvgPicture.asset(
                                    ElectionManager.currentElection.value
                                        .stickerBallotBox2,
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.bottomLeft,
                                child: Padding(
                                  padding: EdgeInsets.only(bottom: 40),
                                  child: SvgPicture.asset(
                                    ElectionManager.currentElection.value
                                        .stickerBallotBox3,
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.bottomRight,
                                child: Padding(
                                  padding: EdgeInsets.only(right: 10),
                                  child: SvgPicture.asset(
                                    ElectionManager.currentElection.value
                                        .stickerBallotBox4,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),

                    // Has to be on parent because result page is not full height
                    Obx(() => controller.currentPage.showDottedContainer
                        ? DottedContainer(
                            width: double.infinity,
                            height: Get.height,
                            pointColor: AppColors.lightPrimary
                                .withAlpha((0.35 * 255).toInt()))
                        : SizedBox.shrink()),
                    Obx(() => controller.currentPage.showMemesBackground
                        ? Stack(
                            children: [
                              Container(
                                width: double.infinity,
                                height: Get.height,
                                color: AppColors.yellow,
                              ),
                              MemesStack(),
                            ],
                          )
                        : SizedBox.shrink()),
                    Obx(() => controller.currentPage.showGuidBackground
                        ? Stack(
                            children: [
                              Container(
                                width: double.infinity,
                                height: Get.height,
                                color: AppColors.primary,
                              ),
                              Positioned(
                                bottom: 0,
                                child: Padding(
                                  padding: EdgeInsets.only(left: 10),
                                  child: Image.asset(
                                    'assets/images/img_pigeon_guid.png',
                                    width: Get.width * 0.95,
                                    height: Get.height / 2.2,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                            ],
                          )
                        : SizedBox.shrink()),
                    Obx(() => controller.currentPage.showBackgroundTarget
                        ? Stack(
                            children: [
                              Container(
                                width: double.infinity,
                                height: Get.height,
                                // color: AppColors.yellow,
                              ),
                              TargetStack(),
                            ],
                          )
                        : SizedBox.shrink()),
                    Obx(() => controller.currentPage.showBackgroundOpinion
                        ? Stack(
                            children: [
                              Container(
                                width: double.infinity,
                                height: Get.height,
                                color: AppColors.primary,
                              ),
                              Positioned(
                                bottom: 0,
                                child: SvgPicture.asset(
                                  'assets/images/ic_skyline.svg',
                                  // width: Get.width * 0.95,
                                  // height: Get.height / 3,
                                  fit: BoxFit.fitWidth,
                                ),
                              ),
                            ],
                          )
                        : SizedBox.shrink()),

                    // Has to be on parent because result page is not full height
                    Obx(() => controller.currentPage.showBallotBoxBackground
                        ? Align(
                            alignment: Alignment.bottomCenter,
                            child: Image.asset(
                              ElectionManager
                                  .currentElection.value.ballotBoxBig,
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
                              step: controller.currentPageIndex.value,
                              totalSteps: controller.pages.length,
                              width: double.infinity,
                              isDotted: true,
                              progressColor:
                                  controller.currentPage.showGuidBackground ==
                                              true ||
                                          controller.currentPage
                                                  .showBackgroundOpinion ==
                                              true
                                      ? AppColors.yellow
                                      : AppColors.primary,
                              backgroundColor:
                                  controller.currentPage.showMemesBackground ==
                                          true
                                      ? AppColors.background
                                      : AppColors.lightPrimary,
                            )),
                      ),

                      //Pages
                      Expanded(
                          child: SingleChildScrollView(
                        child: Column(children: [
                          Screenshot(
                            controller:
                                controller.foregroundScreenshotController,
                            child: AspectRatio(
                                aspectRatio: 9 / 16,
                                child: Column(
                                  children: [
                                    CustomSpacer(
                                      multiplier: 3,
                                    ),
                                    //Rounded image and #appname

                                    Obx(() => controller.currentPage
                                                    .showGuidBackground ==
                                                true ||
                                            controller.currentPage
                                                    .showBackgroundOpinion ==
                                                true
                                        ? SizedBox()
                                        : Padding(
                                            padding: AppDimens.lateralPadding,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                /* Obx(() => SvgPicture.asset(
                                                ElectionManager.currentElection
                                                    .value.logoCircle,
                                                height: 40,
                                              )),*/

                                                Obx(() {
                                                  final asset = ElectionManager
                                                      .currentElection
                                                      .value
                                                      .logoCircle;
                                                  return buildImage(asset);
                                                }),
                                                /*if (kDebugMode)
                                                  Obx(() => AppTexts.small(
                                                      (controller.currentPageIndex.value + 1)
                                                          .toString(),
                                                      color:
                                                          AppColors.primary)),*/
                                                Spacer(),
                                                AppTexts.title(
                                                    '#${S.of(context).shortAppName}',
                                                    forceCaprasimo: true,
                                                    color: AppColors.primary),
                                              ],
                                            ),
                                          )),

                                    CustomSpacer(
                                      multiplier: 1,
                                    ),
                                    Expanded(
                                        child: PageView.builder(
                                            physics:
                                                NeverScrollableScrollPhysics(),
                                            allowImplicitScrolling: true,
                                            controller:
                                                controller.pageController,
                                            itemCount: controller.pages.length,
                                            itemBuilder: (context, index) =>
                                                controller.pages[index]))
                                  ],
                                )),
                          )
                        ]),
                      ))
                    ],
                  ),
                ),

                //Share button only showed in showButtonSharePages
                Obx(
                  () => controller.loadingShare
                      ? SizedBox.shrink()
                      : controller.currentPage.showShare
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
                                    color: controller.currentPage
                                                .showSpecialBackground ||
                                            controller
                                                .currentPage.showMemesBackground
                                        ? Colors.white
                                        : AppColors.primary,
                                  ),
                                  radius: AppDimens.borderRadius,
                                  color: controller.currentPage
                                              .showSpecialBackground ||
                                          controller
                                              .currentPage.showMemesBackground
                                      ? AppColors.primary
                                      : AppColors.yellow,
                                  textColor: controller.currentPage
                                              .showSpecialBackground ||
                                          controller
                                              .currentPage.showMemesBackground
                                      ? Colors.white
                                      : AppColors.primary,
                                  bold: true,
                                  border: ButtonBorderParameters(
                                      isOutside: true,
                                      width: 3,
                                      color: controller
                                              .currentPage.showSpecialBackground
                                          ? AppColors.lightPrimary
                                          : AppColors.lightYellow),
                                ),
                              ),
                            )
                          : SizedBox.shrink(),
                ),
              ],
            )),
      ),
    ));
  }

  Widget buildImage(String assetPath) {
    if (assetPath.toLowerCase().endsWith('.svg')) {
      return SvgPicture.asset(
        assetPath,
        height: 40,
      );
    } else if (assetPath.toLowerCase().endsWith('.png') ||
        assetPath.toLowerCase().endsWith('.jpg') ||
        assetPath.toLowerCase().endsWith('.jpeg')) {
      return Image.asset(
        assetPath,
        height: 40,
      );
    } else {
      return const SizedBox.shrink();
    }
  }
}
