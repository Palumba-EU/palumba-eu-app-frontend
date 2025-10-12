import 'package:flutter/material.dart';
import 'package:palumba_eu/utils/managers/i18n_manager/translations/generated/l10n.dart';

import '../../utils/common_ui/app_colors.dart';

enum Election { DE, EU, NY }

extension ElectionLocalization on Election {
  String localized(BuildContext context) {
    switch (this) {
      case Election.DE:
        return S.of(context).electionDE;
      case Election.EU:
        return S.of(context).electionEU;
      case Election.NY:
        return S.of(context).electionNY;
    }
  }
}

extension ElectionBackgroundColor on Election {
  Color get background {
    switch (this) {
      case Election.DE:
        return AppColors.background;
      case Election.EU:
        return AppColors.background;
      case Election.NY:
        return AppColors.resultNYBackground;
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
      case Election.NY:
        return 'assets/images/election/ny/img_pigeon_ny_new.png';
    }
  }

  String get logoCircle {
    switch (this) {
      case Election.DE:
        return 'assets/images/election/de/logo_circle_de.svg';
      case Election.EU:
        return 'assets/images/election/eu/logo_circle_eu.svg';
      case Election.NY:
        return 'assets/images/election/ny/logo_circle_ny_new.png';
    }
  }

  String get ballotBoxBig {
    switch (this) {
      case Election.DE:
        return 'assets/images/election/de/img_ballot_box_big_de.png';
      case Election.EU:
        return 'assets/images/election/eu/img_ballot_box_big_eu.png';
      case Election.NY:
        return 'assets/images/election/ny/img_ballot_box_big_ny.png';
    }
  }

  String get voteResult10 {
    switch (this) {
      case Election.DE:
        return 'assets/images/election/de/ic_vote_logos_de.svg';
      case Election.EU:
        return 'assets/images/election/eu/ic_vote_logos_eu.svg';
      case Election.NY:
        return 'assets/images/election/ny/ic_vote_logos_ny.svg';
    }
  }

  String get swipe {
    switch (this) {
      case Election.DE:
        return 'assets/images/election/de/img_swipe_de.svg';
      case Election.EU:
        return 'assets/images/election/eu/img_swipe_eu.svg';
      case Election.NY:
        return 'assets/images/election/ny/img_swipe_ny_new.png';
    }
  }

  String get stickerBallotBox {
    switch (this) {
      case Election.DE:
        return 'assets/images/election/de/ic_sticker_ballot_box_de.svg';
      case Election.EU:
        return 'assets/images/election/eu/ic_sticker_ballot_box_eu.svg';
      case Election.NY:
        return 'assets/images/election/ny/ic_sticker_ballot_box_ny.svg';
        return 'assets/images/election/ny/ic_whos_on_ballot.svg';
        return 'assets/images/election/ny/ic_sticker_ballot_box_eu.svg';
    }
  }

  String get stickerBallotBox1 {
    switch (this) {
      case Election.DE:
        return 'assets/images/election/de/ic_sticker_ballot_box1_de.svg';
      case Election.EU:
        return 'assets/images/election/eu/ic_sticker_ballot_box1_eu.svg';
      case Election.NY:
        return 'assets/images/election/ny/ic_sticker_ballot_box1_ny.svg';
    }
  }

  String get stickerBallotBox2 {
    switch (this) {
      case Election.DE:
        return 'assets/images/election/de/ic_sticker_ballot_box2_de.svg';
      case Election.EU:
        return 'assets/images/election/eu/ic_sticker_ballot_box2_eu.svg';
      case Election.NY:
        return 'assets/images/election/ny/ic_sticker_ballot_box2_ny.svg';
    }
  }

  String get stickerBallotBox3 {
    switch (this) {
      case Election.DE:
        return 'assets/images/election/de/ic_sticker_ballot_box3_de.svg';
      case Election.EU:
        return 'assets/images/election/eu/ic_sticker_ballot_box3_eu.svg';
      case Election.NY:
        return 'assets/images/election/ny/ic_sticker_ballot_box3_ny.svg';
    }
  }

  String get stickerBallotBox4 {
    switch (this) {
      case Election.DE:
        return 'assets/images/election/de/ic_sticker_ballot_box4_de.svg';
      case Election.EU:
        return 'assets/images/election/eu/ic_sticker_ballot_box4_eu.svg';
      case Election.NY:
        return 'assets/images/election/ny/ic_sticker_ballot_box4_ny.svg';
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
      case Election.NY:
        return S.of(context).entranceTitle1_nyc25;
    }
  }

