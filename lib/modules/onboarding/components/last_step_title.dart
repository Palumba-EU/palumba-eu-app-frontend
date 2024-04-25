import 'package:flutter/material.dart';
import 'package:palumba_eu/utils/common_ui/app_colors.dart';
import 'package:palumba_eu/utils/common_ui/app_dimens.dart';
import 'package:palumba_eu/utils/common_ui/app_texts.dart';
import 'package:palumba_eu/utils/managers/i18n_manager/translations/generated/l10n.dart';

class LastStepTitle extends StatelessWidget {
  const LastStepTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(AppDimens.smallLateralPaddingValue),
        child: AppTexts.title(S.of(context).onBoardingLastStepTitle,
            color: AppColors.primary, textAlign: TextAlign.center));
  }
}
