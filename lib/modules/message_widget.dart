import 'package:flutter/material.dart';
import 'package:palumba_eu/data/provider/remote/data_api.dart';
import 'package:palumba_eu/global_widgets/custom_button.dart';
import 'package:palumba_eu/global_widgets/custom_spacer.dart';
import 'package:palumba_eu/utils/common_ui/app_colors.dart';
import 'package:palumba_eu/utils/common_ui/app_dimens.dart';
import 'package:palumba_eu/utils/common_ui/app_texts.dart';

class MessageWidget extends StatelessWidget {
  final MessageScreenContent content;

  const MessageWidget({
    super.key,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        color: AppColors.background,
        child: Padding(
          padding: AppDimens.lateralPadding,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomSpacer(
                multiplier: 2,
              ),
              Container(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(AppDimens.borderRadius),
                    border: Border.all(
                        color: AppColors.lightYellow, width: 2, strokeAlign: 1),
                  ),
                  child: Image.network(
                    content.imageUrl,
                    fit: BoxFit.fitWidth,
                  )),
              AppTexts.title(content.title, color: AppColors.primary),
              AppTexts.regular(content.message, color: AppColors.primary),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextButton(
                      onPressed: () => dismiss(context),
                      child: AppTexts.regular("dismiss",
                          color: AppColors.primary, bold: true)),
                  CustomButton(
                    onPressed: () => dismiss(context),
                    text: "Okay",
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
        ));
  }

  void dismiss(BuildContext context) {
    Navigator.of(context).pop();
  }
}
