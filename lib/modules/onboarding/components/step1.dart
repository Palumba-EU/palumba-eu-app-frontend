import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:palumba_eu/data/model/localization_data.dart';
import 'package:palumba_eu/global_widgets/custom_selector.dart';
import 'package:palumba_eu/global_widgets/custom_spacer.dart';
import 'package:palumba_eu/utils/common_ui/app_colors.dart';
import 'package:palumba_eu/utils/common_ui/app_dimens.dart';
import 'package:palumba_eu/utils/common_ui/app_texts.dart';
import 'package:palumba_eu/utils/managers/i18n_manager/translations/generated/l10n.dart';

class Step1 extends StatelessWidget {
  final List<Country>? countries;
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
          AppTexts.title(S.of(context).onBoardingStep1Title,
              color: AppColors.primary),
          /* GestureDetector(
            onTap: () {
              onCountryPressed(-1);
            },
            child: Padding(
              padding: EdgeInsets.only(
                  top: AppDimens.lateralPaddingValue / 2,
                  bottom: AppDimens.lateralPaddingValue),
              child: AppTexts.small(S.of(context).onBoardingStep1Subtitle,
                  decoration: TextDecoration.underline,
                  color: AppColors.primary),
            ),
          ),*/
          Expanded(
              child: ListView.separated(
            itemCount: countries?.length ?? 0,
            padding: EdgeInsets.only(top: AppDimens.lateralPaddingValue * 0.8),
            itemBuilder: (context, index) {
              return Obx(() => CustomSelector(
                  leading: ClipRRect(
                    borderRadius:
                        const BorderRadius.all(Radius.circular(1000.0)),
                    child: SizedBox(
                      height: 24,
                      width: 24,
                      child: SvgPicture.network(
                        countries![index].flagimage ?? '',
                        clipBehavior: Clip.antiAlias,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  title: countries![index].name ?? '',
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
