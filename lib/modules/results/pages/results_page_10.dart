import 'package:app_settings/app_settings.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:palumba_eu/data/model/election.dart';
import 'package:palumba_eu/global_widgets/custom_button.dart';
import 'package:palumba_eu/global_widgets/custom_horizontal_spacer.dart';
import 'package:palumba_eu/global_widgets/custom_spacer.dart';
import 'package:palumba_eu/modules/results/pages/results_page.dart';
import 'package:palumba_eu/modules/results/results_controller.dart';
import 'package:palumba_eu/utils/common_ui/app_colors.dart';
import 'package:palumba_eu/utils/common_ui/app_dimens.dart';
import 'package:palumba_eu/utils/common_ui/app_texts.dart';
import 'package:palumba_eu/utils/managers/election_manager.dart';
import 'package:palumba_eu/utils/managers/i18n_manager/translations/generated/l10n.dart';
import 'package:palumba_eu/utils/managers/push_notification_service.dart';

class ResultsPage10 extends GetView<ResultsController> with ResultsPage {
  final RxnBool willVote;

  @override
  final bool showShare = false;

  @override
  final bool showBallotBoxBackground = true;

  ResultsPage10({
    required this.willVote,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        CustomSpacer(multiplier: 6),
        Align(
            alignment: Alignment.center, // Center horizontally
            child: Container(
              width: Get.width * 0.5,
              child: Center(
                  child: Obx(
                () => AppTexts.regular(
                    S.of(context).resultsPage10VotingDay(DateFormat("MMM, d y")
                        .format(ElectionManager.electionDate!)),
                    color: willVote.value == true
                        ? AppColors.primary
                        : Colors.transparent,
                    bold: true,
                    textAlign: TextAlign.center),
              )),
            )),
        CustomSpacer(multiplier: 3),
        content(context)
      ],
    );
  }

  Widget content(BuildContext context) {
    return Obx(() {
      if (willVote.value == true) {
        return _wantANotifcation(context);
      } else {
        return _goingToVote(context);
      }
    });
  }

  Widget _wantANotifcation(BuildContext context) {
    return Column(
      children: [
        Padding(
            padding: AppDimens.lateralPadding,
            child: AppTexts.title(
                ElectionManager.currentElection.value
                    .resultsPage10Title(context),
                color: AppColors.primary,
                textAlign: TextAlign.center)),
        CustomSpacer(multiplier: 2),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: controller.nextPage,
              child: AppTexts.regular(
                  ElectionManager.currentElection.value
                      .resultsPage10NopButton(context),
                  bold: true,
                  color: AppColors.primary),
            ),
            CustomHorizontalSpacer(),
            CustomButton(
              onPressed: () => registerForPush(context),
              text: ElectionManager.currentElection.value
                  .resultsPage10YesButton(context),
              //Default parameters
              border: ButtonBorderParameters(),
            ),
          ],
        )
      ],
    );
  }

  Widget _goingToVote(BuildContext context) {
    return Column(
      children: [
        Padding(
            padding: AppDimens.lateralPadding,
            child: AppTexts.title(S.of(context).resultsPage10VotingQuestion,
                color: AppColors.primary, textAlign: TextAlign.center)),
        CustomSpacer(multiplier: 2),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: controller.nextPage,
              child: AppTexts.regular(S.of(context).no,
                  bold: true, color: AppColors.primary),
            ),
            TextButton(
              onPressed: () {
                willVote.value = true;
              },
              child: AppTexts.regular(S.of(context).maybe,
                  bold: true, color: AppColors.primary),
            ),
            CustomHorizontalSpacer(),
            CustomButton(
              onPressed: () {
                willVote.value = true;
              },
              text: ElectionManager.currentElection.value
                  .resultsPage10YesButton(context),
              //Default parameters
              border: ButtonBorderParameters(),
            ),
          ],
        )
      ],
    );
  }

  void registerForPush(BuildContext context) async {
    var status = await PushNotificationService().register();
    if (status == AuthorizationStatus.denied)
      await _showPushDeactivatedDialog(context);
    else
      controller.nextPage();
  }

  Future<T?> _showPushDeactivatedDialog<T>(BuildContext context) {
    return Get.defaultDialog(
      title: S.of(context).pushDeactivatedTitle,
      middleText: S.of(context).pushDeactivatedText,
      onConfirm: () {
        AppSettings.openAppSettings();
        Get.close(1);
        controller.nextPage();
      },
      onCancel: () {
        print('Canceled!');
      },
      textConfirm: S.of(context).pushDeactivatedConfirm,
      textCancel: S.of(context).pushDeactivatedCancel,
    );
  }
}
