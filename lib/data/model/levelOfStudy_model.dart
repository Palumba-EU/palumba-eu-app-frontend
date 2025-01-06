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
