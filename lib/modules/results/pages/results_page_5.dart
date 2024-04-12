import 'package:flutter/material.dart';
import 'package:palumba_eu/utils/managers/i18n_manager/translations/generated/l10n.dart';

import '../components/fake_dialog_page.dart';

class ResultsPage5 extends StatelessWidget {
  const ResultsPage5({super.key});

  @override
  Widget build(BuildContext context) {
    return DialogApparencePage(
      title: S.of(context).resultsPage5Title,
      text: S.of(context).resultsPage5Text,
      urlImageBack: 'https://picsum.photos/800/600',
      urlImageFront: 'https://picsum.photos/seed/picsum/800/300',
    );
  }
}
