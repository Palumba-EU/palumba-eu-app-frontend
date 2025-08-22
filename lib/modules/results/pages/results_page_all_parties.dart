import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:palumba_eu/data/model/election.dart';
import 'package:palumba_eu/data/model/results_data.dart';
import 'package:palumba_eu/global_widgets/custom_divider.dart';
import 'package:palumba_eu/global_widgets/custom_spacer.dart';
import 'package:palumba_eu/modules/results/pages/results_page.dart';
import 'package:palumba_eu/modules/results/pages/results_shared/results_tile.dart';
import 'package:palumba_eu/modules/results/results_controller.dart';
import 'package:palumba_eu/utils/common_ui/app_colors.dart';
import 'package:palumba_eu/utils/common_ui/app_dimens.dart';
import 'package:palumba_eu/utils/common_ui/app_texts.dart';
import 'package:palumba_eu/utils/managers/election_manager.dart';

class PoliticalPartyWithPercent {
  int percent;
  PoliticParty party;

  PoliticalPartyWithPercent({
    required this.percent,
    required this.party,
  });
}

class ResultsPageAllParties extends GetView<ResultsController>
    with ResultsPage {
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.background,
      child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: AppDimens.bigLateralPaddingValue),
          child: _pageContent(context)),
    );
  }

  Column _pageContent(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomSpacer(
          multiplier: 3,
        ),
        AppTexts.title(
            ElectionManager.currentElection.value
                .resultsPageAllCandidatesTitle(context),
            color: AppColors.primary),
        CustomSpacer(),
        AppTexts.small(
            ElectionManager.currentElection.value
                .resultsPageAllCandidatesDescription(context),
            color: AppColors.primary),
        CustomSpacer(
          multiplier: 2,
        ),
        Flexible(child: _partyListContainer()),
        CustomSpacer(multiplier: 4),
      ],
    );
  }

  Widget _partyListContainer() {
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 70),
          child: Container(
              decoration: BoxDecoration(
                color: AppColors.yellow,
                borderRadius:
                    BorderRadius.circular(AppDimens.largeBorderRadius),
              ),
              child: controller.allPartiesWithPercent.length == 0
                  ? _emptyList()
                  : _resultList()),
        ),
      ],
    );
  }

  Widget _emptyList() {
    return Center(
      child: Padding(
          padding: EdgeInsets.all(AppDimens.lateralPaddingValue),
          child: AppTexts.regular(
              ElectionManager.currentElection.value
                  .resultsPage7NoLocalCandidates(
                      Get.context!, controller.countryName),
              color: AppColors.primary)),
    );
  }

  Widget _resultList() {
    return ListView.separated(
      shrinkWrap: true,
      physics: BouncingScrollPhysics(),
      separatorBuilder: (context, index) => CustomDivider(
          paddingValue: AppDimens.mediumLateralPaddingValue,
          color: AppColors.lightYellow),
      itemCount: controller.allPartiesWithPercent.length,
      itemBuilder: (context, i) => ResultsTile(
        viewModel: _partyToViewModel(controller.allPartiesWithPercent[i]),
      ),
    );
  }

  ResultsTileViewModel _partyToViewModel(PoliticalPartyWithPercent party) {
    return ResultsTileViewModel(
        logo: party.party.logo,
        link: party.party.link,
        text: party.party.name,
        subText: party.percent.toString() + "%");
  }
}
