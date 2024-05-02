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
    required this.assetFront,
    required this.assetHeight,
    super.key,
  });

  final String title;
  final String assetFront;
  final double assetHeight;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppDimens.bigLateralPaddingValue),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            'assets/images/${assetFront}.svg',
            height: assetHeight,
          ),
          CustomSpacer(multiplier: 2),
          AppTexts.title(title,
              textAlign: TextAlign.center, color: AppColors.primary),
        ],
      ),
    );
  }
}
