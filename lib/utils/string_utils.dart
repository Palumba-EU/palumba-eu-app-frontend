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
  static String privacyStatementUrl =
      'https://www.palumba.eu/de/data-protection';
  static String webUrl = 'https://palumba.eu';
  static String faqUrl = 'https://www.palumba.eu/faq';
  static String whoIsOnTheBallotUrl = 'http://www.whoisontheballot.org';
  static String rickrollUrl =
      'https://open.spotify.com/track/4PTG3Z6ehGkBFwjybzWkR8';
  //Contact
  static String contactEmail = 'app@palumba.org';
  static String contactEmailUrl = 'mailto:$contactEmail';
}
