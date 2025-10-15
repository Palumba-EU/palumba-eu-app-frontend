import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:palumba_eu/modules/results/pages/results_page.dart';
import 'package:palumba_eu/modules/results/results_controller.dart';
import 'package:palumba_eu/utils/common_ui/app_colors.dart';
import 'package:palumba_eu/utils/common_ui/app_dimens.dart';
import 'package:palumba_eu/utils/common_ui/app_texts.dart';

import '../../../utils/managers/i18n_manager/translations/generated/l10n.dart';

class ResultsPageGuid1 extends GetView<ResultsController> with ResultsPage {
  @override
  final bool showGuidBackground = true;

  @override
  final bool showShare = false;

  final int? guidPage;

  ResultsPageGuid1({
    this.guidPage = 1,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: Get.height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            // CustomSpacer(multiplier: 3),
            Container(
              height: Get.height * 0.4,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                spacing: 20,
                children: [
                  Padding(
                    padding: EdgeInsetsGeometry.symmetric(horizontal: 32),
                    child: AppTexts.title(
                        guidPage == 1
                            ? S.of(context).howCandidateCompareEachOther
                            : S.of(context).whatTopicSeemToCloseYourHeart,
                        color: AppColors.background,
                        fontSize: 32,
                        textAlign: TextAlign.center),
                  ),
                  Padding(
                    padding: AppDimens.lateralPadding,
                    child: AppTexts.medium(
                        guidPage == 1
                            ? S.of(context).keepLearning
                            : S.of(context).seeMore,
                        color: AppColors.background,
                        textAlign: TextAlign.center),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
