import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
      padding: AppDimens.lateralPadding,
      child: SafeArea(
        child: SizedBox(
          height: Get.height * .78,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomSpacer(multiplier: 2,),
              Expanded(
                child: Center(
                  child: SvgPicture.asset(
                    'assets/images/img_pigeon.svg',
                  ),
                ),
              ),
              CustomSpacer(multiplier: 2,),
              AppTexts.title(S.of(context).resultsPage1Title,
                  color: AppColors.primary),
              CustomSpacer(),
              AppTexts.small(S.of(context).resultsPage1Text,
                  color: AppColors.primary),
            ],
          ),
        ),
      ),
    );
  }
}
