import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:palumba_eu/global_widgets/custom_button.dart';
import 'package:palumba_eu/global_widgets/custom_selector.dart';

import 'package:palumba_eu/global_widgets/custom_spacer.dart';
import 'package:palumba_eu/modules/welcome/language/language_controller.dart';
import 'package:palumba_eu/utils/common_ui/app_colors.dart';
import 'package:palumba_eu/utils/common_ui/app_dimens.dart';
import 'package:palumba_eu/utils/common_ui/app_texts.dart';
import 'package:palumba_eu/utils/managers/i18n_manager/translations/generated/l10n.dart';

class LanguagePage extends StatelessWidget {
  const LanguagePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: GetBuilder<LanguageController>(
        builder: (_) => Scaffold(
            backgroundColor: AppColors.background,
            body: SafeArea(
                child: Padding(
              padding: AppDimens.lateralPadding,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomSpacer(multiplier: 6),
                  AppTexts.title(S.of(context).languagePageTitle,
                      color: AppColors.primary),
                  CustomSpacer(small: true),
                  AppTexts.small(S.of(context).languagePageSubtitle,
                      color: AppColors.primary),
                  CustomSpacer(),
                  Expanded(
                      child: ListView.separated(
                    controller: _.scrollController,
                    itemCount: _.languages?.length ?? 0,
                    padding: EdgeInsets.only(
                        top: AppDimens.lateralPaddingValue * 0.8),
                    itemBuilder: (context, index) {
                      return Obx(() => CustomSelector(
                          leading: const SizedBox.shrink(),
                          title: _.languages![index].name ?? '',
                          selected: _.indexSelected.value == index,
                          onPressed: () {
                            _.onLanguagePressed(index);
                          }));
                    },
                    separatorBuilder: (context, index) {
                      return CustomSpacer(
                        small: true,
                      );
                    },
                  )),
                  CustomSpacer(),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: CustomButton(
                      onPressed: () {
                        _.onContinueTap();
                      },
                      color: AppColors.yellow,
                      text: S.of(context).textContinue,
                    ),
                  ),
                  CustomSpacer(multiplier: 3),
                ],
              ),
            ))),
      ),
    );
  }
}
