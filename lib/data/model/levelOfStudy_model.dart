import 'package:flutter/material.dart';
import 'package:palumba_eu/utils/managers/i18n_manager/translations/generated/l10n.dart';
 
enum LevelOfEducation {
  academic, // "Universitätsabschluss"
  highschool, // "Abitur"
  vocational, // "Berufsausbildung"
  secondary, // "Realschulabschluss"
  intermediate, // Mittlerer Schulabschluss
  none, // Ungebildet
  //+-------------------------+
  //| NYC Mayor Election 2025 |
  //+-------------------------+
  highschool_nyc,
  associates_nyc,
  bachelors_nyc,
  grad_school_nyc,
  other_nyc
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
      //+-------------------------+
      //| NYC Mayor Election 2025 |
      //+-------------------------+
      case LevelOfEducation.highschool_nyc:
        return S.of(context).LevelOfEducationHighSchool_nyc25;
      case LevelOfEducation.associates_nyc:
        return S.of(context).LevelOfEducationAssociates_nyc25;
      case LevelOfEducation.bachelors_nyc:
        return S.of(context).LevelOfEducationBachelors_nyc25;
      case LevelOfEducation.grad_school_nyc:
        return S.of(context).LevelOfEducationGradSchool_nyc25;
      case LevelOfEducation.other_nyc:
        return S.of(context).LevelOfEducationOther_nyc25;
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
      //+-------------------------+
      //| NYC Mayor Election 2025 |
      //+-------------------------+
      case LevelOfEducation.highschool_nyc:
        return '3';
      case LevelOfEducation.associates_nyc:
        return '5';
      case LevelOfEducation.bachelors_nyc:
        return '6';
      case LevelOfEducation.grad_school_nyc:
        return '7';
      case LevelOfEducation.other_nyc:
        return '-1';
    }
  }
}
