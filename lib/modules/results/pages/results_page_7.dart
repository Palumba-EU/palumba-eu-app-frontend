import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:palumba_eu/data/model/results_data.dart';
import 'package:palumba_eu/global_widgets/custom_divider.dart';
import 'package:palumba_eu/global_widgets/custom_horizontal_spacer.dart';
import 'package:palumba_eu/global_widgets/custom_spacer.dart';
import 'package:palumba_eu/modules/results/results_controller.dart';
import 'package:palumba_eu/utils/common_ui/app_colors.dart';
import 'package:palumba_eu/utils/common_ui/app_dimens.dart';
import 'package:palumba_eu/utils/common_ui/app_texts.dart';
import 'package:palumba_eu/utils/managers/i18n_manager/translations/generated/l10n.dart';
import 'package:screenshot/screenshot.dart';

class ResultsPage7 extends GetView<ResultsController> {
  const ResultsPage7({super.key});

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
                  child: _pageContent(context, smallScreen),
                )
              : _pageContent(context, smallScreen)),
    );
  }

  Column _pageContent(BuildContext context, bool smallScreen) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomSpacer(
          multiplier: 3,
        ),
        AppTexts.title(
            S.of(context).resultsPage7Title(controller.countryName,
                controller.maxPercentagePoliticParty?.party.name ?? ''),
            color: AppColors.primary),
        CustomSpacer(),
        AppTexts.small(S.of(context).resultsPage7Disclaimer,
            color: AppColors.primary),
        CustomSpacer(
          multiplier: 2,
        ),
        smallScreen
            ? _candidatesContainer()
            : Expanded(child: _candidatesContainer()),
        CustomSpacer(multiplier: 11),
      ],
    );
  }

  Container _candidatesContainer() {
    return Container(
      height: 250,
      decoration: BoxDecoration(
        color: AppColors.yellow,
        borderRadius: BorderRadius.circular(AppDimens.largeBorderRadius),
      ),
      child: (controller.localParties?.length ?? 0) == 0
          ? Center(
              child: Padding(
                  padding: EdgeInsets.all(AppDimens.lateralPaddingValue),
                  child: AppTexts.regular(
                      S.of(Get.context!).resultsPage7NoLocalCandidates(
                          controller.countryName),
                      color: AppColors.primary)),
            )
          : ListView.separated(
              shrinkWrap: true,
              physics: BouncingScrollPhysics(),
              separatorBuilder: (context, index) => CustomDivider(
                  paddingValue: AppDimens.mediumLateralPaddingValue,
                  color: AppColors.lightYellow),
              itemCount: controller.localParties?.length ?? 0,
              itemBuilder: (context, i) => _CandidatesTile(
                candidate: controller.localParties?[i] ?? LocalParties(),
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
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: AppDimens.lateralPaddingValue, vertical: 15),
      child: Row(children: [
        Container(
            height: AppDimens.avatarImageSize,
            width: AppDimens.avatarImageSize,
            decoration: BoxDecoration(
                image:
                    DecorationImage(image: NetworkImage(candidate.logo ?? '')),
                border: Border.all(color: AppColors.lightYellow, width: 2),
                shape: BoxShape.circle)),
        CustomHorizontalSpacer(),
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            candidate.acronym != null && candidate.acronym!.isNotEmpty
                ? Padding(
                    padding: const EdgeInsets.only(bottom: 5),
                    child: Text(
                      candidate.acronym!,
                      style: AppTexts.customTextStyle(AppTextType.regular,
                          color: AppColors.primary,
                          fontSize: AppDimens.fontSizeExtraSmall),
                    ),
                  )
                : const SizedBox.shrink(),
            AppTexts.medium(candidate.name ?? '',
                black: true, color: AppColors.primary)
          ],
        ))
      ]),
    );
  }
}
