import 'package:flutter/material.dart';
import 'package:palumba_eu/data/model/card_model.dart';
import 'package:palumba_eu/global_widgets/custom_html_widget.dart';
import 'package:palumba_eu/global_widgets/custom_spacer.dart';
import 'package:palumba_eu/utils/common_ui/app_texts.dart';

class CardBackPage extends StatelessWidget {
  const CardBackPage(
    this.card,
    this.scrollController, {
    super.key,
  });

  final CardModel card;
  final ScrollController? scrollController;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: scrollController,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomSpacer(multiplier: 2),
          CustomHtmlWidget(
            content: card.details,
            // content: _longText(),
            textStyle:
                AppTexts.customTextStyle(AppTextType.regular, fontSize: 14.0),
          ),
          CustomSpacer(multiplier: 8),
        ],
      ),
    );
  }

  String _longText() {
    return '<p><strong>[Immigration]</strong> The act of people entering and settling in a country they are not native to.</p><p>–</p><p>From seeking better jobs to fleeing war or increasingly extreme weather, there are many reasons why people migrate. Today, 9% of the EU\'s population was born outside of it (<a href="https://commission.europa.eu/strategy-and-policy/priorities-2019-2024/promoting-our-european-way-life/statistics-migration-europe_en"><span style="text-decoration: underline;">Eurostat, 2023</span></a>) and there is an open debate about the pros and cons of immigration.</p><p>The recent Migration and Asylum Pact tries to tackle this but it\'s still controversial: it\'s expected to improve coordination between countries but several human rights organizations condemn it (<a href="https://www.euronews.com/my-europe/2024/04/10/european-parliament-narrowly-endorses-eu-migration-reform-moving-it-closer-to-the-finish-l"><span style="text-decoration: underline;">Euronews, 2024</span></a>).Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur tincidunt erat non diam consectetur, at facilisis lectus tincidunt. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Proin ut risus euismod, efficitur velit non, efficitur estLorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur tincidunt erat non diam consectetur, at facilisis lectus tincidunt. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Proin ut risus euismod, efficitur velit non, efficitur est. Cras pharetra lorem nec ligula fringilla, ut luctus arcu bibendum. Nulla id justo vel odio suscipit vulputate. Aenean convallis bibendum sem, et auctor nisl elementum vel. Suspendisse potenti. Donec mollis orci sit amet sapien rhoncus, in laoreet ipsum dapibus. Nulla ac nunc et elit tincidunt lacinia.Phasellus sed justo ex. Integer volutpat ligula sed ligula tristique, quis cursus nulla suscipit. Nulla ac fermentum erat. Fusce eget convallis augue. Sed volutpat metus ut nunc tincidunt, eget tristique ipsum sollicitudin. Aliquam feugiat tortor id sem scelerisque, sit amet cursus quam fermentum. In vel augue eu erat fermentum tincidunt a ut dolor. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Aenean vel diam non augue sagittis dapibus. In ut urna a metus ultricies tincidunt non non turpis. Curabitur dignissim, sem .&nbsp;</p>';
  }
}
