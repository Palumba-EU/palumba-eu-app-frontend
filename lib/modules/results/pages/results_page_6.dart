import 'package:flutter/material.dart';
import 'package:palumba_eu/utils/managers/i18n_manager/translations/generated/l10n.dart';

import '../components/fake_dialog_page.dart';

class ResultsPage6 extends StatelessWidget {
  const ResultsPage6({super.key});

  @override
  Widget build(BuildContext context) {
    return DialogApparencePage(
      title: S.of(context).resultsPage6Title,
      text: S.of(context).resultsPage6Text,
      assetFront: 'img_ballot_box',
      assetBack: 'img_ballot_box_bg',
    );
  }
}
