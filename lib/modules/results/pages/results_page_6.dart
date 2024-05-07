import 'package:flutter/material.dart';
import 'package:palumba_eu/global_widgets/custom_spacer.dart';
import 'package:palumba_eu/modules/results/components/info_widget.dart';
import 'package:palumba_eu/utils/common_ui/app_colors.dart';
import 'package:palumba_eu/utils/common_ui/app_dimens.dart';
import 'package:palumba_eu/utils/common_ui/app_texts.dart';
import 'package:palumba_eu/utils/managers/i18n_manager/translations/generated/l10n.dart';

class ResultsPage6 extends StatefulWidget {
  const ResultsPage6({super.key});

  @override
  State<ResultsPage6> createState() => _ResultsPage6State();
}

class _ResultsPage6State extends State<ResultsPage6> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Spacer(),
        InfoWidget(
          title: S.of(context).resultsPage6_1Title,
          assetFront: 'img_hemicycle',
          assetHeight: 64,
        ),
        CustomSpacer(
          multiplier: 5,
        ),
        InfoWidget(
          title: S.of(context).resultsPage6_2Title,
          assetFront: 'img_reveille',
          assetHeight: 80,
        ),
        CustomSpacer(
          multiplier: 2,
        ),
        Padding(
          padding: AppDimens.lateralPadding,
          child: AppTexts.small(S.of(context).resultsPage6Text,
              textAlign: TextAlign.center, color: AppColors.primary),
        ),
        Spacer(
          flex: 3,
        ),
      ],
    );
  }
}
