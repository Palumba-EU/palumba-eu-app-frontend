import 'package:flutter/material.dart';
import 'package:palumba_eu/utils/common_ui/app_texts.dart';

class EmojiLabelContainer extends StatelessWidget {
  const EmojiLabelContainer({
    super.key,
    required this.emoji,
    required this.backgroundColor,
  });

  final String emoji;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(100),
      ),
      child: AppTexts.small(emoji),
    );
  }
}
