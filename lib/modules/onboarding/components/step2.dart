import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:palumba_eu/global_widgets/custom_spacer.dart';
import 'package:palumba_eu/utils/common_ui/app_colors.dart';

import 'package:palumba_eu/utils/common_ui/app_dimens.dart';
import 'package:palumba_eu/utils/common_ui/app_texts.dart';
import 'package:palumba_eu/utils/managers/i18n_manager/translations/generated/l10n.dart';

import 'custom_age_selector.dart';

class Step2 extends StatelessWidget {
  final int minAge;
  final int maxAge;
  final RxInt indexSelected;
  final Function(int index) onAgePressed;

  const Step2({
    super.key,
    required this.minAge,
    required this.maxAge,
    required this.indexSelected,
    required this.onAgePressed,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: AppDimens.lateralPadding,
            child: AppTexts.title(S.of(context).onBoardingStep2Title,
                color: AppColors.primary),
          ),
          CustomSpacer(
            multiplier: 3,
          ),
          SizedBox(
              height: 48,
              child: ListView.builder(
                itemCount: maxAge - minAge,
                padding: AppDimens.lateralPadding,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Obx(() => CustomAgeSelector(
                        title: (index + minAge).toString(),
                        selected: indexSelected.value == index,
                        onPressed: () {
                          onAgePressed(index);
                        },
                      ));
                },
              )),
          /*SizedBox(
            height: Get.height * 0.325,
          ),*/
        ],
      ),
    );
  }
}