  String entranceTitle2(BuildContext context) {
    switch (this) {
      case Election.DE:
        return S.of(context).entranceTitle2_ger25;
      case Election.EU:
        return S.of(context).entranceTitle2;
      case Election.NY:
        return S.of(context).entranceTitle2_nyc25;
    }
  }

  String entranceTitle3(BuildContext context) {
    switch (this) {
      case Election.DE:
        return S.of(context).entranceTitle3_ger25;
      case Election.EU:
        return S.of(context).entranceTitle3;
      case Election.NY:
        return S.of(context).entranceTitle3_nyc25;
    }
  }

  String onBoardingStep1Title(BuildContext context) {
    switch (this) {
      case Election.DE:
        return S.of(context).onBoardingStep1Title;
      case Election.EU:
        return S.of(context).onBoardingStep1Title;
      case Election.NY:
        return S.of(context).onBoardingStep1Title_nyc25;
    }
  }

  String onBoardingStep3Title(BuildContext context) {
    switch (this) {
      case Election.DE:
        return S.of(context).onBoardingStep3Title_ger25;
      case Election.EU:
        return S.of(context).onBoardingStep3Title;
      case Election.NY:
        return S.of(context).onBoardingStep3Title_nyc25;
    }
  }

  String onBoardingStep4Title(BuildContext context) {
    switch (this) {
      case Election.DE:
        return S.of(context).onBoardingStep4Title;
      case Election.EU:
        return S.of(context).onBoardingStep4Title;
      case Election.NY:
        return S.of(context).onBoardingStep4Title_nyc25;
    }
  }

  String loadingResultsPageTitle1(BuildContext context) {
    switch (this) {
      case Election.DE:
        return S.of(context).loadingResultsPageTitle1_ger25;
      case Election.EU:
        return S.of(context).loadingResultsPageTitle1;
      case Election.NY:
        return S.of(context).loadingResultsPageTitle1_nyc25;
    }
  }

  String loadingResultsPageTitle2(BuildContext context) {
    switch (this) {
      case Election.DE:
        return S.of(context).loadingResultsPageTitle2_ger25;
      case Election.EU:
        return S.of(context).loadingResultsPageTitle2;
      case Election.NY:
        return S.of(context).loadingResultsPageTitle2_nyc25;
    }
  }

  String loadingResultsPageTitle3(BuildContext context, String country) {
    switch (this) {
      case Election.DE:
        return S.of(context).loadingResultsPageTitle3_ger25;
      case Election.EU:
        return S.of(context).loadingResultsPageTitle3(country);
      case Election.NY:
        return S.of(context).loadingResultsPageTitle3_nyc25;
    }
  }

  String loadingResultsPageTitle4(BuildContext context) {
    switch (this) {
      case Election.DE:
        return S.of(context).loadingResultsPageTitle4_ger25;
      case Election.EU:
        return S.of(context).loadingResultsPageTitle4;
      case Election.NY:
        return S.of(context).loadingResultsPageTitle4_nyc25;
    }
  }

  String resultsPage1Title(BuildContext context) {
    switch (this) {
      case Election.DE:
        return S.of(context).resultsPage1Title_ger25;
      case Election.EU:
        return S.of(context).resultsPage1Title;
      case Election.NY:
        return S.of(context).resultsPage1Title_nyc25;
    }
  }

  String resultsPage1Text(BuildContext context) {
    switch (this) {
      case Election.DE:
        return S.of(context).resultsPage1Text_ger25;
      case Election.EU:
        return S.of(context).resultsPage1Text;
      case Election.NY:
        return S.of(context).resultsPage1Text_nyc25;
    }
  }

  String resultsPage1Button(BuildContext context) {
    switch (this) {
      case Election.DE:
        return S.of(context).resultsPage1Button_ger25;
      case Election.EU:
        return S.of(context).resultsPage1Button;
      case Election.NY:
        return S.of(context).resultsPage1Button_nyc25;
    }
  }

  String resultsPage2_1Title(BuildContext context) {
    switch (this) {
      case Election.DE:
        return S.of(context).resultsPage2_1Title_ger25;
      case Election.EU:
        return S.of(context).resultsPage2_1Title;
      case Election.NY:
        return S.of(context).resultsPage2_1Title_nyc25;
    }
  }

  String resultsPage2_2Title(BuildContext context) {
    switch (this) {
      case Election.DE:
        return S.of(context).resultsPage2_2Title_ger25;
      case Election.EU:
        return S.of(context).resultsPage2_2Title;
      case Election.NY:
        return S.of(context).resultsPage2_2Title_nyc25;
    }
  }

