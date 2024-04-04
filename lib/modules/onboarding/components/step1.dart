import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:palumba_eu/global_widgets/custom_selector.dart';
import 'package:palumba_eu/global_widgets/custom_spacer.dart';
import 'package:palumba_eu/modules/welcome/language/models/language_data.dart';
import 'package:palumba_eu/utils/common_ui/app_dimens.dart';
import 'package:palumba_eu/utils/common_ui/app_texts.dart';
import 'package:palumba_eu/utils/managers/i18n_manager/translations/generated/l10n.dart';

class Step1 extends StatelessWidget {
  final List<LanguageData> countries;
  final RxInt indexSelected;
  final Function(int index) onCountryPressed;

  const Step1({
    super.key,
    required this.countries,
    required this.indexSelected,
    required this.onCountryPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppDimens.lateralPadding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          CustomSpacer(multiplier: 7),
          AppTexts.title(
            S.of(context).onBoardingStep1Title,
          ),
          GestureDetector(
            onTap: () {
              onCountryPressed(-1);
            },
            child: Padding(
              padding: EdgeInsets.only(
                  top: AppDimens.lateralPaddingValue / 2,
                  bottom: AppDimens.lateralPaddingValue),
              child: AppTexts.small(S.of(context).onBoardingStep1Subtitle,
                  decoration: TextDecoration.underline),
            ),
          ),
          Expanded(
              child: ListView.separated(
            itemCount: countries.length,
            padding: EdgeInsets.only(top: AppDimens.lateralPaddingValue * 0.8),
            itemBuilder: (context, index) {
              return Obx(() => CustomSelector(
                  leading: SvgPicture.asset(countries[index].asset),
                  title: countries[index].text,
                  selected: indexSelected.value == index,
                  onPressed: () {
                    onCountryPressed(index);
                  }));
            },
            separatorBuilder: (context, index) {
              return CustomSpacer(
                small: true,
              );
            },
          )),
        ],
      ),
    );
  }
}
