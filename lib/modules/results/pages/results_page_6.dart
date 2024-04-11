import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:palumba_eu/data/model/results_data.dart';
import 'package:palumba_eu/global_widgets/custom_divider.dart';
import 'package:palumba_eu/global_widgets/custom_network_image.dart';
import 'package:palumba_eu/global_widgets/custom_spacer.dart';
import 'package:palumba_eu/modules/results/models/canadidates_model.dart';
import 'package:palumba_eu/modules/results/results_controller.dart';
import 'package:palumba_eu/utils/common_ui/app_colors.dart';
import 'package:palumba_eu/utils/common_ui/app_dimens.dart';
import 'package:palumba_eu/utils/common_ui/app_texts.dart';
import 'package:palumba_eu/utils/managers/i18n_manager/translations/generated/l10n.dart';

class ResultsPage6 extends GetView<ResultsController> {
  const ResultsPage6({super.key});

  @override
  Widget build(BuildContext context) {
    final smallScreen = Get.height < 750;
    return Padding(
        padding:
            EdgeInsets.symmetric(horizontal: AppDimens.bigLateralPaddingValue),
        child: smallScreen
            ? SingleChildScrollView(
                child: _pageContent(context, smallScreen),
              )
            : _pageContent(context, smallScreen));
  }

  Column _pageContent(BuildContext context, bool smallScreen) {
    return Column(
      children: [
        AppTexts.title(S.of(context).resultsPage6Title),
        CustomSpacer(
          multiplier: 5,
        ),
        smallScreen
            ? _candidatesContainer()
            : Expanded(child: _candidatesContainer()),
        CustomSpacer(
          multiplier: 2,
        ),
        AppTexts.regular(S.of(context).resultsPage6Disclaimer),
        CustomSpacer(
          multiplier: 11,
        ),
      ],
    );
  }

  Container _candidatesContainer() {
    return Container(
      height: 250,
      margin: AppDimens.lateralPadding,
      decoration: BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.circular(AppDimens.largeBorderRadius),
        boxShadow: [
          BoxShadow(
            color: AppColors.boxShadowColor.withOpacity(.5),
            spreadRadius: 0,
            blurRadius: 32,
            offset: Offset(0, 0), // changes position of shadow
          ),
        ],
      ),
      child: ListView.separated(
        shrinkWrap: true,
        physics: BouncingScrollPhysics(),
        separatorBuilder: (context, index) => CustomDivider(
          paddingValue: AppDimens.bigLateralPaddingValue,
        ),
        itemCount:
            controller.maxPercentagePoliticParty?.party.localParties?.length ??
                0,
        itemBuilder: (context, i) => _CandidatesTile(
          candidate:
              controller.maxPercentagePoliticParty?.party.localParties![i] ??
                  LocalParties(),
        ),
      ),
    );
  }
}

class _CandidatesTile extends StatelessWidget {
  const _CandidatesTile({
    required this.candidate,
  });
  final LocalParties candidate;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      minVerticalPadding: AppDimens.bigLateralPaddingValue,
      leading: CustomNetworkImage(
        imageUrl: candidate.logo ?? '',
        height: AppDimens.avatarImageSize,
        isAvatar: true,
      ),
      minLeadingWidth: AppDimens.avatarImageSize * 1.2,
      contentPadding: EdgeInsets.symmetric(
        horizontal: AppDimens.bigLateralPaddingValue,
      ),
      title: AppTexts.small(candidate.acronym ?? '', color: AppColors.primary),
      subtitle: AppTexts.regular(candidate.name ?? '',
          bold: true, color: AppColors.primary),
    );
  }
}