  String resultsPage3Title(BuildContext context) {
    switch (this) {
      case Election.DE:
        return S.of(context).resultsPage3Title_ger25;
      case Election.EU:
        return S.of(context).resultsPage3Title;
      case Election.NY:
        return S.of(context).resultsPage3Title_nyc25;
    }
  }

  String resultsPage4TitleTop(BuildContext context) {
    switch (this) {
      case Election.DE:
        return S.of(context).resultsPage4TitleTop_ger25;
      case Election.EU:
        return S.of(context).resultsPage4TitleTop;
      case Election.NY:
        return S.of(context).resultsPage4TitleTop_nyc25;
    }
  }

  String resultsPage4TitleBottom(BuildContext context) {
    switch (this) {
      case Election.DE:
        return S.of(context).resultsPage4TitleBottom_ger25;
      case Election.EU:
        return S.of(context).resultsPage4TitleBottom;
      case Election.NY:
        return S.of(context).resultsPage4TitleBottom_nyc25;
    }
  }

  String resultsPage4TitleRight(BuildContext context) {
    switch (this) {
      case Election.DE:
        return S.of(context).resultsPage4TitleRight_ger25;
      case Election.EU:
        return S.of(context).resultsPage4TitleRight;
      case Election.NY:
        return S.of(context).resultsPage4TitleRight_nyc25;
    }
  }

  String resultsPage4TitleLeft(BuildContext context) {
    switch (this) {
      case Election.DE:
        return S.of(context).resultsPage4TitleLeft_ger25;
      case Election.EU:
        return S.of(context).resultsPage4TitleLeft;
      case Election.NY:
        return S.of(context).resultsPage4TitleLeft_nyc25;
    }
  }

  String resultsPage4TitleUserHere(BuildContext context) {
    switch (this) {
      case Election.DE:
        return S.of(context).resultsPage4TitleUserHere_ger25;
      case Election.EU:
        return S.of(context).resultsPage4TitleUserHere;
      case Election.NY:
        return S.of(context).resultsPage4TitleUserHere_nyc25;
    }
  }

  String resultsPage5Title(BuildContext context) {
    switch (this) {
      case Election.DE:
        return S.of(context).resultsPage5Title_ger25;
      case Election.EU:
        return S.of(context).resultsPage5Title;
      case Election.NY:
        return S.of(context).resultsPage5Title_nyc; //new for nyc
    }
  }

  String resultsPage5Topic1(BuildContext context) {
    switch (this) {
      case Election.DE:
        return S.of(context).resultsPage5Topic1_ger25;
      case Election.EU:
        return S.of(context).resultsPage5Topic1;
      case Election.NY:
        return S.of(context).resultsPage5Topic1_nyc25;
    }
  }

  String resultsPage5Topic2(BuildContext context) {
    switch (this) {
      case Election.DE:
        return S.of(context).resultsPage5Topic2_ger25;
      case Election.EU:
        return S.of(context).resultsPage5Topic2;
      case Election.NY:
        return S.of(context).resultsPage5Topic2_nyc25;
    }
  }

  String resultsPage5Topic3(BuildContext context) {
    switch (this) {
      case Election.DE:
        return S.of(context).resultsPage5Topic3_ger25;
      case Election.EU:
        return S.of(context).resultsPage5Topic3;
      case Election.NY:
        return S.of(context).resultsPage5Topic3_nyc25;
    }
  }

  String resultsPage5Topic4(BuildContext context) {
    switch (this) {
      case Election.DE:
        return S.of(context).resultsPage5Topic4_ger25;
      case Election.EU:
        return S.of(context).resultsPage5Topic3; // wrong in translation file
      case Election.NY:
        return S.of(context).resultsPage5Topic4_nyc25;
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
      case Election.NY:
        return S.of(context).resultsPage5Topic5_nyc25;
    }
  }

  String resultsPage6_1Title(BuildContext context) {
    switch (this) {
      case Election.DE:
        return S.of(context).resultsPage6_1Title_ger25;
      case Election.EU:
        return S.of(context).resultsPage6_1Title;
      case Election.NY:
        return S.of(context).resultsPage6_1Title_nyc25;
    }
  }

  String resultsPage6_2Title(BuildContext context) {
    switch (this) {
      case Election.DE:
        return S.of(context).resultsPage6_2Title_ger25;
      case Election.EU:
        return S.of(context).resultsPage6_2Title;
      case Election.NY:
        return S.of(context).resultsPage6_2Title_nyc25;
    }
  }

