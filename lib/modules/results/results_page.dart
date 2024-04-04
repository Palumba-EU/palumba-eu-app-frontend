import 'package:flutter/material.dart';
import 'package:palumba_eu/global_widgets/custom_network_image.dart';
import 'package:palumba_eu/global_widgets/custom_progress_bar.dart';
import 'package:palumba_eu/global_widgets/custom_spacer.dart';
import 'package:get/get.dart';
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
        body: SafeArea(
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
                    AppTexts.regular('#${S.of(context).resultsShortAppName}'),
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
                    itemBuilder: (context, index) => controller.pages[index]),
              ),
            ],
          ),
        ));
  }
}
