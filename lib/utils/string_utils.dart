class StringUtils {
  static const String fromOnboardingKey = 'fromOnboarding';
  static const String answersDataKey = 'answersData';
  static const String resultsDataKey = 'resultsData';
  static String electionsUrl(String langCode) =>
      'https://elections.europa.eu/$langCode/use-your-vote/';
  static String contactEmail = 'hello@palumba.eu';
  static String contactEmailUrl = 'mailto:$contactEmail';
  static String organizationUrl = 'https://palumba.org/';
  static String privacyStatementUrl = 'https://palumba.org/privacy-statement/';
  static String webUrl = 'https://palumba.eu';
  static String faqUrl = 'https://www.palumba.eu/faq';
}
