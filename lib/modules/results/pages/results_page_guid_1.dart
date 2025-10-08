import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:palumba_eu/modules/results/pages/results_page.dart';
import 'package:palumba_eu/modules/results/results_controller.dart';
import 'package:palumba_eu/utils/common_ui/app_colors.dart';
import 'package:palumba_eu/utils/common_ui/app_dimens.dart';
import 'package:palumba_eu/utils/common_ui/app_texts.dart';

import '../../../global_widgets/custom_spacer.dart';

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
    return SingleChildScrollView(
        child: SafeArea(
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          spacing: 20,
          children: [
            CustomSpacer(multiplier: 3),
            Padding(
              padding: EdgeInsetsGeometry.symmetric(horizontal: 32),
              child: AppTexts.title(
                  guidPage == 1
                      ? "Let’s see how candidates compare to each other - and where do you stand in more detail"
                      : "Cool! And what topics seem close to your heart?",
                  color: AppColors.background,
                  fontSize: 32,
                  textAlign: TextAlign.center),
            ),
            Padding(
              padding: AppDimens.lateralPadding,
              child: AppTexts.medium(
                  guidPage == 1 ? "Keep learning >" : "See more >",
                  color: AppColors.background,
                  textAlign: TextAlign.center),
            ),
          ],
        ),
      ),
    ));
  }
}