  String resultsPage6Text(BuildContext context) {
    switch (this) {
      case Election.DE:
        return S.of(context).resultsPage6Text_ger25;
      case Election.EU:
        return S.of(context).resultsPage6Text;
      case Election.NY:
        return S.of(context).resultsPage6Text_nyc25;
    }
  }

  String resultsPage7Title(BuildContext context, String country, String group) {
    switch (this) {
      case Election.DE:
        return S.of(context).resultsPage7Title_ger25(group);
      case Election.EU:
        return S.of(context).resultsPage7Title(country, group);
      case Election.NY:
        return S.of(context).resultsPage7Title_nyc25(group);
    }
  }

  String resultsPageAllCandidatesTitle(BuildContext context) {
    switch (this) {
      case Election.DE:
        return S.of(context).resultsPageAllPartiesTitle_ger25;
      case Election.EU:
        // EU flow doesn’t show “all parties” list; fall back to DE wording if needed
        return S.of(context).resultsPageAllPartiesTitle_ger25;
      case Election.NY:
        return S.of(context).resultsPageAllPartiesTitle_nyc25;
    }
  }

  String resultsPageAllCandidatesDescription(BuildContext context) {
    switch (this) {
      case Election.DE:
        return S.of(context).resultsPageAllPartiesDescription_ger25;
      case Election.EU:
        // EU flow doesn’t show “all parties” list; fall back to DE wording if needed
        return S.of(context).resultsPageAllPartiesDescription_ger25;
      case Election.NY:
        return S.of(context).resultsPageAllPartiesDescription_nyc25;
    }
  }

  String resultsPage7Disclaimer(BuildContext context) {
    switch (this) {
      case Election.DE:
        return S.of(context).resultsPage7Disclaimer_ger25;
      case Election.EU:
        return S.of(context).resultsPage7Disclaimer;
      case Election.NY:
        return S.of(context).resultsPage7Disclaimer_nyc25;
    }
  }

  String resultsPage7NoLocalCandidates(BuildContext context, String country) {
    switch (this) {
      case Election.DE:
        return S.of(context).resultsPage7NoLocalCandidates(country);
      case Election.EU:
        return S.of(context).resultsPage7NoLocalCandidates(country);
      case Election.NY:
        // NYC likely won’t use this, but fall back to generic string if needed
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
      case Election.NY:
        return S.of(context).resultsPage8_1Text_ny_25(
            topic); /*"When it's come to ${topic}, you are all-in for";*/
    }
  }

  String resultsPage8_2Text(BuildContext context) {
    switch (this) {
      case Election.DE:
        return S.of(context).resultsPage8_2Text_ger25;
      case Election.EU:
        return S.of(context).resultsPage8_2Text;
      case Election.NY:
        // return S.of(context).resultsPage8_2Text_nyc25;
        return S.of(context).attentionFutureMayor;
    }
  }

  String resultsPage8Help(BuildContext context) {
    switch (this) {
      case Election.DE:
        return S.of(context).resultsPage8Help_ger25;
      case Election.EU:
        return S.of(context).resultsPage8Help;
      case Election.NY:
        return S.of(context).resultsPage8Help_nyc25;
    }
  }

  String resultsPage9Help(BuildContext context) {
    switch (this) {
      case Election.DE:
        return S.of(context).resultsPage9Help_ger25;
      case Election.EU:
        return S.of(context).resultsPage9Help;
      case Election.NY:
        return S.of(context).resultsPage9Help_nyc25;
    }
  }

  String resultsPage9Text1(BuildContext context) {
    switch (this) {
      case Election.DE:
        return S.of(context).resultsPage9Text1_ger25;
      case Election.EU:
        return S.of(context).resultsPage9Text1;
      case Election.NY:
        return S.of(context).resultsPage9Text1_nyc25;
    }
  }

  String resultsPage9Text2(BuildContext context) {
    switch (this) {
      case Election.DE:
        return S.of(context).resultsPage9Text2_ger25;
      case Election.EU:
        return S.of(context).resultsPage9Text2;
      case Election.NY:
        return S.of(context).resultsPage9Text2_nyc25;
    }
  }

  String resultsPage10Title(BuildContext context) {
    switch (this) {
      case Election.DE:
        return S.of(context).resultsPage10Title_ger25;
      case Election.EU:
        return S.of(context).resultsPage10Title;
      case Election.NY:
        return S.of(context).resultsPage10Title_nyc25;
    }
  }

