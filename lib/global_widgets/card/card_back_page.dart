import 'package:flutter/material.dart';
import 'package:palumba_eu/data/model/card_model.dart';
import 'package:palumba_eu/global_widgets/custom_html_widget.dart';
import 'package:palumba_eu/global_widgets/custom_spacer.dart';
import 'package:palumba_eu/utils/common_ui/app_texts.dart';

class CardBackPage extends StatelessWidget {
  const CardBackPage(
    this.card, {
    super.key,
  });

  final CardModel card;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomSpacer(multiplier: 2),
          CustomHtmlWidget(
            content: card.details,
            textStyle:
                AppTexts.customTextStyle(AppTextType.regular, fontSize: 14.0),
          ),
          CustomSpacer(multiplier: 8),
        ],
      ),
    );
  }
}
