import 'package:flutter/material.dart';
import 'package:palumba_eu/utils/managers/i18n_manager/translations/generated/l10n.dart';

enum LevelOfEducation {
  academic, // "Universitätsabschluss"
  highschool, // "Abitur"
  vocational, // "Berufsausbildung"
  secondary, // "Realschulabschluss"
  intermediate, // Mittlerer Schulabschluss
  none, // Ungebildet
}

extension LevelOfEducationLocalization on LevelOfEducation {
  String localized(BuildContext context) {
    switch (this) {
      case LevelOfEducation.academic:
        return S.of(context).onBoardingStep4Option1_ger25;
      case LevelOfEducation.highschool:
        return S.of(context).onBoardingStep4Option2_ger25;
      case LevelOfEducation.intermediate:
        return S.of(context).onBoardingStep4Option5_ger25;
      case LevelOfEducation.vocational:
        return S.of(context).onBoardingStep4Option3_ger25;
      case LevelOfEducation.secondary:
        return S.of(context).onBoardingStep4Option4_ger25;
      case LevelOfEducation.none:
        return S.of(context).onBoardingStep4Option6_ger25;
    }
  }
}

// The level of education according to the International Standard
// Classification of Education (ISCED).
// 0: No formal education
// 1: Primary education
// 2: Lower secondary education
// 3: Upper secondary education
// 4: Post-secondary non-tertiary education
// 5: Short-cycle tertiary education
// 6: Bachelors or equivalent
// 7: Masters or equivalent
// 8: Doctorate or equivalent

// TODO: what to map?
extension LevelOfEducationBackend on LevelOfEducation {
  String get backend {
    switch (this) {
      case LevelOfEducation.academic:
        return '6';
      case LevelOfEducation.highschool:
        return '3';
      case LevelOfEducation.vocational:
        return '4';
      case LevelOfEducation.intermediate:
        return '2';
      case LevelOfEducation.secondary:
        return '2';
      case LevelOfEducation.none:
        return '0';
    }
  }
}
