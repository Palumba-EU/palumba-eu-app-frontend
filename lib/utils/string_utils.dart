class StringUtils {
  static const String fromOnboardingKey = 'fromOnboarding';
  static const String statementsDataKey = 'statementsData';
  static const String resultsDataKey = 'resultsData';
  static String electionsUrl(String langCode) =>
      'https://elections.europa.eu/$langCode/use-your-vote/';
}
