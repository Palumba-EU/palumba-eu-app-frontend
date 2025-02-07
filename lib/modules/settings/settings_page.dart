import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:palumba_eu/data/model/election.dart';
import 'package:palumba_eu/global_widgets/custom_button.dart';
import 'package:palumba_eu/global_widgets/custom_horizontal_spacer.dart';
import 'package:palumba_eu/global_widgets/custom_selector.dart';
import 'package:palumba_eu/global_widgets/custom_spacer.dart';
import 'package:palumba_eu/global_widgets/custom_loading.dart';
import 'package:palumba_eu/modules/settings/settings_page_controller.dart';
import 'package:palumba_eu/utils/common_ui/app_colors.dart';

import 'package:palumba_eu/utils/common_ui/app_dimens.dart';
import 'package:palumba_eu/utils/common_ui/app_texts.dart';
import 'package:palumba_eu/utils/managers/election_manager.dart';
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
                  // HACK but TextButton would have a margin left
                  GestureDetector(
                      onTap: Get.back,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                        ),
                        padding: EdgeInsets.fromLTRB(0, 10, 20, 10),
                        child: SizedBox(
                          child: SvgPicture.asset(
                            'assets/images/ic_arrow_back.svg',
                          ),
                        ),
                      )),
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
                    child: AppTexts.regular('FAQ',
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
                  color: AppColors.primary),
              CustomSpacer(),
              GetBuilder<SettingsPageController>(
                id: _.rebuildLanguageKey,
                builder: (cnt) => CustomSelector(
                    leading: const SizedBox.shrink(),
                    title: _.selectedLang?.name ?? '',
                    selected: true,
                    onPressed: _.goToSelectLanguage),
              ),
              CustomSpacer(multiplier: 4),

              // ELECTION
              AppTexts.title("Election", color: AppColors.primary),
              CustomSpacer(small: true),
              AppTexts.small(
                  "To change the questionnaire, click on the current one",
                  color: AppColors.primary),
              CustomSpacer(),
              GetBuilder<SettingsPageController>(
                id: _.rebuildElectionKey,
                builder: (cnt) => CustomSelector(
                    leading: const SizedBox.shrink(),
                    title: _.selectedElection.localized(context),
                    selected: true,
                    onPressed: _.goToSelectElection),
              ),
              CustomSpacer(multiplier: 4),

              //ABOUT
              AppTexts.title(S.of(context).settingsPageTitleAbout,
                  color: AppColors.primary),
              CustomSpacer(small: true),
              AppTexts.small(S.of(context).settingsPageTextAbout,
                  color: AppColors.primary),
              Wrap(
                children: [
                  GestureDetector(
                    onTap: _.launchOrganization,
                    child: Padding(
                      padding: EdgeInsets.only(
                          right: AppDimens.smallLateralPaddingValue,
                          top: AppDimens.smallLateralPaddingValue,
                          bottom: AppDimens.smallLateralPaddingValue),
                      child: AppTexts.small(
                          ElectionManager.currentElection.value
                              .settingsPageTitleAssociation(context),
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
                      padding: EdgeInsets.only(
                          right: AppDimens.smallLateralPaddingValue,
                          top: AppDimens.smallLateralPaddingValue,
                          bottom: AppDimens.smallLateralPaddingValue),
                      child: AppTexts.small(StringUtils.contactEmail,
                          color: AppColors.primary,
                          bold: true,
                          decoration: TextDecoration.underline),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        top: AppDimens.smallLateralPaddingValue,
                        bottom: AppDimens.smallLateralPaddingValue),
                    child: AppTexts.small("#${S.of(context).shortAppName}",
                        color: AppColors.primary, bold: true),
                  ),
                ],
              ),
              CustomSpacer(multiplier: 4),

              //PARTNERS
              AppTexts.title(
                  ElectionManager.currentElection.value
                      .settingsPageTitlePartners(context),
                  color: AppColors.primary),
              CustomSpacer(small: true),
              AppTexts.small(
                  ElectionManager.currentElection.value
                      .settingsPageTextPartners(context),
                  color: AppColors.primary),

              _wrapperIcons(_),
              Padding(
                  padding:
                      EdgeInsets.only(top: AppDimens.lateralPaddingValue * 2),
                  child: Container(
                    width: double.infinity,
                    child: Obx(() => AppTexts.small(
                        _.appVersionAndBuildNumber.value,
                        textAlign: TextAlign.center,
                        color: AppColors.primary)),
                  )),
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
                CustomSpacer(),
                AppTexts.small(
                    [
                      // HACK we don't know if this works reliable,
                      // but now at least the translations are shown
                      ElectionManager.currentElection.value
                          .settingsPageSubtitle1(context),
                      ElectionManager.currentElection.value
                          .settingsPageSubtitle2(context),
                      ElectionManager.currentElection.value
                          .settingsPageSubtitle3(context),
                      ElectionManager.currentElection.value
                          .settingsPageSubtitle4(context),
                      ElectionManager.currentElection.value
                          .settingsPageSubtitle5(context)
                    ][index],
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
                      childAspectRatio: 2,
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
