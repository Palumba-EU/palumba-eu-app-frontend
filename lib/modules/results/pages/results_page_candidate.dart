import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:palumba_eu/data/model/results_data.dart';
import 'package:palumba_eu/global_widgets/custom_html_widget.dart';
import 'package:palumba_eu/global_widgets/custom_network_image.dart';
import 'package:palumba_eu/global_widgets/custom_spacer.dart';
import 'package:palumba_eu/modules/results/pages/results_page.dart';
import 'package:palumba_eu/modules/results/pages/results_shared/results_heart_stack.dart';
import 'package:palumba_eu/modules/results/results_controller.dart';
import 'package:palumba_eu/utils/common_ui/app_colors.dart';
import 'package:palumba_eu/utils/common_ui/app_dimens.dart';
import 'package:palumba_eu/utils/common_ui/app_texts.dart';
import 'package:palumba_eu/utils/managers/election_manager.dart';
import 'package:palumba_eu/utils/managers/i18n_manager/translations/generated/l10n.dart';
import 'package:palumba_eu/utils/utils.dart';

class ResultsPageCandidate extends GetView<ResultsController> with ResultsPage {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Stack(children: [
      HeartStack(),
      Padding(
        padding:
            EdgeInsets.symmetric(horizontal: AppDimens.lateralPaddingValue),
        child: Obx(() {
          if (controller.currentLocalCandidateIndex.value != null)
            return _localParty(
                context,
                controller.locaPartiesOfMaxParty[
                    controller.currentLocalCandidateIndex.value!]);
          else
            return _noLocalParty(context);
        }),
      )
    ]));
  }

  Widget _localParty(BuildContext context, LocalParties localparty) {
    return Column(children: [
      Expanded(
          child: Obx(() => AnimatedOpacity(
              opacity: controller.locaCandidateOpacityActive.value ? 1 : 0,
              duration: Duration(milliseconds: 200),
              child: SingleChildScrollView(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                    CustomSpacer(multiplier: 3),
                    Stack(alignment: Alignment.bottomCenter, children: [
                      Padding(
                          padding: const EdgeInsets.only(bottom: 28),
                          child: CustomNetworkImage(
                            width: 150,
                            height: 150,
                            isSvg: localparty.logo.contains(".svg"),
                            imageUrl: localparty.logo,
                            radius: Get.width,
                            color: AppColors.blue,
                          )),
                      Padding(
                          padding: const EdgeInsets.only(bottom: 0),
                          child: SvgPicture.asset(
                            'assets/images/img_heart_arrow.svg',
                            height: 50,
                            fit: BoxFit.fitWidth,
                          ))
                    ]),
                    CustomSpacer(multiplier: 1),
                    AppTexts.title(localparty.name, color: AppColors.primary),
                    GestureDetector(
                      onTapDown: (_) => Utils.launch(localparty.link),
                      child: AppTexts.small(
                          localparty.linkText ?? localparty.link,
                          color: AppColors.primary),
                    ),
                    CustomHtmlWidget(
                        textAlign: TextAlign.center,
                        textStyle: AppTexts.customTextStyle(AppTextType.regular,
                            color: AppColors.primary, fontSize: 12.0),
                        content: localparty.description),
                    CustomSpacer(multiplier: 1),
                  ]))))),
      CustomSpacer(multiplier: 1),
      TextButton(
          onPressed: controller.nextCandidate,
          child: AppTexts.medium(S.of(context).resultsPageCandidatesShuffle,
              color: AppColors.primary, bold: true)),
      if (localparty.show_collaboration_link) _inCollabWith(),
      CustomSpacer(multiplier: 1),
    ]);
  }

  Widget _noLocalParty(BuildContext context) {
    return Center(
      child: AppTexts.title(
        S.of(context).resultsPageCandidatesNoParties,
        color: AppColors.primary,
      ),
    );
  }

  Widget _inCollabWith() {
    var link = ElectionManager.localPartyScreen?.link;
    if (link == null) return SizedBox.shrink();
    var text = ElectionManager.localPartyScreen?.text ?? link;
    var logo = ElectionManager.localPartyScreen?.logo;

    return GestureDetector(
        onTapDown: (_) => Utils.launch(link),
        child: Column(children: [
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            AppTexts.small(text, color: AppColors.primary),
            if (logo != null)
              Padding(
                  padding: EdgeInsets.only(left: 4),
                  child: CustomNetworkImage(
                    width: 20,
                    height: 20,
                    isSvg: logo.contains(".svg"),
                    imageUrl: logo,
                    radius: Get.width,
                    color: AppColors.blue,
                  ))
          ]),
          CustomSpacer(multiplier: 1),
        ]));
  }
}
