class StringUtils {
  static const String fromOnboardingKey = 'fromOnboarding';
  static const String resultsDataKey = 'resultsData';
  static String electionsUrl(String langCode) =>
      'https://elections.europa.eu/$langCode/use-your-vote/';
  static String contactEmail = 'hello@palumba.eu';
  static String contactEmailUrl = 'mailto:$contactEmail';
  static String organizationUrl = 'https://palumba.org/';
  static String faqUrl = 'https://www.palumba.eu/';
  static String privacyStatementUrl = 'https://palumba.org/privacy-statement/';
}
