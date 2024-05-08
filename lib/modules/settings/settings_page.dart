import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:palumba_eu/global_widgets/custom_button.dart';
import 'package:palumba_eu/global_widgets/custom_horizontal_spacer.dart';
import 'package:palumba_eu/global_widgets/custom_selector.dart';
import 'package:palumba_eu/global_widgets/custom_spacer.dart';
import 'package:palumba_eu/global_widgets/custom_loading.dart';
import 'package:palumba_eu/modules/settings/settings_page_controller.dart';
import 'package:palumba_eu/utils/common_ui/app_colors.dart';

import 'package:palumba_eu/utils/common_ui/app_dimens.dart';
import 'package:palumba_eu/utils/common_ui/app_texts.dart';
import 'package:palumba_eu/utils/managers/i18n_manager/translations/generated/l10n.dart';
import 'package:palumba_eu/utils/string_utils.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SettingsPageController>(
      builder: (_) => Scaffold(
        backgroundColor: AppColors.background,
        body: SafeArea(
            child: SingleChildScrollView(
          padding: const EdgeInsets.all(AppDimens.lateralPaddingValue),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //HEADER
              CustomSpacer(),
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.back();
                    },
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
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      _.launchOrganization();
                    },
                    child: Padding(
                      padding: EdgeInsets.only(
                          top: AppDimens.smallLateralPaddingValue,
                          bottom: AppDimens.smallLateralPaddingValue,
                          right: AppDimens.smallLateralPaddingValue),
                      child: AppTexts.small(
                          S.of(context).settingsPageTitleAssociation,
                          color: AppColors.primary,
                          bold: true,
                          decoration: TextDecoration.underline),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      _.launchEmail();
                    },
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: AppDimens.smallLateralPaddingValue,
                          horizontal: AppDimens.smallLateralPaddingValue),
                      child: AppTexts.small(StringUtils.contactEmail,
                          color: AppColors.primary,
                          bold: true,
                          decoration: TextDecoration.underline),
                    ),
                  ),
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

              _wrapperIcons(_),

              CustomSpacer(multiplier: 8),
            ],
          ),
        )),
        floatingActionButton: Padding(
          padding: const EdgeInsets.symmetric(
              vertical: AppDimens.bigLateralPaddingValue, horizontal: 20),
          child: CustomButton(
            text: S.of(context).settingsPageShareButtonText,
            expanded: true,
            onPressed: _.shareApp,
            prefixIcon:
                IconButtonParameters('ic_share', size: 18, color: Colors.white),
            radius: AppDimens.borderRadius,
            color: AppColors.primary,
            textColor: Colors.white,
            border: ButtonBorderParameters(
                isOutside: true, width: 3, color: AppColors.lightPrimary),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
    );
  }

  Widget _wrapperIcons(SettingsPageController _) {
    return Obx(() {
      if (_.categoriesSponsors.value == null) {
        return Padding(
          padding: const EdgeInsets.only(top: 15),
          child: CustomLoading(),
        );
      }

      return ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: _.categoriesSponsors.value!.length,
          itemBuilder: (context, index) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                AppTexts.small(
                    _.categoriesSponsors.value![index].category
                            .capitalizeFirst ??
                        '',
                    bold: true,
                    color: AppColors.primary),
                CustomSpacer(),
                GridView.builder(
                    itemCount:
                        _.categoriesSponsors.value![index].sponsors.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      mainAxisSpacing: 0,
                      crossAxisSpacing: AppDimens.smallLateralPaddingValue,
                    ),
                    itemBuilder: (context, index2) {
                      var sponsor =
                          _.categoriesSponsors.value![index].sponsors[index2];
                      Widget content;
                      if (sponsor.logo!.endsWith('svg')) {
                        content = SvgPicture.network(
                          sponsor.logo!,
                        );
                      } else {
                        content = Image.network(
                          sponsor.logo!,
                        );
                      }

                      return GestureDetector(
                        onTap: () {
                          _.launchSponsors(sponsor);
                        },
                        child: content,
                      );
                    })
              ],
            );
          });
    });
  }
}
