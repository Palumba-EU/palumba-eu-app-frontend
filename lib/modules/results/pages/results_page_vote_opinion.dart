import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:palumba_eu/data/model/election.dart';
import 'package:palumba_eu/data/model/goingToVote_model.dart';
import 'package:palumba_eu/global_widgets/custom_button.dart';
import 'package:palumba_eu/global_widgets/custom_spacer.dart';
import 'package:palumba_eu/modules/results/pages/results_page.dart';
import 'package:palumba_eu/modules/results/results_controller.dart';
import 'package:palumba_eu/utils/common_ui/app_colors.dart';
import 'package:palumba_eu/utils/common_ui/app_texts.dart';
import 'package:palumba_eu/utils/managers/election_manager.dart';
import 'package:palumba_eu/utils/managers/i18n_manager/translations/generated/l10n.dart';

class ResultsPageVoteOpinion extends GetView<ResultsController>
    with ResultsPage {
  final RxnBool willVote;

  @override
  final bool showShare = false;

  @override
  final bool showBackgroundOpinion = true;

  ResultsPageVoteOpinion({
    required this.willVote,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        CustomSpacer(multiplier: 8),
        SvgPicture.asset(
          "assets/images/ic_i_voted.svg",
          width: Get.width * 0.4,
          height: Get.width * 0.4,
        ),
        CustomSpacer(multiplier: 4),
        Align(
            alignment: Alignment.center, // Center horizontally
            child: Container(
              width: Get.width * 0.9,
              child: Center(
                child: AppTexts.title(S.of(context).oneLastThing,
                    color: AppColors.background,
                    fontSize: 32,
                    textAlign: TextAlign.center),
              ),
            )),
        Align(
            alignment: Alignment.center, // Center horizontally
            child: Container(
              width: Get.width * 0.8,
              child: Center(
                child: AppTexts.title(S.of(context).areYouPlanningToVote,
                    color: AppColors.background,
                    fontSize: 32,
                    textAlign: TextAlign.center),
              ),
            )),
        CustomSpacer(multiplier: 4),
        content(context)
      ],
    );
  }

  Widget content(BuildContext context) {
    return Obx(() {
      return _goingToVote(context);
    });
  }

  Widget _goingToVote(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomButton(
              onPressed: () => controller.handleGoVoteQuestion(GoingToVote.no),
              text: S.of(context).nope,
              color: AppColors.background,
              border: ButtonBorderParameters(),
            ),
            SizedBox(
              width: 22,
            ),
            CustomButton(
              onPressed: () => controller.handleGoVoteQuestion(GoingToVote.yes),
              text: ElectionManager.currentElection.value
                  .resultsPage10YesButton(context),
              border: ButtonBorderParameters(),
            ),
          ],
        )
      ],
    );
  }
}
