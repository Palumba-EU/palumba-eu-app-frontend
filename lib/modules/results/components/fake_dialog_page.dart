import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:palumba_eu/global_widgets/custom_network_image.dart';
import 'package:palumba_eu/global_widgets/custom_spacer.dart';
import 'package:palumba_eu/utils/common_ui/app_dimens.dart';
import 'package:palumba_eu/utils/common_ui/app_texts.dart';

class FakeDialogPage extends StatelessWidget {
  const FakeDialogPage({
    required this.title,
    required this.text,
    required this.urlImageBack,
    required this.urlImageFront,
    super.key,
  });
  final String title;
  final String text;
  final String urlImageBack;
  final String urlImageFront;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CustomSpacer(multiplier: 6),
            Opacity(
              opacity: 0.1,
              child: CustomNetworkImage(
                imageUrl: urlImageBack,
                height: Get.height * .5,
                width: Get.width,
              ),
            ),
          ],
        ),
        Center(
          child: Padding(
            padding: AppDimens.lateralPadding,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CustomSpacer(multiplier: 10),
                CustomNetworkImage(
                  imageUrl: urlImageFront,
                  width: 130,
                  height: 139,
                ),
                CustomSpacer(multiplier: 3),
                AppTexts.title(title, textAlign: TextAlign.center),
                CustomSpacer(multiplier: 3),
                AppTexts.small(text, textAlign: TextAlign.center),
              ],
            ),
          ),
        )
      ],
    );
  }
}
