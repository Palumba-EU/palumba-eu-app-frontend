import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:palumba_eu/global_widgets/custom_horizontal_spacer.dart';
import 'package:palumba_eu/global_widgets/custom_network_image.dart';
import 'package:palumba_eu/utils/common_ui/app_colors.dart';
import 'package:palumba_eu/utils/common_ui/app_dimens.dart';
import 'package:palumba_eu/utils/common_ui/app_texts.dart';
import 'package:palumba_eu/utils/utils.dart';

class ResultsTileViewModel {
  final String link;
  final String logo;
  final String text;
  final String subText;

  ResultsTileViewModel({
    required this.link,
    required this.logo,
    required this.text,
    required this.subText,
  });
}

class ResultsTile extends StatelessWidget {
  final ResultsTileViewModel viewModel;

  const ResultsTile({
    required this.viewModel,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Utils.launch(viewModel.link);
      },
      behavior: HitTestBehavior.translucent,
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: AppDimens.lateralPaddingValue, vertical: 15),
        child: Row(children: [
          CustomNetworkImage(
            border: Border.all(color: AppColors.background, width: 3),
            width: AppDimens.avatarImageSize,
            height: AppDimens.avatarImageSize,
            isSvg: viewModel.logo.contains(".svg"),
            imageUrl: viewModel.logo,
            radius: Get.width,
            color: AppColors.blue,
          ),
          CustomHorizontalSpacer(),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 5),
                child: AppTexts.regular(
                  viewModel.subText,
                  fontSize: AppDimens.fontSizeSmall,
                  bold: true,
                  color: Colors.white,
                ),
              ),
              AppTexts.medium(viewModel.text,
                  bold: true, color: AppColors.primary)
            ],
          ))
        ]),
      ),
    );
  }
}
