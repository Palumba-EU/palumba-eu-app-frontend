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
}

extension ElectionTexts on Election {
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

extension ElectionBackend on Election {
  String get backend {
    switch (this) {
      case Election.EU:
        return '1';
      case Election.DE:
        return '2';
    }
  }
}
