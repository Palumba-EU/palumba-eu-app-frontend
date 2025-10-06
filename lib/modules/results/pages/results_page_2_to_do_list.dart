import 'package:app_settings/app_settings.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:palumba_eu/data/model/election.dart';
import 'package:palumba_eu/global_widgets/custom_spacer.dart';
import 'package:palumba_eu/modules/results/pages/results_page.dart';
import 'package:palumba_eu/modules/results/pages/results_shared/results_heart_stack.dart';
import 'package:palumba_eu/modules/results/results_controller.dart';
import 'package:palumba_eu/utils/common_ui/app_colors.dart';
import 'package:palumba_eu/utils/common_ui/app_dimens.dart';
import 'package:palumba_eu/utils/common_ui/app_texts.dart';
import 'package:palumba_eu/utils/managers/election_manager.dart';
import 'package:palumba_eu/utils/managers/i18n_manager/translations/generated/l10n.dart';

import '../../../utils/managers/push_notification_service.dart';
import '../../../utils/utils.dart';

class ResultsPage2ToDoList extends GetView<ResultsController> with ResultsPage {
  @override
  Widget build(BuildContext context) {
    List<TodoItemModel> todoItems() {
      final translate = S.of(context);
      return [
        TodoItemModel(
          id: 1,
          title: translate.registerToVote,
          subtitle: translate.tapToRegister,
        ),
        TodoItemModel(
          id: 2,
          title: translate.turnOnVotingReminder,
          subtitle: translate.activePushNotificationScreen,
        ),
        TodoItemModel(
          id: 3,
          title: translate.investigateFurther,
          subtitle: translate.doOwnResearch,
        ),
        TodoItemModel(
          id: 4,
          title: translate.checkWhoOnTheBallot,
          subtitle: translate.seePollingStation,
        ),
        TodoItemModel(
          id: 5,
          title: translate.shareTheApp,
          subtitle: translate.shareYourFriendFamily,
        ),
      ];
    }

    return Container(
      color: ElectionManager.currentElection.value.background,
      child: Stack(children: [
        HeartStack(),
        SingleChildScrollView(
          child: Column(
            children: [
              CustomSpacer(multiplier: 3),
              controller.maxPercentagePoliticParty == null
                  ? AppTexts.title(S.of(context).resultsPage2NoResults,
                      color: AppColors.primary)
                  : Column(
                      children: [
                        Padding(
                          padding: EdgeInsetsGeometry.symmetric(
                              horizontal: AppDimens.bigLateralPaddingValue),
                          child: RichText(
                            text: TextSpan(
                              style: TextStyle(
                                fontFamily: AppTexts.getBlackFontFamily(),
                                fontSize: AppDimens.fontSizeTitle,
                                color: AppColors.text,
                                height: AppDimens.blackFontHeight,
                              ),
                              children: <TextSpan>[
                                TextSpan(
                                  text: 'Voting can really make a difference. ',
                                  style: TextStyle(
                                    color: AppColors
                                        .lightPrimary, // Lighter purple for the first line
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                                TextSpan(
                                  text: "Here's your\nelection to-do list:",
                                  style: TextStyle(
                                    color: AppColors
                                        .primary, // Darker purple for the main title
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        CustomSpacer(multiplier: 1),
                        ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: todoItems().length,
                          itemBuilder: (context, index) {
                            return _TodoItem(
                              model: todoItems()[index],
                              isLastItem: index == todoItems().length - 1,
                              onItemTapped: (model) {
                                switch (model.id) {
                                  case 1:
                                    {
                                      Utils.launch(
                                          "https://vote.nyc/page/register-vote");
                                    }
                                  case 2:
                                    {
                                      registerForPush(context);
                                    }
                                  case 3:
                                    {}
                                  case 4:
                                    {
                                      Utils.launch(
                                          "http://whosontheballot.org/");
                                    }
                                  case 5:
                                    {}
                                }
                              },
                            );
                          },
                        ),
                      ],
                    ),
              CustomSpacer(multiplier: 12),
            ],
          ),
        )
      ]),
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

class _TodoItem extends StatelessWidget {
  final TodoItemModel model;
  final bool isLastItem;
  final Function(TodoItemModel) onItemTapped;

  const _TodoItem({
    required this.model,
    required this.isLastItem,
    required this.onItemTapped,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsetsGeometry.symmetric(
              horizontal: AppDimens.bigLateralPaddingValue),
          child: InkWell(
            onTap: () {
              onItemTapped(model);
            },
            child: Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 0.0, vertical: 15.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Checkmark Icon
                  SvgPicture.asset(
                    width: 50,
                    height: 50,
                    'assets/images/ic_close_circle.svg',
                    fit: BoxFit.cover,
                  ),

                  // Title and Subtitle Text
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 5.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppTexts.title(model.title,
                              color: AppColors.primary, fontSize: 14),
                          const SizedBox(height: 1.0),
                          AppTexts.small(model.subtitle,
                              color: AppColors.primary)
                          /*Text(
                            subtitle,
                            style: TextStyle(
                              fontSize: 14.0,
                              color: Colors.black.withOpacity(0.7),
                            ),
                          ),*/
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        // Divider line between items (except the last one)

        if (!isLastItem)
          Container(
            height: 0.5,
            color: AppColors.lightYellow,
            margin: const EdgeInsets.symmetric(horizontal: 0.0),
          ),
      ],
    );
  }
}

class TodoItemModel {
  final int? id;
  final String title;
  final String subtitle;
  const TodoItemModel({
    this.id,
    required this.title,
    required this.subtitle,
  });
}
