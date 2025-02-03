import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:palumba_eu/data/model/elections_response.dart';
import 'package:palumba_eu/global_widgets/custom_button.dart';
import 'package:palumba_eu/global_widgets/custom_html_widget.dart';
import 'package:palumba_eu/global_widgets/custom_network_image.dart';
import 'package:palumba_eu/global_widgets/custom_spacer.dart';
import 'package:palumba_eu/utils/common_ui/app_colors.dart';
import 'package:palumba_eu/utils/common_ui/app_dimens.dart';
import 'package:palumba_eu/utils/common_ui/app_texts.dart';
import 'package:palumba_eu/utils/managers/i18n_manager/translations/generated/l10n.dart';
import 'package:palumba_eu/utils/utils.dart';

class MessageWidget extends StatelessWidget {
  final EggScreen content;

  const MessageWidget({
    super.key,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: SingleChildScrollView(
                child: Container(
                    constraints: BoxConstraints(
                      minHeight: MediaQuery.of(context).size.height,
                    ),
                    color: AppColors.background,
                    child: Padding(
                      padding: EdgeInsets.all(AppDimens.lateralPaddingValue),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              AppTexts.title(S.of(context).shortAppName,
                                  forceCaprasimo: true,
                                  color: AppColors.primary,
                                  fontSize: 27.5),
                              Spacer(),
                            ],
                          ),
                          CustomSpacer(
                            multiplier: 2,
                          ),
                          Container(
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                    AppDimens.borderRadius),
                                border: Border.all(
                                    color: AppColors.lightYellow,
                                    width: 2,
                                    strokeAlign: 1),
                              ),
                              child: CustomNetworkImage(
                                  imageUrl: content.image,
                                  isSvg: content.image.contains(".svg"),
                                  width: Get.width,
                                  height: 200,
                                  fit: BoxFit.contain)),
                          AppTexts.title(content.title,
                              color: AppColors.primary,
                              textAlign: TextAlign.center),
                          CustomHtmlWidget(
                            content: content.description,
                            textStyle: AppTexts.customTextStyle(
                                AppTextType.regular,
                                color: AppColors.primary,
                                fontSize: 14.0),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              TextButton(
                                  onPressed: () => dismiss(context),
                                  child: AppTexts.regular(content.noBtnText,
                                      color: AppColors.primary, bold: true)),
                              CustomButton(
                                onPressed: () => launchUrl(content.yesBtnLink),
                                text: content.yesBtnText,
                                //Default parameters
                                border: ButtonBorderParameters(),
                              ),
                            ],
                          ),
                          CustomSpacer(
                            multiplier: 2,
                          ),
                        ],
                      ),
                    )))));
  }

  void dismiss(BuildContext context) {
    Navigator.of(context).pop();
  }

  void launchUrl(String url) {
    Utils.launch(url);
  }

  static callAsBottomSheet(EggScreen info) {
    Get.bottomSheet(MessageWidget(content: info),
        isScrollControlled: true,
        enableDrag: true,
        backgroundColor: Colors.transparent);
  }
}
