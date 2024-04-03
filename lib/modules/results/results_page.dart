import 'package:flutter/material.dart';
import 'package:palumba_eu/global_widgets/custom_spacer.dart';
import 'package:palumba_eu/global_widgets/emoji_label_container.dart';
import 'package:palumba_eu/modules/results/pages/page_1/results_page_1.dart';
import 'package:get/get.dart';
import 'package:palumba_eu/utils/common_ui/app_dimens.dart';
import 'package:palumba_eu/utils/common_ui/app_texts.dart';
import 'package:palumba_eu/utils/managers/i18n_manager/translations/generated/l10n.dart';

import '../../global_widgets/card/card_progressbar.dart';
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
                child: Obx(() => CardProgressBar(
                    step: controller.currentPage,
                    totalSteps: controller.pages.length)),
              ),
              CustomSpacer(
                multiplier: 3,
              ),
              Padding(
                padding: AppDimens.lateralPadding,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    //TODO: Remove container add image
                    Container(
                      width: 24,
                      height: 24,
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        shape: BoxShape.circle,
                      ),
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
