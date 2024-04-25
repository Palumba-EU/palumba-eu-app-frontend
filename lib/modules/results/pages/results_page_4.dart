import 'package:flutter/material.dart';
import 'package:palumba_eu/utils/managers/i18n_manager/translations/generated/l10n.dart';

import '../components/dialog_appearance_page.dart';

class ResultsPage4 extends StatefulWidget {
  const ResultsPage4({super.key});

  @override
  State<ResultsPage4> createState() => _ResultsPage4State();
}

class _ResultsPage4State extends State<ResultsPage4> {
  @override
  Widget build(BuildContext context) {
    return DialogAppearancePage(
      title: S.of(context).resultsPage4Title,
      text: S.of(context).resultsPage4Text,
      assetFront: 'img_hemicycle',
      assetHeight: 96,
      assetBack: 'img_hemicycle_bg',
    );
  }
}
