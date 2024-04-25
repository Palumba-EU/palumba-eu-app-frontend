import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:palumba_eu/global_widgets/custom_button.dart';
import 'package:palumba_eu/global_widgets/custom_horizontal_spacer.dart';
import 'package:palumba_eu/global_widgets/custom_selector.dart';
import 'package:palumba_eu/global_widgets/custom_spacer.dart';
import 'package:palumba_eu/modules/settings/settings_page_controller.dart';
import 'package:palumba_eu/utils/common_ui/app_colors.dart';

import 'package:palumba_eu/utils/common_ui/app_dimens.dart';
import 'package:palumba_eu/utils/common_ui/app_texts.dart';
import 'package:palumba_eu/utils/managers/i18n_manager/translations/generated/l10n.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SettingsPageController>(
      builder: (_) => Scaffold(
        backgroundColor: AppColors.background,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(AppDimens.lateralPaddingValue),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //HEADER
                  CustomSpacer(),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: Get.back,
                        child: SizedBox(
                          child: SvgPicture.asset(
                            'assets/images/ic_arrow_back.svg',
                          ),
                        ),
                      ),
                      Spacer(),
                      TextButton(
                        onPressed: _.launchPrivacyPoliciesUrl,
                        child: AppTexts.small(
                            S.of(context).settingsPagePrivacyPolicy,
                            color: AppColors.primary,
                            bold: true),
                      ),
                      CustomHorizontalSpacer(),
                      TextButton(
                        onPressed: _.launchFaqUrl,
                        child: AppTexts.regular(S.of(context).faq,
                            color: AppColors.primary, bold: true),
                      )
                    ],
                  ),
                  CustomSpacer(multiplier: 3),

                  //LANGUAGE
                  AppTexts.title(S.of(context).settingsPageTitleLanguage,
                      color: AppColors.primary),
                  CustomSpacer(small: true),
                  AppTexts.small(S.of(context).settingsPageTextLanguage,
                      color: AppColors.primary, bold: true),
                  CustomSpacer(),
                  GetBuilder<SettingsPageController>(
                    id: _.rebuildLanguageKey,
                    builder: (cnt) => CustomSelector(
                        leading: const SizedBox.shrink(),
                        title: _.selectedLang?.name ?? '',
                        selected: true,
                        onPressed: _.goToSelectLanguage),
                  ),
                  CustomSpacer(),
                  AppTexts.small(S.of(context).settingsPageTextLanguage,
                      color: AppColors.primary),
                  CustomSpacer(multiplier: 4),

                  //ABOUT
                  AppTexts.title(S.of(context).settingsPageTitleAbout,
                      color: AppColors.primary),
                  CustomSpacer(small: true),
                  AppTexts.small(S.of(context).settingsPageTextAbout,
                      color: AppColors.primary),
                  CustomSpacer(small: true),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      AppTexts.small(S.of(context).settingsPageTitleAssociation,
                          color: AppColors.primary,
                          bold: true,
                          decoration: TextDecoration.underline),
                      CustomHorizontalSpacer(multiplier: 2),
                      AppTexts.small("hello@palumba.eu",
                          color: AppColors.primary,
                          bold: true,
                          decoration: TextDecoration.underline),
                      CustomHorizontalSpacer(multiplier: 2),
                      AppTexts.small("#${S.of(context).shortAppName}",
                          color: AppColors.primary, bold: true),
                    ],
                  ),
                  CustomSpacer(multiplier: 4),

                  //PARTNERS
                  AppTexts.title(S.of(context).settingsPageTitlePartners,
                      color: AppColors.primary),
                  CustomSpacer(small: true),
                  AppTexts.small(S.of(context).settingsPageTextPartners,
                      color: AppColors.primary),
                  CustomSpacer(),

                  //Main sponsors
                  AppTexts.small(S.of(context).settingsPageSubtitle1,
                      color: AppColors.primary, bold: true),
                  _wrapperIcons(),

                  //European partners
                  AppTexts.small(S.of(context).settingsPageSubtitle2,
                      color: AppColors.primary, bold: true),
                  _wrapperIcons(),

                  //Academic partners
                  AppTexts.small(S.of(context).settingsPageSubtitle3,
                      color: AppColors.primary, bold: true),
                  _wrapperIcons(),

                  //National Institutional Partners
                  AppTexts.small(S.of(context).settingsPageSubtitle4,
                      color: AppColors.primary, bold: true),
                  _wrapperIcons(),

                  //Service providers
                  AppTexts.small(S.of(context).settingsPageSubtitle5,
                      color: AppColors.primary, bold: true),
                  _wrapperIcons(),

                  CustomSpacer(multiplier: 8),
                ],
              ),
            ),
          ),
        ),
        floatingActionButton: Padding(
          padding: const EdgeInsets.symmetric(
              vertical: AppDimens.bigLateralPaddingValue, horizontal: 20),
          child: CustomButton(
            text: S.of(context).settingsPageShareButtonText,
            expanded: true,
            onPressed: () {},
            prefixIcon: IconButtonParameters('ic_share',
                size: 18, color: AppColors.text),
            radius: AppDimens.borderRadius,
            color: AppColors.primary,
            textColor: AppColors.text,
            bold: true,
            border: ButtonBorderParameters(
                isOutside: true, width: 4, color: AppColors.lightPrimary),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
    );
  }

  Widget _wrapperIcons({List<Widget>? children}) {
    return Padding(
      padding:
          const EdgeInsets.symmetric(vertical: AppDimens.smallPaddingValue),
      child: Wrap(
        alignment: WrapAlignment.start,
        spacing: AppDimens.lateralPaddingValue,
        runSpacing: AppDimens.smallPaddingValue,
        children: [
          //TODO: send children
          for (int i = 0; i < 4; i++)
            SvgPicture.asset('assets/images/ic_oxfam.svg'),
        ],
      ),
    );
  }
}
