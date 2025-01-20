enum LevelOfEducation {
  academic,
  highschool,
  elementary,
  vocational,
}

extension LevelOfEducationLocalization on LevelOfEducation {
  String get localized {
    switch (this) {
      case LevelOfEducation.academic:
        return 'Academic';
      case LevelOfEducation.highschool:
        return 'Highschool';
      case LevelOfEducation.elementary:
        return 'Elemtary school';
      case LevelOfEducation.vocational:
        return 'Vocational training';
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
      case LevelOfEducation.elementary:
        return '2';
      case LevelOfEducation.vocational:
        return '1';
    }
  }
}
