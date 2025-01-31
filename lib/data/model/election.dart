import 'package:flutter/material.dart';
import 'package:palumba_eu/utils/managers/i18n_manager/translations/generated/l10n.dart';

enum Election { DE, EU }

extension ElectionLocalization on Election {
  String get localized {
    switch (this) {
      case Election.DE:
        return 'Bundestagswahl 2025 🇩🇪';
      case Election.EU:
        return 'European Elections 2024 🇪🇺';
    }
  }
}

extension ElectionImages on Election {
  String get pigeon {
    switch (this) {
      case Election.DE:
        return 'assets/images/election/de/img_pigeon_de.svg';
      case Election.EU:
        return 'assets/images/election/eu/img_pigeon_eu.svg';
    }
  }

  String get logoCircle {
    switch (this) {
      case Election.DE:
        return 'assets/images/election/de/logo_circle_de.svg';
      case Election.EU:
        return 'assets/images/election/eu/logo_circle_eu.svg';
    }
  }

  String get ballotBox {
    switch (this) {
      case Election.DE:
        return 'assets/images/election/de/img_ballot_box_de.svg';
      case Election.EU:
        return 'assets/images/election/eu/img_ballot_box_eu.svg';
    }
  }

  String get ballotBoxBig {
    switch (this) {
      case Election.DE:
        return 'assets/images/election/de/img_ballot_box_big_de.png';
      case Election.EU:
        return 'assets/images/election/eu/img_ballot_box_big_eu.png';
    }
  }

  String get voteResult10 {
    switch (this) {
      case Election.DE:
        return 'assets/images/election/de/ic_vote_logos_de.svg';
      case Election.EU:
        return 'assets/images/election/eu/ic_vote_logos_eu.svg';
    }
  }

  String get swipe {
    switch (this) {
      case Election.DE:
        return 'assets/images/election/de/img_swipe_de.svg';
      case Election.EU:
        return 'assets/images/election/eu/img_swipe_eu.svg';
    }
  }

  String get stickerBallotBox {
    switch (this) {
      case Election.DE:
        return 'assets/images/election/de/ic_sticker_ballot_box_de.svg';
      case Election.EU:
        return 'assets/images/election/eu/ic_sticker_ballot_box_eu.svg';
    }
  }

  String get stickerBallotBox1 {
    switch (this) {
      case Election.DE:
        return 'assets/images/election/de/ic_sticker_ballot_box1_de.svg';
      case Election.EU:
        return 'assets/images/election/eu/ic_sticker_ballot_box1_eu.svg';
    }
  }

  String get stickerBallotBox2 {
    switch (this) {
      case Election.DE:
        return 'assets/images/election/de/ic_sticker_ballot_box2_de.svg';
      case Election.EU:
        return 'assets/images/election/eu/ic_sticker_ballot_box2_eu.svg';
    }
  }

  String get stickerBallotBox3 {
    switch (this) {
      case Election.DE:
        return 'assets/images/election/de/ic_sticker_ballot_box3_de.svg';
      case Election.EU:
        return 'assets/images/election/eu/ic_sticker_ballot_box3_eu.svg';
    }
  }

  String get stickerBallotBox4 {
    switch (this) {
      case Election.DE:
        return 'assets/images/election/de/ic_sticker_ballot_box4_de.svg';
      case Election.EU:
        return 'assets/images/election/eu/ic_sticker_ballot_box4_eu.svg';
    }
  }
}

extension ElectionTexts on Election {
  String entranceTitle1(BuildContext context) {
    switch (this) {
      case Election.DE:
        return S.of(context).entranceTitle1_ger25;
      case Election.EU:
        return S.of(context).entranceTitle1;
    }
  }

  String entranceTitle2(BuildContext context) {
    switch (this) {
      case Election.DE:
        return S.of(context).entranceTitle2_ger25;
      case Election.EU:
        return S.of(context).entranceTitle2;
    }
  }

  String entranceTitle3(BuildContext context) {
    switch (this) {
      case Election.DE:
        return S.of(context).entranceTitle3_ger25;
      case Election.EU:
        return S.of(context).entranceTitle3;
    }
  }

  String resultsPage4TitleTop(BuildContext context) {
    switch (this) {
      case Election.DE:
        return "Socially Progressive";
      case Election.EU:
        return S.of(context).resultsPage4TitleTop;
    }
  }

  String resultsPage4TitleBottom(BuildContext context) {
    switch (this) {
      case Election.DE:
        return "Socially Conservative";
      case Election.EU:
        return S.of(context).resultsPage4TitleBottom;
    }
  }

  String resultsPage4TitleRight(BuildContext context) {
    switch (this) {
      case Election.DE:
        return "Free Market Economics";
      case Election.EU:
        return S.of(context).resultsPage4TitleRight;
    }
  }

  String resultsPage4TitleLeft(BuildContext context) {
    switch (this) {
      case Election.DE:
        return "Economic Intervention";
      case Election.EU:
        return S.of(context).resultsPage4TitleLeft;
    }
  }
}

class ResultAxisTopic {
  int y;
  int x;
  ResultAxisTopic({required this.y, required this.x});
}

extension ElectionResult4Axis on Election {
  ResultAxisTopic get result4AxisTopic {
    switch (this) {
      case Election.DE:
        // demo topics. TODO: use acutal topic ids
        return ResultAxisTopic(x: 12, y: 13);
      case Election.EU:
        // topicEuIntegration, topicEuIntegration
        return ResultAxisTopic(x: 3, y: 2);
    }
  }
}

extension ElectionBackend on Election {
  int get backend {
    switch (this) {
      case Election.EU:
        return 1;
      case Election.DE:
        return 2;
    }
  }
}