  String resultsPage10NopButton(BuildContext context) {
    switch (this) {
      case Election.DE:
        return S.of(context).resultsPage10NopButton_ger25;
      case Election.EU:
        return S.of(context).resultsPage10NopButton;
      case Election.NY:
        return S.of(context).resultsPage10NopButton_nyc25;
    }
  }

  String resultsPage10YesButton(BuildContext context) {
    switch (this) {
      case Election.DE:
        return S.of(context).resultsPage10YesButton_ger25;
      case Election.EU:
        return S.of(context).resultsPage10YesButton;
      case Election.NY:
        return S.of(context).yessss;
    }
  }

  String settingsPageTitleAssociation(BuildContext context) {
    switch (this) {
      case Election.DE:
        return S.of(context).settingsPageTitleAssociation_ger25;
      case Election.EU:
        return S.of(context).settingsPageTitleAssociation;
      case Election.NY:
        return S.of(context).settingsPageTitleAssociation_nyc25;
    }
  }

  String settingsPageTitlePartners(BuildContext context) {
    switch (this) {
      case Election.DE:
        return S.of(context).settingsPageTitlePartners_ger25;
      case Election.EU:
        return S.of(context).settingsPageTitlePartners;
      case Election.NY:
        return S.of(context).settingsPageTitlePartners_nyc25;
    }
  }

  String settingsPageTextPartners(BuildContext context) {
    switch (this) {
      case Election.DE:
        return S.of(context).settingsPageTextPartners_ger25;
      case Election.EU:
        return S.of(context).settingsPageTextPartners;
      case Election.NY:
        return S.of(context).settingsPageTextPartners_nyc25;
    }
  }

  String settingsPageSubtitle1(BuildContext context) {
    switch (this) {
      case Election.DE:
        return S.of(context).settingsPageSubtitle1_ger25;
      case Election.EU:
        return S.of(context).settingsPageSubtitle1;
      case Election.NY:
        return S.of(context).settingsPageSubtitle1_nyc25;
    }
  }

  String settingsPageSubtitle2(BuildContext context) {
    switch (this) {
      case Election.DE:
        return S.of(context).settingsPageSubtitle2_ger25;
      case Election.EU:
        return S.of(context).settingsPageSubtitle2;
      case Election.NY:
        return S.of(context).settingsPageSubtitle2_nyc25;
    }
  }

  String settingsPageSubtitle3(BuildContext context) {
    switch (this) {
      case Election.DE:
        return S.of(context).settingsPageSubtitle3_ger25;
      case Election.EU:
        return S.of(context).settingsPageSubtitle3;
      case Election.NY:
        return S.of(context).settingsPageSubtitle3_nyc25;
    }
  }

  String settingsPageSubtitle4(BuildContext context) {
    switch (this) {
      case Election.DE:
        return S.of(context).settingsPageSubtitle4_ger25;
      case Election.EU:
        return S.of(context).settingsPageSubtitle4;
      case Election.NY:
        return S.of(context).settingsPageSubtitle4_nyc25;
    }
  }

  String settingsPageSubtitle5(BuildContext context) {
    switch (this) {
      case Election.DE:
        return S.of(context).settingsPageSubtitle5_ger25;
      case Election.EU:
        return S.of(context).settingsPageSubtitle5;
      case Election.NY:
        return S.of(context).settingsPageSubtitle5_nyc25;
    }
  }

  String settingsPageShareText(BuildContext context) {
    switch (this) {
      case Election.DE:
        return S.of(context).settingsPageShareText_ger25;
      case Election.EU:
        return S.of(context).settingsPageShareText;
      case Election.NY:
        return S.of(context).settingsPageShareText_nyc25;
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
        // economy, social
        return ResultAxisTopic(x: 10, y: 11);
      case Election.EU:
        // topicEuIntegration, topicEuIntegration
        return ResultAxisTopic(x: 3, y: 2);
      case Election.NY:
        // Mirror DE mapping unless NYC-specific axes are defined
        return ResultAxisTopic(x: 5, y: 6);
    }
  }
}

extension ElectionResult5Topics on Election {
  List<int> get result5Topics {
    switch (this) {
      case Election.DE:
        // 9: Climate, 13: Migration, 12: EU Integration
        return [9, 13, 12];
      case Election.EU:
        // 4: Human & Social Rights, 5: Economic Intervention, 1: Environmental issues
        return [4, 5, 1];
      case Election.NY:
        return [4, 7, 8];
    }
  }
}

extension ElectionBackend on Election {
  int get backend {
    // return 1;
    switch (this) {
      case Election.EU:
        return 1;
      case Election.DE:
        return 2;
      case Election.NY:
        return 3;
    }
  }
}
