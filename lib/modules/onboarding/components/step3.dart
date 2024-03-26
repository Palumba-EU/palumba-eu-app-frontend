import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:palumba_eu/data/global_widgets/custom_spacer.dart';
import 'package:palumba_eu/modules/onboarding/components/custom_gender_selector.dart';

import 'package:palumba_eu/utils/common_ui/app_dimens.dart';
import 'package:palumba_eu/utils/common_ui/app_texts.dart';
import 'package:palumba_eu/utils/managers/i18n_manager/translations/generated/l10n.dart';

class Step3 extends StatelessWidget {
  final List<String> genders;
  final RxInt indexSelected;
  final Function(int index) onGenderPressed;

  const Step3({
    super.key,
    required this.genders,
    required this.indexSelected,
    required this.onGenderPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: AppDimens.lateralPadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            AppTexts.title(S.of(context).onBoardingStep3Title),
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
            SizedBox(
              height: Get.height * 0.05,
            ),
          ],
        ),
      ),
    );
  }
}
