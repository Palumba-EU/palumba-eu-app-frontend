import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:palumba_eu/global_widgets/custom_network_image.dart';
import 'package:palumba_eu/global_widgets/custom_spacer.dart';
import 'package:palumba_eu/global_widgets/emoji_label_container.dart';
import 'package:palumba_eu/utils/common_ui/app_dimens.dart';
import 'package:palumba_eu/utils/common_ui/app_texts.dart';
import 'package:palumba_eu/utils/managers/i18n_manager/translations/generated/l10n.dart';

class ResultsPage1 extends StatelessWidget {
  const ResultsPage1({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: AppDimens.lateralPadding,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomNetworkImage(
                  height: Get.width * .7,
                  width: Get.width,
                  imageUrl: 'https://picsum.photos/seed/picsum/600/300',
                  placeholder: 'assets/images/image_placeholder.svg',
                ),
                CustomSpacer(
                  multiplier: 2,
                ),
                EmojiLabelContainer(
                  emoji: S.of(context).resultsLabelEmoji,
                ),
                CustomSpacer(),
                AppTexts.title(S.of(context).resultsPage1Title),
                CustomSpacer(),
                AppTexts.regular(S.of(context).resultsPage1Text),
              ],
            ),
          ),
          CustomSpacer(
            multiplier: 2,
          ),
          CustomNetworkImage(
            height: Get.width * .4,
            width: Get.width,
            imageUrl: 'https://picsum.photos/seed/picsum/800/300',
            placeholder: 'assets/images/image_placeholder.svg',
          ),
          CustomSpacer(
            multiplier: 2,
          ),
        ],
      ),
    );
  }
}