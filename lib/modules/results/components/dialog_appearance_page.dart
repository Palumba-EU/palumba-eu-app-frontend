import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:palumba_eu/global_widgets/custom_spacer.dart';
import 'package:palumba_eu/utils/common_ui/app_colors.dart';
import 'package:palumba_eu/utils/common_ui/app_dimens.dart';
import 'package:palumba_eu/utils/common_ui/app_texts.dart';

class DialogAppearancePage extends StatelessWidget {
  const DialogAppearancePage({
    required this.title,
    required this.text,
    required this.assetBack,
    required this.assetFront,
    required this.assetHeight,
    super.key,
  });

  final String title;
  final String text;
  final String assetBack;
  final String assetFront;
  final double assetHeight;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.bottomCenter,
          child: SizedBox(
            width: double.infinity,
            child: Image.asset(
              'assets/images/${assetBack}.png',
              fit: BoxFit.fitWidth,
            ),
          ),
        ),
        Padding(
          padding: AppDimens.lateralPadding,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Spacer(),
              SvgPicture.asset(
                'assets/images/${assetFront}.svg',
                height: assetHeight,
              ),
              CustomSpacer(multiplier: 5),
              AppTexts.title(title,
                  textAlign: TextAlign.center, color: AppColors.primary),
              CustomSpacer(multiplier: 2),
              AppTexts.small(text,
                  textAlign: TextAlign.center,
                  maxLines: 10,
                  color: AppColors.primary),
              Spacer(
                flex: 3,
              ),
            ],
          ),
        )
      ],
    );
  }
}
