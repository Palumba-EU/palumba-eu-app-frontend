import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
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

class ResultsPage7 extends GetView<ResultsController> with ResultsPage {
  @override
  Widget build(BuildContext context) {
    final smallScreen = Get.height < 750;
    return Container(
      color: AppColors.background,
      child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: AppDimens.bigLateralPaddingValue),
          child: smallScreen
              ? SingleChildScrollView(
                  child: _pageContent(context),
                )
              : _pageContent(context)),
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
            ElectionManager.currentElection.value.resultsPage7Title(
                context,
                controller.countryName,
                controller.maxPercentagePoliticParty?.party.name ?? ''),
            color: AppColors.primary),
        CustomSpacer(),
        AppTexts.small(
            ElectionManager.currentElection.value
                .resultsPage7Disclaimer(context),
            color: AppColors.primary),
        CustomSpacer(
          multiplier: 2,
        ),
        Flexible(child: _candidatesContainer()),
        CustomSpacer(multiplier: 4),
      ],
    );
  }

  Widget _candidatesContainer() {
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
              child: (controller.localParties?.length ?? 0) == 0
                  ? _emptyList()
                  : _partyList()),
        ),
        SvgPicture.asset('assets/images/img_ballot_box.svg', height: 96)
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

  Widget _partyList() {
    return ListView.separated(
      shrinkWrap: true,
      physics: BouncingScrollPhysics(),
      separatorBuilder: (context, index) => CustomDivider(
          paddingValue: AppDimens.mediumLateralPaddingValue,
          color: AppColors.lightYellow),
      itemCount: controller.localParties?.length ?? 0,
      itemBuilder: (context, i) => ResultsTile(
        viewModel: _partyToViewModel(controller.localParties?[i]),
      ),
    );
  }

  ResultsTileViewModel _partyToViewModel(LocalParties? party) {
    return ResultsTileViewModel(
        logo: party?.logo ?? "",
        link: party?.link ?? "",
        text: party?.name ?? "",
        subText: party?.acronym ?? "");
  }
}
