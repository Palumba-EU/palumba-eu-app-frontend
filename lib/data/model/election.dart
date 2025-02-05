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

  String onBoardingStep3Title(BuildContext context) {
    switch (this) {
      case Election.DE:
        return S.of(context).onBoardingStep3Title_ger25;
      case Election.EU:
        return S.of(context).onBoardingStep3Title;
    }
  }

  String loadingResultsPageTitle1(BuildContext context) {
    switch (this) {
      case Election.DE:
        return S.of(context).loadingResultsPageTitle1_ger25;
      case Election.EU:
        return S.of(context).loadingResultsPageTitle1;
    }
  }

  String loadingResultsPageTitle2(BuildContext context) {
    switch (this) {
      case Election.DE:
        return S.of(context).loadingResultsPageTitle2_ger25;
      case Election.EU:
        return S.of(context).loadingResultsPageTitle2;
    }
  }

  String loadingResultsPageTitle3(BuildContext context, String country) {
    switch (this) {
      case Election.DE:
        return S.of(context).loadingResultsPageTitle3_ger25;
      case Election.EU:
        return S.of(context).loadingResultsPageTitle3(country);
    }
  }

  String loadingResultsPageTitle4(BuildContext context) {
    switch (this) {
      case Election.DE:
        return S.of(context).loadingResultsPageTitle4_ger25;
      case Election.EU:
        return S.of(context).loadingResultsPageTitle4;
    }
  }

  String resultsPage1Title(BuildContext context) {
    switch (this) {
      case Election.DE:
        return S.of(context).resultsPage1Title_ger25;
      case Election.EU:
        return S.of(context).resultsPage1Title;
    }
  }

  String resultsPage1Text(BuildContext context) {
    switch (this) {
      case Election.DE:
        return S.of(context).resultsPage1Text_ger25;
      case Election.EU:
        return S.of(context).resultsPage1Text;
    }
  }

  String resultsPage1Button(BuildContext context) {
    switch (this) {
      case Election.DE:
        return S.of(context).resultsPage1Button_ger25;
      case Election.EU:
        return S.of(context).resultsPage1Button;
    }
  }

  String resultsPage2_1Title(BuildContext context) {
    switch (this) {
      case Election.DE:
        return S.of(context).resultsPage2_1Title_ger25;
      case Election.EU:
        return S.of(context).resultsPage2_1Title;
    }
  }

  String resultsPage2_2Title(BuildContext context) {
    switch (this) {
      case Election.DE:
        return S.of(context).resultsPage2_2Title_ger25;
      case Election.EU:
        return S.of(context).resultsPage2_2Title;
    }
  }

  String resultsPage3Title(BuildContext context) {
    switch (this) {
      case Election.DE:
        return S.of(context).resultsPage3Title_ger25;
      case Election.EU:
        return S.of(context).resultsPage3Title;
    }
  }

  String resultsPage4TitleTop(BuildContext context) {
    switch (this) {
      case Election.DE:
        return S.of(context).resultsPage4TitleTop_ger25;
      case Election.EU:
        return S.of(context).resultsPage4TitleTop;
    }
  }

  String resultsPage4TitleBottom(BuildContext context) {
    switch (this) {
      case Election.DE:
        return S.of(context).resultsPage4TitleBottom_ger25;
      case Election.EU:
        return S.of(context).resultsPage4TitleBottom;
    }
  }

  String resultsPage4TitleRight(BuildContext context) {
    switch (this) {
      case Election.DE:
        return S.of(context).resultsPage4TitleRight_ger25;
      case Election.EU:
        return S.of(context).resultsPage4TitleRight;
    }
  }

  String resultsPage4TitleLeft(BuildContext context) {
    switch (this) {
      case Election.DE:
        return S.of(context).resultsPage4TitleLeft_ger25;
      case Election.EU:
        return S.of(context).resultsPage4TitleLeft;
    }
  }

  String resultsPage4TitleUserHere(BuildContext context) {
    switch (this) {
      case Election.DE:
        return S.of(context).resultsPage4TitleUserHere_ger25;
      case Election.EU:
        return S.of(context).resultsPage4TitleUserHere;
    }
  }

  String resultsPage5Title(BuildContext context) {
    switch (this) {
      case Election.DE:
        return S.of(context).resultsPage5Title_ger25;
      case Election.EU:
        return S.of(context).resultsPage5Title;
    }
  }

  String resultsPage5Topic1(BuildContext context) {
    switch (this) {
      case Election.DE:
        return S.of(context).resultsPage5Topic1_ger25;
      case Election.EU:
        return S.of(context).resultsPage5Topic1;
    }
  }

  String resultsPage5Topic2(BuildContext context) {
    switch (this) {
      case Election.DE:
        return S.of(context).resultsPage5Topic2_ger25;
      case Election.EU:
        return S.of(context).resultsPage5Topic2;
    }
  }

  String resultsPage5Topic3(BuildContext context) {
    switch (this) {
      case Election.DE:
        return S.of(context).resultsPage5Topic3_ger25;
      case Election.EU:
        return S.of(context).resultsPage5Topic3;
    }
  }

  String resultsPage5Topic4(BuildContext context) {
    switch (this) {
      case Election.DE:
        return S.of(context).resultsPage5Topic4_ger25;
      case Election.EU:
        return S.of(context).resultsPage5Topic3; // wrong in translation file
    }
  }

  String resultsPage5Topic5(BuildContext context) {
    switch (this) {
      case Election.DE:
        return S.of(context).resultsPage5Topic5_ger25;
      case Election.EU:
        return S
            .of(context)
            .resultsPage5Topic5_ger25; // wrong in translation file
    }
  }

  String resultsPage6_1Title(BuildContext context) {
    switch (this) {
      case Election.DE:
        return S.of(context).resultsPage6_1Title_ger25;
      case Election.EU:
        return S.of(context).resultsPage6_1Title;
    }
  }

  String resultsPage6_2Title(BuildContext context) {
    switch (this) {
      case Election.DE:
        return S.of(context).resultsPage6_2Title_ger25;
      case Election.EU:
        return S.of(context).resultsPage6_2Title;
    }
  }

  String resultsPage6Text(BuildContext context) {
    switch (this) {
      case Election.DE:
        return S.of(context).resultsPage6Text_ger25;
      case Election.EU:
        return S.of(context).resultsPage6Text;
    }
  }

  String resultsPage7Title(BuildContext context, String country, String group) {
    switch (this) {
      case Election.DE:
        return S.of(context).resultsPage7Title_ger25(group);
      case Election.EU:
        return S.of(context).resultsPage7Title(country, group);
    }
  }

  String resultsPageAllCandidatesTitle(BuildContext context) {
    return "Your personal ranking of all parties";
  }

  String resultsPageAllCandidatesDescription(
      BuildContext context, int totalParties) {
    return "Including " +
        totalParties.toString() +
        " political parties in all Bundesländer in Germany.";
  }

  String resultsPage7Disclaimer(BuildContext context) {
    switch (this) {
      case Election.DE:
        return S.of(context).resultsPage7Disclaimer_ger25;
      case Election.EU:
        return S.of(context).resultsPage7Disclaimer;
    }
  }

  String resultsPage7NoLocalCandidates(BuildContext context, String country) {
    switch (this) {
      case Election.DE:
        return S.of(context).resultsPage7NoLocalCandidates(country);
      case Election.EU:
        return S.of(context).resultsPage7NoLocalCandidates(country);
    }
  }

  String resultsPage8_1Text(
      BuildContext context, String topic, String percentage) {
    switch (this) {
      case Election.DE:
        return S.of(context).resultsPage8_1Text_ger25(percentage, topic);
      case Election.EU:
        return S.of(context).resultsPage8_1Text(topic, percentage);
    }
  }

  String resultsPage8_2Text(BuildContext context) {
    switch (this) {
      case Election.DE:
        return S.of(context).resultsPage8_2Text_ger25;
      case Election.EU:
        return S.of(context).resultsPage8_2Text;
    }
  }

  String resultsPage8Help(BuildContext context) {
    switch (this) {
      case Election.DE:
        return S.of(context).resultsPage8Help_ger25;
      case Election.EU:
        return S.of(context).resultsPage8Help;
    }
  }

  String resultsPage9Help(BuildContext context) {
    switch (this) {
      case Election.DE:
        return S.of(context).resultsPage9Help_ger25;
      case Election.EU:
        return S.of(context).resultsPage9Help;
    }
  }

  String resultsPage9Text1(BuildContext context) {
    switch (this) {
      case Election.DE:
        return S.of(context).resultsPage9Text1_ger25;
      case Election.EU:
        return S.of(context).resultsPage9Text1;
    }
  }

  String resultsPage9Text2(BuildContext context) {
    switch (this) {
      case Election.DE:
        return S.of(context).resultsPage9Text2_egr;
      case Election.EU:
        return S.of(context).resultsPage9Text2;
    }
  }

  String resultsPage10Title(BuildContext context) {
    switch (this) {
      case Election.DE:
        return S.of(context).resultsPage10Title_ger25;
      case Election.EU:
        return S.of(context).resultsPage10Title;
    }
  }

  String resultsPage10NopButton(BuildContext context) {
    switch (this) {
      case Election.DE:
        return S.of(context).resultsPage10NopButton_ger25;
      case Election.EU:
        return S.of(context).resultsPage10NopButton;
    }
  }

  String resultsPage10YesButton(BuildContext context) {
    switch (this) {
      case Election.DE:
        return S.of(context).resultsPage10YesButton_ger25;
      case Election.EU:
        return S.of(context).resultsPage10YesButton;
    }
  }

  String settingsPageTitleAssociation(BuildContext context) {
    switch (this) {
      case Election.DE:
        return S.of(context).settingsPageTitleAssociation_ger25;
      case Election.EU:
        return S.of(context).settingsPageTitleAssociation;
    }
  }

  String settingsPageTitlePartners(BuildContext context) {
    switch (this) {
      case Election.DE:
        return S.of(context).settingsPageTitlePartners_ger25;
      case Election.EU:
        return S.of(context).settingsPageTitlePartners;
    }
  }

  String settingsPageTextPartners(BuildContext context) {
    switch (this) {
      case Election.DE:
        return S.of(context).settingsPageTextPartners_ger25;
      case Election.EU:
        return S.of(context).settingsPageTextPartners;
    }
  }

  String settingsPageSubtitle1(BuildContext context) {
    switch (this) {
      case Election.DE:
        return S.of(context).settingsPageSubtitle1_ger25;
      case Election.EU:
        return S.of(context).settingsPageSubtitle1;
    }
  }

  String settingsPageSubtitle2(BuildContext context) {
    switch (this) {
      case Election.DE:
        return S.of(context).settingsPageSubtitle2_ger25;
      case Election.EU:
        return S.of(context).settingsPageSubtitle2;
    }
  }

  String settingsPageSubtitle3(BuildContext context) {
    switch (this) {
      case Election.DE:
        return S.of(context).settingsPageSubtitle3_ger25;
      case Election.EU:
        return S.of(context).settingsPageSubtitle3;
    }
  }

  String settingsPageSubtitle4(BuildContext context) {
    switch (this) {
      case Election.DE:
        return S.of(context).settingsPageSubtitle4_ger25;
      case Election.EU:
        return S.of(context).settingsPageSubtitle4;
    }
  }

  String settingsPageSubtitle5(BuildContext context) {
    switch (this) {
      case Election.DE:
        return S.of(context).settingsPageSubtitle5_ger25;
      case Election.EU:
        return S.of(context).settingsPageSubtitle5;
    }
  }

  String settingsPageShareText(BuildContext context) {
    switch (this) {
      case Election.DE:
        return S.of(context).settingsPageShareText_ger25;
      case Election.EU:
        return S.of(context).settingsPageShareText;
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
