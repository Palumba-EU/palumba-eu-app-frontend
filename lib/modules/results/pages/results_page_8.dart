import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:palumba_eu/data/manager/data_manager.dart';
import 'package:palumba_eu/global_widgets/custom_spacer.dart';
import 'package:palumba_eu/modules/results/results_controller.dart';
import 'package:palumba_eu/utils/common_ui/app_colors.dart';
import 'package:palumba_eu/utils/common_ui/app_dimens.dart';
import 'package:palumba_eu/utils/common_ui/app_texts.dart';
import 'package:palumba_eu/utils/managers/i18n_manager/translations/generated/l10n.dart';

class ResultsPage8 extends GetView<ResultsController> {
  const ResultsPage8({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Spacer(),
        Stack(
          alignment: Alignment.center,
          children: [
            SvgPicture.asset(
              'assets/images/img_banner_top.svg',
              fit: BoxFit.fitWidth,
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 60),
              child: AppTexts.title('Top 10%',
                  color: AppColors.primary, fontSize: 32.5),
            ),
          ],
        ),
        Spacer(),
        Padding(
          padding: AppDimens.lateralPadding,
          child: AppTexts.title(S.of(context).resultsPage8_1Text(87),
              color: AppColors.primary, textAlign: TextAlign.center),
        ),
        CustomSpacer(),
        AppTexts.title('😱 😏'),
        Spacer(
          flex: 10,
        ),
      ],
    );
  }
}
