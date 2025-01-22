import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:palumba_eu/data/model/election.dart';
import 'package:palumba_eu/global_widgets/custom_button.dart';
import 'package:palumba_eu/global_widgets/custom_horizontal_spacer.dart';
import 'package:palumba_eu/global_widgets/custom_spacer.dart';
import 'package:palumba_eu/modules/home/home_page_controller.dart';
import 'package:palumba_eu/modules/results/results_controller.dart';
import 'package:palumba_eu/utils/common_ui/app_colors.dart';
import 'package:palumba_eu/utils/common_ui/app_dimens.dart';
import 'package:palumba_eu/utils/common_ui/app_texts.dart';
import 'package:palumba_eu/utils/managers/election_manager.dart';
import 'package:palumba_eu/utils/managers/i18n_manager/translations/generated/l10n.dart';

class ResultsPage11 extends GetView<ResultsController> {
  const ResultsPage11({super.key, required this.onDisplayBallotTutorial});
  final Function() onDisplayBallotTutorial;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        CustomSpacer(multiplier: 6),
        Obx(() => SvgPicture.asset(
            ElectionManager.currentElection.value.voteResult10)),
        CustomSpacer(multiplier: 3),
        content(context)
      ],
    );
  }

  Widget content(BuildContext context) {
    return Column(
      children: [
        Padding(
            padding: AppDimens.lateralPadding,
            child: AppTexts.title(
                'Do you want a tutorial on how to use the ballot?',
                color: AppColors.primary,
                textAlign: TextAlign.center)),
        CustomSpacer(multiplier: 2),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () {
                Get.offAllNamed(HomePageController.route);
              },
              child: AppTexts.regular(S.of(context).no,
                  bold: true, color: AppColors.primary),
            ),
            CustomHorizontalSpacer(),
            CustomButton(
              onPressed: onDisplayBallotTutorial,
              text: S.of(context).resultsPage10YesButton,
              //Default parameters
              border: ButtonBorderParameters(),
            ),
          ],
        )
      ],
    );
  }
}
