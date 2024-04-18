import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:palumba_eu/global_widgets/custom_spacer.dart';
import 'package:palumba_eu/global_widgets/emoji_label_container.dart';
import 'package:palumba_eu/utils/common_ui/app_colors.dart';
import 'package:palumba_eu/utils/common_ui/app_dimens.dart';
import 'package:palumba_eu/utils/common_ui/app_texts.dart';
import 'package:palumba_eu/utils/managers/i18n_manager/translations/generated/l10n.dart';

class ResultsPage1 extends StatelessWidget {
  const ResultsPage1({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: AppDimens.lateralPadding,
        child: SizedBox(
          height: Get.height * .78,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Center(
                  child: Image.asset(
                    'assets/images/pigeon.png',
                  ),
                ),
              ),
              EmojiLabelContainer(
                emoji: S.of(context).resultsLabelEmoji,
                backgroundColor: AppColors.yellow,
              ),
              CustomSpacer(),
              AppTexts.title(S.of(context).resultsPage1Title,
                  color: AppColors.primary),
              CustomSpacer(),
              AppTexts.regular(S.of(context).resultsPage1Text,
                  color: AppColors.primary),
            ],
          ),
        ),
      ),
    );
  }
}
