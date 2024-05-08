class StringUtils {
  //Keys
  static const String fromOnboardingKey = 'fromOnboarding';
  static const String answersDataKey = 'answersData';
  static const String resultsDataKey = 'resultsData';
  static const String fromResultsKey = 'fromResults';
  //Urls
  static String electionsUrl(String langCode) =>
      'https://elections.europa.eu/$langCode/use-your-vote/';
  static String organizationUrl = 'https://palumba.org/';
  static String privacyStatementUrl = 'https://palumba.org/privacy-statement/';
  static String webUrl = 'https://palumba.eu';
  static String faqUrl = 'https://www.palumba.eu/faq';
  static String rickrollUrl = 'https://www.youtube.com/watch?v=dQw4w9WgXcQg';
  //Contact
  static String contactEmail = 'app@palumba.eu';
  static String contactEmailUrl = 'mailto:$contactEmail';
}
