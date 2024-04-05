import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:palumba_eu/global_widgets/custom_button.dart';
import 'package:palumba_eu/global_widgets/custom_network_image.dart';
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
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.primary,
        body: Stack(
          children: [
            Obx(
              () => AnimatedOpacity(
                duration: Durations.long1,
                opacity:
                    controller.currentPage == 3 || controller.currentPage == 4
                        ? 1
                        : 0,
                child: Container(
                  color: Color(0xFF261930),
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
                  Padding(
                    padding: AppDimens.lateralPadding,
                    child: Obx(() => CustomProgressBar(
                          step: controller.currentPage,
                          totalSteps: controller.pages.length,
                          width: double.infinity,
                          isDotted: true,
                        )),
                  ),
                  CustomSpacer(
                    multiplier: 3,
                  ),
                  Padding(
                    padding: AppDimens.lateralPadding,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomNetworkImage(
                          height: 24,
                          width: 24,
                          imageUrl: 'https://picsum.photos/200/300',
                          placeholder: 'assets/images/image_placeholder.svg',
                          isAvatar: true,
                        ),
                        Spacer(),
                        AppTexts.regular(
                            '#${S.of(context).resultsShortAppName}'),
                      ],
                    ),
                  ),
                  CustomSpacer(
                    multiplier: 3,
                  ),
                  Expanded(
                    child: PageView.builder(
                        controller: controller.pageController,
                        itemCount: controller.pages.length,
                        itemBuilder: (context, index) =>
                            controller.pages[index]),
                  ),
                ],
              ),
            ),
            Obx(
              () => controller.showButtonSharePages
                      .contains(controller.currentPage)
                  ? Padding(
                      padding: EdgeInsets.only(
                          bottom: AppDimens.bigLateralPaddingValue),
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: CustomButton(
                          text: S.of(context).resultsShare,
                          onPressed: () {},
                          prefixIcon:
                              IconButtonParameters('ic_share', size: 18),
                          radius: 50,
                          color: AppColors.whiteButton,
                          textColor: AppColors.primary,
                          bold: false,
                          border:
                              ButtonBorderParameters(isOutside: true, width: 4),
                        ),
                      ),
                    )
                  : SizedBox.shrink(),
            ),
            // Container(color: Color(0xFF261930).withOpacity(.9)),
          ],
        ));
  }
}
