import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:palumba_eu/data/model/election.dart';
import 'package:palumba_eu/global_widgets/custom_button.dart';
import 'package:palumba_eu/global_widgets/custom_selector.dart';
import 'package:palumba_eu/global_widgets/custom_spacer.dart';
import 'package:palumba_eu/modules/welcome/election/election_controller.dart';
import 'package:palumba_eu/utils/common_ui/app_colors.dart';
import 'package:palumba_eu/utils/common_ui/app_dimens.dart';
import 'package:palumba_eu/utils/common_ui/app_texts.dart';
import 'package:palumba_eu/utils/managers/i18n_manager/translations/generated/l10n.dart';

class ElectionPage extends StatelessWidget {
  const ElectionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: GetBuilder<ElectionController>(
        builder: (_) => Scaffold(
            backgroundColor: AppColors.background,
            body: SafeArea(
                child: Padding(
              padding: AppDimens.lateralPadding,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomSpacer(multiplier: 6),
                  AppTexts.title("Choose an Election",
                      color: AppColors.primary),
                  CustomSpacer(small: true),
                  AppTexts.small(S.of(context).languagePageSubtitle,
                      color: AppColors.primary),
                  CustomSpacer(),
                  Expanded(
                      child: ListView.separated(
                    controller: _.scrollController,
                    itemCount: _.elections.length,
                    padding: EdgeInsets.only(
                        top: AppDimens.lateralPaddingValue * 0.8),
                    itemBuilder: (context, index) {
                      return Obx(() => CustomSelector(
                          leading: const SizedBox.shrink(),
                          title: _.elections[index].localized(context),
                          selected: _.indexSelected.value == index,
                          onPressed: () {
                            _.onElectionPressed(index);
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
