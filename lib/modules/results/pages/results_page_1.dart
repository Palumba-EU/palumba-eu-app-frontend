import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:palumba_eu/data/model/election.dart';
import 'package:palumba_eu/global_widgets/custom_spacer.dart';
import 'package:palumba_eu/modules/results/pages/results_page.dart';
import 'package:palumba_eu/modules/results/results_controller.dart';
import 'package:palumba_eu/utils/common_ui/app_colors.dart';
import 'package:palumba_eu/utils/common_ui/app_dimens.dart';
import 'package:palumba_eu/utils/common_ui/app_texts.dart';
import 'package:palumba_eu/utils/managers/election_manager.dart';

class ResultsPage1 extends GetView<ResultsController> with ResultsPage {
  @override
  final bool showShare = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppDimens.lateralPadding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomSpacer(
            multiplier: 2,
          ),
          Expanded(
            child: Center(
              child: SvgPicture.asset(
                'assets/images/img_results.svg',
              ),
            ),
          ),
          CustomSpacer(
            multiplier: 2,
          ),
          AppTexts.title(
              ElectionManager.currentElection.value.resultsPage1Title(context),
              color: AppColors.primary),
          CustomSpacer(),
          AppTexts.small(
              ElectionManager.currentElection.value.resultsPage1Text(context),
              color: AppColors.primary),
          CustomSpacer(
            multiplier: 4,
          ),
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () {
                controller.pageController.nextPage(
                  duration: Duration(milliseconds: 1),
                  curve: Curves.easeInOut,
                );
              },
              child: AppTexts.regular(
                  ElectionManager.currentElection.value
                      .resultsPage1Button(context),
                  bold: true,
                  color: AppColors.lightPrimary),
            ),
          ),
          CustomSpacer(),
        ],
      ),
    );
  }
}
