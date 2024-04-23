import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:palumba_eu/data/model/results_data.dart';
import 'package:palumba_eu/global_widgets/custom_divider.dart';
import 'package:palumba_eu/global_widgets/custom_network_image.dart';
import 'package:palumba_eu/global_widgets/custom_spacer.dart';
import 'package:palumba_eu/modules/results/results_controller.dart';
import 'package:palumba_eu/utils/common_ui/app_colors.dart';
import 'package:palumba_eu/utils/common_ui/app_dimens.dart';
import 'package:palumba_eu/utils/common_ui/app_texts.dart';
import 'package:palumba_eu/utils/managers/i18n_manager/translations/generated/l10n.dart';

class ResultsPage7 extends GetView<ResultsController> {
  const ResultsPage7({super.key});

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
        AppTexts.title(S.of(context).resultsPage7Title,
            color: AppColors.primary),
        CustomSpacer(multiplier: 2),
        AppTexts.small(S.of(context).resultsPage7Disclaimer,
            color: AppColors.primary),
        CustomSpacer(),
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
      margin: AppDimens.lateralPadding,
      decoration: BoxDecoration(
        color: AppColors.yellow,
        borderRadius: BorderRadius.circular(AppDimens.largeBorderRadius),
      ),
      child: (controller.localParties?.length ?? 0) == 0
          ? Center(
              child: Padding(
                  padding: EdgeInsets.all(AppDimens.lateralPaddingValue),
                  child: AppTexts.regular(
                      //TODO: change quote
                      S.of(Get.context!).resultsPage7NoLocalCandidates(
                          controller.countryName),
                      color: AppColors.primary)),
            )
          : ListView.separated(
              shrinkWrap: true,
              physics: BouncingScrollPhysics(),
              separatorBuilder: (context, index) => CustomDivider(
                paddingValue: AppDimens.bigLateralPaddingValue,
              ),
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
