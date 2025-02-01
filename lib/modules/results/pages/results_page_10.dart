import 'package:app_settings/app_settings.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:palumba_eu/data/model/election.dart';
import 'package:palumba_eu/global_widgets/custom_button.dart';
import 'package:palumba_eu/global_widgets/custom_horizontal_spacer.dart';
import 'package:palumba_eu/global_widgets/custom_spacer.dart';
import 'package:palumba_eu/modules/home/home_page_controller.dart';
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

  ResultsPage10({
    required this.willVote,
  });

  @override
  final bool showShare = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        CustomSpacer(multiplier: 6),
        Obx(() => SvgPicture.asset(
            ElectionManager.currentElection.value.voteResult10)),
        CustomSpacer(multiplier: 3),
        content(context)
      ],
    );
  }

  Widget content(BuildContext context) {
    return Obx(() {
      if (willVote.value == true) {
        /// Notification?
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
                  onPressed: () {
                    Get.offAllNamed(HomePageController.route);
                  },
                  child: AppTexts.regular(S.of(context).resultsPage10NopButton,
                      bold: true, color: AppColors.primary),
                ),
                CustomHorizontalSpacer(),
                CustomButton(
                  onPressed: registerForPush,
                  text: S.of(context).resultsPage10YesButton,
                  //Default parameters
                  border: ButtonBorderParameters(),
                ),
              ],
            )
          ],
        );
      } else {
        /// Going to vote?
        return Column(
          children: [
            Padding(
                padding: AppDimens.lateralPadding,
                child: AppTexts.title('Are you going to vote?',
                    color: AppColors.primary, textAlign: TextAlign.center)),
            CustomSpacer(multiplier: 2),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () {
                    Get.offAllNamed(HomePageController.route);
                  },
                  child: AppTexts.regular(S.of(context).no,
                      bold: true, color: AppColors.primary),
                ),
                TextButton(
                  onPressed: () {
                    willVote.value = true;
                  },
                  child: AppTexts.regular("Maybe",
                      bold: true, color: AppColors.primary),
                ),
                CustomHorizontalSpacer(),
                CustomButton(
                  onPressed: () {
                    willVote.value = true;
                  },
                  text: S.of(context).resultsPage10YesButton,
                  //Default parameters
                  border: ButtonBorderParameters(),
                ),
              ],
            )
          ],
        );
      }
    });
  }

  void registerForPush() async {
    var status = await PushNotificationService().register();
    if (status == AuthorizationStatus.denied)
      _showPushDeactivatedDialog();
    else
      controller.nextPage();
  }

  void _showPushDeactivatedDialog() {
    Get.defaultDialog(
      title: 'Notifications disabled',
      middleText:
          'To be able to receive Push Notifcation enable them in the settings',
      onConfirm: () {
        AppSettings.openAppSettings();
        Get.close(1);
        controller.nextPage();
      },
      onCancel: () {
        print('Canceled!');
      },
      textConfirm: 'Open Settings',
      textCancel: 'Close',
    );
  }
}
