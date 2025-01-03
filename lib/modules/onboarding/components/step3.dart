import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:palumba_eu/global_widgets/custom_spacer.dart';
import 'package:palumba_eu/modules/onboarding/components/custom_gender_selector.dart';
import 'package:palumba_eu/utils/common_ui/app_colors.dart';

import 'package:palumba_eu/utils/common_ui/app_dimens.dart';
import 'package:palumba_eu/utils/common_ui/app_texts.dart';
import 'package:palumba_eu/utils/managers/i18n_manager/translations/generated/l10n.dart';

class Step3 extends StatelessWidget {
  final List<String> genders;
  final RxInt indexSelected;
  final Function(int index) onGenderPressed;
  final RxBool acceptDataPrivacy;
  final Function(bool acceptDataPrivacy) onDataPrivacyToggle;

  const Step3({
    super.key,
    required this.genders,
    required this.indexSelected,
    required this.onGenderPressed,
    required this.acceptDataPrivacy,
    required this.onDataPrivacyToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Padding(
        padding: AppDimens.lateralPadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            AppTexts.title(S.of(context).onBoardingStep3Title,
                color: AppColors.primary),
            CustomSpacer(
              multiplier: 3,
            ),
            Wrap(
              spacing: 7.5,
              runSpacing: 7.5,
              children: List.generate(
                  genders.length,
                  (index) => Obx(() => CustomGenderSelector(
                      title: genders[index],
                      selected: indexSelected == index,
                      onPressed: () {
                        onGenderPressed(index);
                      }))),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Obx(() {
                  return Transform.scale(
                      scale: 1.2,
                      child: Checkbox(
                        value: acceptDataPrivacy.value,
                        onChanged: (bool? value) {
                          onDataPrivacyToggle(value ?? false);
                        },
                        checkColor: AppColors.primary,
                        fillColor: WidgetStateProperty.resolveWith<Color>(
                          (Set<WidgetState> states) {
                            return Colors.white;
                          },
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.zero,
                        ),
                        side: WidgetStateBorderSide.resolveWith(
                          (states) =>
                              BorderSide(width: 2.0, color: AppColors.yellow),
                        ),
                      ));
                }),
                Text(
                  'Agree to Terms',
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
