import 'package:flutter/material.dart';
import 'package:palumba_eu/modules/results/components/dialog_appearance_page.dart';
import 'package:palumba_eu/utils/managers/i18n_manager/translations/generated/l10n.dart';



class ResultsPage6 extends StatelessWidget {
  const ResultsPage6({super.key});

  @override
  Widget build(BuildContext context) {
    return DialogAppearancePage(
      title: S.of(context).resultsPage6Title,
      text: S.of(context).resultsPage6Text,
      assetFront: 'img_ballot_box',
      assetHeight: 128,
      assetBack: 'img_ballot_box_bg',
    );
  }
}
