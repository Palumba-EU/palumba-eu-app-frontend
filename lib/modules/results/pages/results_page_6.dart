import 'package:flutter/material.dart';
import 'package:palumba_eu/modules/results/components/dialog_appearance_page.dart';
import 'package:palumba_eu/utils/managers/i18n_manager/translations/generated/l10n.dart';

class ResultsPage6 extends StatefulWidget {
  const ResultsPage6({super.key});

  @override
  State<ResultsPage6> createState() => _ResultsPage6State();
}

class _ResultsPage6State extends State<ResultsPage6> {
  @override
  Widget build(BuildContext context) {
    return DialogAppearancePage(
      title: S.of(context).resultsPage5Title,
      text: S.of(context).resultsPage5Text,
      assetFront: 'img_hemicycle',
      assetHeight: 96,
      assetBack: 'img_hemicycle_bg',
    );
  }
}
