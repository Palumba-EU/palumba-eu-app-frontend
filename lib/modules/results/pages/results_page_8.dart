import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:palumba_eu/global_widgets/custom_html_widget.dart';
import 'package:palumba_eu/global_widgets/custom_spacer.dart';
import 'package:palumba_eu/modules/results/results_controller.dart';
import 'package:palumba_eu/utils/common_ui/app_colors.dart';
import 'package:palumba_eu/utils/common_ui/app_dimens.dart';
import 'package:palumba_eu/utils/common_ui/app_texts.dart';
import 'package:palumba_eu/utils/managers/i18n_manager/translations/generated/l10n.dart';
import 'package:palumba_eu/utils/utils.dart';

class ResultsPage8 extends GetView<ResultsController> {
  const ResultsPage8({super.key});

  @override
  Widget build(BuildContext context) {
    final maxTopic = controller.maxTopicPercentage();
    return Container(
      color: AppColors.background,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Spacer(),
            Stack(
              alignment: Alignment.center,
              children: [
                SvgPicture.asset(
                  'assets/images/img_banner_top.svg',
                  fit: BoxFit.fitWidth,
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 60),
                  child: AppTexts.title(
                      maxTopic.isExtreme1
                          ? maxTopic.topicData.extreme1Emojis!
                          : maxTopic.topicData.extreme2Emojis!,
                      color: AppColors.primary,
                      fontSize: 32.5),
                ),
              ],
            ),
            //Spacer(),
            Padding(
              padding: AppDimens.lateralPadding,
              child: AppTexts.title(
                S.of(context).resultsPage8_1Text(
                    maxTopic.topicData.name ?? '', maxTopic.percentage),
                color: AppColors.primary,
                fontFamily: GoogleFonts.caprasimo().fontFamily,
                fontWeight: FontWeight.w400,
                textAlign: TextAlign.center,
              ),
            ),
            CustomSpacer(),
            AppTexts.title(
                maxTopic.isExtreme1
                    ? maxTopic.topicData.extreme1 ?? ''
                    : maxTopic.topicData.extreme2 ?? '',
                fontFamily: GoogleFonts.caprasimo().fontFamily,
                fontWeight: FontWeight.w400,
                color: Utils.getApiColor(maxTopic.topicData.color ?? '')),
            CustomSpacer(),

            Padding(
              padding: AppDimens.lateralPadding,
              child: CustomHtmlWidget(
                content: maxTopic.topicData.extreme2Details ?? '',
                textStyle: TextStyle(
                  fontSize: AppDimens.fontSizeSmall,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            CustomSpacer(
              multiplier: 10,
            )
          ],
        ),
      ),
    );
  }
}
