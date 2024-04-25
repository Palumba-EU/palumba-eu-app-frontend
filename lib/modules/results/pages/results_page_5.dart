import 'package:flutter/material.dart';
import 'package:palumba_eu/utils/managers/i18n_manager/translations/generated/l10n.dart';

import '../components/fake_dialog_page.dart';

class ResultsPage5 extends StatefulWidget {
  const ResultsPage5({super.key});

  @override
  State<ResultsPage5> createState() => _ResultsPage5State();
}

class _ResultsPage5State extends State<ResultsPage5> {
  @override
  Widget build(BuildContext context) {
    return DialogApparencePage(
      title: S.of(context).resultsPage5Title,
      text: S.of(context).resultsPage5Text,
      assetFront: 'img_hemicycle',
      assetBack: 'img_hemicycle_bg',
    );
  }
}
