import 'package:flutter/material.dart';
import 'package:palumba_eu/utils/managers/i18n_manager/translations/generated/l10n.dart';

import '../components/fake_dialog_page.dart';

class ResultsPage4 extends StatefulWidget {
  const ResultsPage4({super.key});

  @override
  State<ResultsPage4> createState() => _ResultsPage4State();
}

class _ResultsPage4State extends State<ResultsPage4> {
  @override
  Widget build(BuildContext context) {
    return DialogApparencePage(
      title: S.of(context).resultsPage4Title,
      text: S.of(context).resultsPage4Text,
      urlImageBack: 'https://picsum.photos/800/600',
      urlImageFront: 'https://picsum.photos/seed/picsum/800/300',
    );
  }
}
