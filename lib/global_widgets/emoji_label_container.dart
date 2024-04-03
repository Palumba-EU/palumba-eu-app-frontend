import 'package:flutter/material.dart';
import 'package:palumba_eu/utils/common_ui/app_colors.dart';
import 'package:palumba_eu/utils/common_ui/app_dimens.dart';

class EmojiLabelContainer extends StatelessWidget {
  const EmojiLabelContainer({
    super.key,
    required this.emoji,
  });
  final String emoji;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: AppDimens.smallLateralPaddingValue, vertical: 7),
      decoration: BoxDecoration(
        color: AppColors.beigeWithOpacity,
        borderRadius: BorderRadius.circular(100),
      ),
      child: Text(emoji, style: Theme.of(context).textTheme.bodyMedium),
    );
  }
}
