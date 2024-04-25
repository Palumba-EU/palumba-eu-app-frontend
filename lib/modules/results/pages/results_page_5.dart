import 'package:flutter/material.dart';
import 'package:palumba_eu/utils/managers/i18n_manager/translations/generated/l10n.dart';

import '../components/dialog_appearance_page.dart';

class ResultsPage5 extends StatelessWidget {
  const ResultsPage5({super.key});

  @override
  Widget build(BuildContext context) {
    return DialogAppearancePage(
      title: S.of(context).resultsPage5Title,
      text: S.of(context).resultsPage5Text,
      assetFront: 'img_ballot_box',
      assetHeight: 128,
      assetBack: 'img_ballot_box_bg',
    );
  }
}
