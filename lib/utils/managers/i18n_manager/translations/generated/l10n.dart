// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name =
        (locale.countryCode?.isEmpty ?? false)
            ? locale.languageCode
            : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Palumba EU`
  String get appName {
    return Intl.message('Palumba EU', name: 'appName', desc: '', args: []);
  }

  /// `Palumba`
  String get shortAppName {
    return Intl.message('Palumba', name: 'shortAppName', desc: '', args: []);
  }

  /// `Ok`
  String get ok {
    return Intl.message('Ok', name: 'ok', desc: '', args: []);
  }

  /// `Yes`
  String get yes {
    return Intl.message('Yes', name: 'yes', desc: '', args: []);
  }

  /// `No`
  String get no {
    return Intl.message('No', name: 'no', desc: '', args: []);
  }

  /// `Maybe`
  String get maybe {
    return Intl.message('Maybe', name: 'maybe', desc: '', args: []);
  }

  /// `Cancel`
  String get cancel {
    return Intl.message('Cancel', name: 'cancel', desc: '', args: []);
  }

  /// `Continue`
  String get textContinue {
    return Intl.message('Continue', name: 'textContinue', desc: '', args: []);
  }

  /// `Ops!`
  String get alertServerErrorTitle {
    return Intl.message(
      'Ops!',
      name: 'alertServerErrorTitle',
      desc: '',
      args: [],
    );
  }

  /// `Something has gone wrong on our side. Please try again later.`
  String get alertServerErrorText {
    return Intl.message(
      'Something has gone wrong on our side. Please try again later.',
      name: 'alertServerErrorText',
      desc: '',
      args: [],
    );
  }

  /// `Skip`
  String get skip {
    return Intl.message('Skip', name: 'skip', desc: '', args: []);
  }

  /// `Neutral`
  String get neutral {
    return Intl.message('Neutral', name: 'neutral', desc: '', args: []);
  }

  /// `FAQ`
  String get faq {
    return Intl.message('FAQ', name: 'faq', desc: '', args: []);
  }

  /// `Keep swiping, you're 50% done!`
  String get message_half_test_done {
    return Intl.message(
      'Keep swiping, you\'re 50% done!',
      name: 'message_half_test_done',
      desc: '',
      args: [],
    );
  }

  /// `Only 5 cards left to swipe :)`
  String get message_five_cards_left {
    return Intl.message(
      'Only 5 cards left to swipe :)',
      name: 'message_five_cards_left',
      desc: '',
      args: [],
    );
  }

  /// `It looks like you don't have internet connection`
  String get splashPageNoInternet {
    return Intl.message(
      'It looks like you don\'t have internet connection',
      name: 'splashPageNoInternet',
      desc: '',
      args: [],
    );
  }

  /// `Let’s continue in English? :)`
  String get languagePageTitle {
    return Intl.message(
      'Let’s continue in English? :)',
      name: 'languagePageTitle',
      desc: '',
      args: [],
    );
  }

  /// `This can be changed later in settings.`
  String get languagePageSubtitle {
    return Intl.message(
      'This can be changed later in settings.',
      name: 'languagePageSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `If this cute pigeon can’t help you vote in June, nothing will.`
  String get entranceTitle1 {
    return Intl.message(
      'If this cute pigeon can’t help you vote in June, nothing will.',
      name: 'entranceTitle1',
      desc: '',
      args: [],
    );
  }

  /// `Swipe your opinion on topics that matter to you.`
  String get entranceTitle2 {
    return Intl.message(
      'Swipe your opinion on topics that matter to you.',
      name: 'entranceTitle2',
      desc: '',
      args: [],
    );
  }

  /// `Find out your match and an orientation for who to vote for at the Elections.`
  String get entranceTitle3 {
    return Intl.message(
      'Find out your match and an orientation for who to vote for at the Elections.',
      name: 'entranceTitle3',
      desc: '',
      args: [],
    );
  }

  /// `{count} matches found in the last 24h`
  String entranceMatchesFoundQuote(Object count) {
    return Intl.message(
      '$count matches found in the last 24h',
      name: 'entranceMatchesFoundQuote',
      desc: '',
      args: [count],
    );
  }

  /// `Start Palumba`
  String get entranceStartButton {
    return Intl.message(
      'Start Palumba',
      name: 'entranceStartButton',
      desc: '',
      args: [],
    );
  }

  /// `Hungary`
  String get hungary {
    return Intl.message('Hungary', name: 'hungary', desc: '', args: []);
  }

  /// `Denmark`
  String get denmark {
    return Intl.message('Denmark', name: 'denmark', desc: '', args: []);
  }

  /// `Germany`
  String get germany {
    return Intl.message('Germany', name: 'germany', desc: '', args: []);
  }

  /// `Spain`
  String get spain {
    return Intl.message('Spain', name: 'spain', desc: '', args: []);
  }

  /// `France`
  String get france {
    return Intl.message('France', name: 'france', desc: '', args: []);
  }

  /// `Poland`
  String get poland {
    return Intl.message('Poland', name: 'poland', desc: '', args: []);
  }

  /// `Romania`
  String get romania {
    return Intl.message('Romania', name: 'romania', desc: '', args: []);
  }

  /// `Sweden`
  String get sweden {
    return Intl.message('Sweden', name: 'sweden', desc: '', args: []);
  }

  /// `Where will you vote?`
  String get onBoardingStep1Title {
    return Intl.message(
      'Where will you vote?',
      name: 'onBoardingStep1Title',
      desc: '',
      args: [],
    );
  }

  /// `I don't know`
  String get onBoardingStep1Subtitle {
    return Intl.message(
      'I don\'t know',
      name: 'onBoardingStep1Subtitle',
      desc: '',
      args: [],
    );
  }

  /// `My age`
  String get onBoardingStep2Title {
    return Intl.message(
      'My age',
      name: 'onBoardingStep2Title',
      desc: '',
      args: [],
    );
  }

  /// `I identify as`
  String get onBoardingStep3Title {
    return Intl.message(
      'I identify as',
      name: 'onBoardingStep3Title',
      desc: '',
      args: [],
    );
  }

  /// `Woman`
  String get onBoardingStep3Option1 {
    return Intl.message(
      'Woman',
      name: 'onBoardingStep3Option1',
      desc: '',
      args: [],
    );
  }

  /// `Man`
  String get onBoardingStep3Option2 {
    return Intl.message(
      'Man',
      name: 'onBoardingStep3Option2',
      desc: '',
      args: [],
    );
  }

  /// `Gender-fluid`
  String get onBoardingStep3Option3 {
    return Intl.message(
      'Gender-fluid',
      name: 'onBoardingStep3Option3',
      desc: '',
      args: [],
    );
  }

  /// `Non-binary`
  String get onBoardingStep3Option4 {
    return Intl.message(
      'Non-binary',
      name: 'onBoardingStep3Option4',
      desc: '',
      args: [],
    );
  }

  /// `Else`
  String get onBoardingStep3Option5 {
    return Intl.message(
      'Else',
      name: 'onBoardingStep3Option5',
      desc: '',
      args: [],
    );
  }

  /// `Prefer not to say`
  String get onBoardingNotAnswerButton {
    return Intl.message(
      'Prefer not to say',
      name: 'onBoardingNotAnswerButton',
      desc: '',
      args: [],
    );
  }

  /// `I have no clue who to vote for at the 2024 European Elections`
  String get onBoardingCardQuestion {
    return Intl.message(
      'I have no clue who to vote for at the 2024 European Elections',
      name: 'onBoardingCardQuestion',
      desc: '',
      args: [],
    );
  }

  /// `Swipe according to your agreement`
  String get onBoardingLastStepTitle {
    return Intl.message(
      'Swipe according to your agreement',
      name: 'onBoardingLastStepTitle',
      desc: '',
      args: [],
    );
  }

  /// `Your personalised results are on their way :)`
  String get loadingResultsPageTitle1 {
    return Intl.message(
      'Your personalised results are on their way :)',
      name: 'loadingResultsPageTitle1',
      desc: '',
      args: [],
    );
  }

  /// `This shall be quicker than getting Taylor Swift tickets 👀 `
  String get loadingResultsPageTitle2 {
    return Intl.message(
      'This shall be quicker than getting Taylor Swift tickets 👀 ',
      name: 'loadingResultsPageTitle2',
      desc: '',
      args: [],
    );
  }

  /// `Finding matches with candidates lists in {country}  🔍`
  String loadingResultsPageTitle3(Object country) {
    return Intl.message(
      'Finding matches with candidates lists in $country  🔍',
      name: 'loadingResultsPageTitle3',
      desc: '',
      args: [country],
    );
  }

  /// `Almost ready, one last check...`
  String get loadingResultsPageTitle4 {
    return Intl.message(
      'Almost ready, one last check...',
      name: 'loadingResultsPageTitle4',
      desc: '',
      args: [],
    );
  }

  /// `A match and much more 👉👈`
  String get resultsPage1Title {
    return Intl.message(
      'A match and much more 👉👈',
      name: 'resultsPage1Title',
      desc: '',
      args: [],
    );
  }

  /// `In the next screens, you’ll discover your most compatible  Group at the EU Parliament, the matching Local lists to vote for in June in your country, and we even found a few extra things based on your answers 😌`
  String get resultsPage1Text {
    return Intl.message(
      'In the next screens, you’ll discover your most compatible  Group at the EU Parliament, the matching Local lists to vote for in June in your country, and we even found a few extra things based on your answers 😌',
      name: 'resultsPage1Text',
      desc: '',
      args: [],
    );
  }

  /// `Press to continue`
  String get resultsPage1Button {
    return Intl.message(
      'Press to continue',
      name: 'resultsPage1Button',
      desc: '',
      args: [],
    );
  }

  /// `Honestly, between the`
  String get resultsPage2_1Title {
    return Intl.message(
      'Honestly, between the',
      name: 'resultsPage2_1Title',
      desc: '',
      args: [],
    );
  }

  /// `and me, it’s kind of a Love Story (EU’s Version)`
  String get resultsPage2_2Title {
    return Intl.message(
      'and me, it’s kind of a Love Story (EU’s Version)',
      name: 'resultsPage2_2Title',
      desc: '',
      args: [],
    );
  }

  /// `How close I am to European Parliament Groups`
  String get resultsPage3Title {
    return Intl.message(
      'How close I am to European Parliament Groups',
      name: 'resultsPage3Title',
      desc: '',
      args: [],
    );
  }

  /// `Pro-EU Integration`
  String get resultsPage4TitleTop {
    return Intl.message(
      'Pro-EU Integration',
      name: 'resultsPage4TitleTop',
      desc: '',
      args: [],
    );
  }

  /// `Anti-EU Integration`
  String get resultsPage4TitleBottom {
    return Intl.message(
      'Anti-EU Integration',
      name: 'resultsPage4TitleBottom',
      desc: '',
      args: [],
    );
  }

  /// `Left`
  String get resultsPage4TitleLeft {
    return Intl.message(
      'Left',
      name: 'resultsPage4TitleLeft',
      desc: '',
      args: [],
    );
  }

  /// `Right`
  String get resultsPage4TitleRight {
    return Intl.message(
      'Right',
      name: 'resultsPage4TitleRight',
      desc: '',
      args: [],
    );
  }

  /// `It’s me, hi!`
  String get resultsPage4TitleUserHere {
    return Intl.message(
      'It’s me, hi!',
      name: 'resultsPage4TitleUserHere',
      desc: '',
      args: [],
    );
  }

  /// `On more specific topics, which European Parliament Group am I closer to?`
  String get resultsPage5Title {
    return Intl.message(
      'On more specific topics, which European Parliament Group am I closer to?',
      name: 'resultsPage5Title',
      desc: '',
      args: [],
    );
  }

  /// `Environmental issues`
  String get resultsPage5Topic1 {
    return Intl.message(
      'Environmental issues',
      name: 'resultsPage5Topic1',
      desc: '',
      args: [],
    );
  }

  /// `Human & Social Rights`
  String get resultsPage5Topic2 {
    return Intl.message(
      'Human & Social Rights',
      name: 'resultsPage5Topic2',
      desc: '',
      args: [],
    );
  }

  /// `Economic intervention`
  String get resultsPage5Topic3 {
    return Intl.message(
      'Economic intervention',
      name: 'resultsPage5Topic3',
      desc: '',
      args: [],
    );
  }

  /// `Ok, it's cool knowing which group gets me...`
  String get resultsPage6_1Title {
    return Intl.message(
      'Ok, it\'s cool knowing which group gets me...',
      name: 'resultsPage6_1Title',
      desc: '',
      args: [],
    );
  }

  /// `But at the EU Elections, we vote for a local list`
  String get resultsPage6_2Title {
    return Intl.message(
      'But at the EU Elections, we vote for a local list',
      name: 'resultsPage6_2Title',
      desc: '',
      args: [],
    );
  }

  /// `In the next screens, you’ll discover the candidate lists in your country  that are most likely to join your match.`
  String get resultsPage6Text {
    return Intl.message(
      'In the next screens, you’ll discover the candidate lists in your country  that are most likely to join your match.',
      name: 'resultsPage6Text',
      desc: '',
      args: [],
    );
  }

  /// `The candidates in {country} most aligned with {group}`
  String resultsPage7Title(Object country, Object group) {
    return Intl.message(
      'The candidates in $country most aligned with $group',
      name: 'resultsPage7Title',
      desc: '',
      args: [country, group],
    );
  }

  /// `In no particular order.`
  String get resultsPage7Disclaimer {
    return Intl.message(
      'In no particular order.',
      name: 'resultsPage7Disclaimer',
      desc: '',
      args: [],
    );
  }

  /// `No local parties found in {country}`
  String resultsPage7NoLocalCandidates(Object country) {
    return Intl.message(
      'No local parties found in $country',
      name: 'resultsPage7NoLocalCandidates',
      desc: '',
      args: [country],
    );
  }

  /// `On {topic}, you’re {percentage}% more into`
  String resultsPage8_1Text(Object topic, Object percentage) {
    return Intl.message(
      'On $topic, you’re $percentage% more into',
      name: 'resultsPage8_1Text',
      desc: '',
      args: [topic, percentage],
    );
  }

  /// `Active Climate Action 🌱😌`
  String get resultsPage8_2Text {
    return Intl.message(
      'Active Climate Action 🌱😌',
      name: 'resultsPage8_2Text',
      desc: '',
      args: [],
    );
  }

  /// `You are a climate change fighter! You believe that tackling the climate crisis requires collective action, with everyone making it a top priority. You do not mind the EU regulating companies to that end. After all, what use is economic growth if the planet becomes inhabitable?`
  String get resultsPage8Help {
    return Intl.message(
      'You are a climate change fighter! You believe that tackling the climate crisis requires collective action, with everyone making it a top priority. You do not mind the EU regulating companies to that end. After all, what use is economic growth if the planet becomes inhabitable?',
      name: 'resultsPage8Help',
      desc: '',
      args: [],
    );
  }

  /// `Click on the cards to shuffle`
  String get resultsPage9Help {
    return Intl.message(
      'Click on the cards to shuffle',
      name: 'resultsPage9Help',
      desc: '',
      args: [],
    );
  }

  /// `Elections are about many topics, but there’s one thing that really`
  String get resultsPage9Text1 {
    return Intl.message(
      'Elections are about many topics, but there’s one thing that really',
      name: 'resultsPage9Text1',
      desc: '',
      args: [],
    );
  }

  /// `Belongs With Me 😌`
  String get resultsPage9Text2 {
    return Intl.message(
      'Belongs With Me 😌',
      name: 'resultsPage9Text2',
      desc: '',
      args: [],
    );
  }

  /// `A notification when it’s time to go vote?`
  String get resultsPage10Title {
    return Intl.message(
      'A notification when it’s time to go vote?',
      name: 'resultsPage10Title',
      desc: '',
      args: [],
    );
  }

  /// `No thanks!`
  String get resultsPage10NopButton {
    return Intl.message(
      'No thanks!',
      name: 'resultsPage10NopButton',
      desc: '',
      args: [],
    );
  }

  /// `Yesssss`
  String get resultsPage10YesButton {
    return Intl.message(
      'Yesssss',
      name: 'resultsPage10YesButton',
      desc: '',
      args: [],
    );
  }

  /// `Share`
  String get resultsShare {
    return Intl.message('Share', name: 'resultsShare', desc: '', args: []);
  }

  /// `{count} matches found in the last 24h`
  String homePageMatchesFoundQuote(Object count) {
    return Intl.message(
      '$count matches found in the last 24h',
      name: 'homePageMatchesFoundQuote',
      desc: '',
      args: [count],
    );
  }

  /// `Back to the test`
  String get homePageBackToTest {
    return Intl.message(
      'Back to the test',
      name: 'homePageBackToTest',
      desc: '',
      args: [],
    );
  }

  /// `My results`
  String get homePageMyResults {
    return Intl.message(
      'My results',
      name: 'homePageMyResults',
      desc: '',
      args: [],
    );
  }

  /// `Start a new test`
  String get homePageStartButton {
    return Intl.message(
      'Start a new test',
      name: 'homePageStartButton',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get settingsPageTitleLanguage {
    return Intl.message(
      'Language',
      name: 'settingsPageTitleLanguage',
      desc: '',
      args: [],
    );
  }

  /// `I prefer to use this app in`
  String get settingsPageSubtitleLanguage {
    return Intl.message(
      'I prefer to use this app in',
      name: 'settingsPageSubtitleLanguage',
      desc: '',
      args: [],
    );
  }

  /// `To change the language, click on the current one`
  String get settingsPageTextLanguage {
    return Intl.message(
      'To change the language, click on the current one',
      name: 'settingsPageTextLanguage',
      desc: '',
      args: [],
    );
  }

  /// `Election`
  String get settingsPageTitleElection {
    return Intl.message(
      'Election',
      name: 'settingsPageTitleElection',
      desc: '',
      args: [],
    );
  }

  /// `To change the questionnaire, click on the current one`
  String get settingsPageTextElection {
    return Intl.message(
      'To change the questionnaire, click on the current one',
      name: 'settingsPageTextElection',
      desc: '',
      args: [],
    );
  }

  /// `About`
  String get settingsPageTitleAbout {
    return Intl.message(
      'About',
      name: 'settingsPageTitleAbout',
      desc: '',
      args: [],
    );
  }

  /// `Palumba is not a company, not a political party, not a government. We’re an independent non-profit association of 120+ young people 🐦 from all over Europe who got together last summer and started crafting this app. We have one goal: helping you understand better how the European Elections work and which candidate lists could match your ideas, so you can vote more confidently for people who support your priorities. Our algorithm is open-source, the statements you swipe on were reviewed by political scientists, and your data is sooo encrypted that we have no way to ever identify you :)`
  String get settingsPageTextAbout {
    return Intl.message(
      'Palumba is not a company, not a political party, not a government. We’re an independent non-profit association of 120+ young people 🐦 from all over Europe who got together last summer and started crafting this app. We have one goal: helping you understand better how the European Elections work and which candidate lists could match your ideas, so you can vote more confidently for people who support your priorities. Our algorithm is open-source, the statements you swipe on were reviewed by political scientists, and your data is sooo encrypted that we have no way to ever identify you :)',
      name: 'settingsPageTextAbout',
      desc: '',
      args: [],
    );
  }

  /// `The association`
  String get settingsPageTitleAssociation {
    return Intl.message(
      'The association',
      name: 'settingsPageTitleAssociation',
      desc: '',
      args: [],
    );
  }

  /// `Partners`
  String get settingsPageTitlePartners {
    return Intl.message(
      'Partners',
      name: 'settingsPageTitlePartners',
      desc: '',
      args: [],
    );
  }

  /// `Important to tell you that partners have no editorial power on the content of the app, which remains a non-partisan initiative with a clear goal: helping you understand who supports your opinions at the european and national levels.`
  String get settingsPageTextPartners {
    return Intl.message(
      'Important to tell you that partners have no editorial power on the content of the app, which remains a non-partisan initiative with a clear goal: helping you understand who supports your opinions at the european and national levels.',
      name: 'settingsPageTextPartners',
      desc: '',
      args: [],
    );
  }

  /// `Main Sponsors`
  String get settingsPageSubtitle1 {
    return Intl.message(
      'Main Sponsors',
      name: 'settingsPageSubtitle1',
      desc: '',
      args: [],
    );
  }

  /// `European Partners`
  String get settingsPageSubtitle2 {
    return Intl.message(
      'European Partners',
      name: 'settingsPageSubtitle2',
      desc: '',
      args: [],
    );
  }

  /// `Academic Partner`
  String get settingsPageSubtitle3 {
    return Intl.message(
      'Academic Partner',
      name: 'settingsPageSubtitle3',
      desc: '',
      args: [],
    );
  }

  /// `National Institutional Partners`
  String get settingsPageSubtitle4 {
    return Intl.message(
      'National Institutional Partners',
      name: 'settingsPageSubtitle4',
      desc: '',
      args: [],
    );
  }

  /// `Service Providers`
  String get settingsPageSubtitle5 {
    return Intl.message(
      'Service Providers',
      name: 'settingsPageSubtitle5',
      desc: '',
      args: [],
    );
  }

  /// `Share`
  String get settingsPageShareButtonText {
    return Intl.message(
      'Share',
      name: 'settingsPageShareButtonText',
      desc: '',
      args: [],
    );
  }

  /// `Data Protection`
  String get settingsPagePrivacyPolicy {
    return Intl.message(
      'Data Protection',
      name: 'settingsPagePrivacyPolicy',
      desc: '',
      args: [],
    );
  }

  /// `If this cute pigeon can't help you vote in June, nothing will. I've used the app and you should too:`
  String get settingsPageShareText {
    return Intl.message(
      'If this cute pigeon can\'t help you vote in June, nothing will. I\'ve used the app and you should too:',
      name: 'settingsPageShareText',
      desc: '',
      args: [],
    );
  }

  /// `If this cute pigeon can’t help you vote in February, nothing will.`
  String get entranceTitle1_ger25 {
    return Intl.message(
      'If this cute pigeon can’t help you vote in February, nothing will.',
      name: 'entranceTitle1_ger25',
      desc: '-> entranceTitle1',
      args: [],
    );
  }

  /// `Swipe your opinion on topics that matter to you.`
  String get entranceTitle2_ger25 {
    return Intl.message(
      'Swipe your opinion on topics that matter to you.',
      name: 'entranceTitle2_ger25',
      desc: '-> entranceTitle2',
      args: [],
    );
  }

  /// `Find out your match and an orientation for who to vote for at the Elections.`
  String get entranceTitle3_ger25 {
    return Intl.message(
      'Find out your match and an orientation for who to vote for at the Elections.',
      name: 'entranceTitle3_ger25',
      desc: '-> entranceTitle3',
      args: [],
    );
  }

  /// `I have no clue who to vote for at the 2025 German Elections`
  String get onBoardingCardQuestion_ger25 {
    return Intl.message(
      'I have no clue who to vote for at the 2025 German Elections',
      name: 'onBoardingCardQuestion_ger25',
      desc: '-> onBoardingCardQuestion',
      args: [],
    );
  }

  /// `Your personal results are on their way :)`
  String get loadingResultsPageTitle1_ger25 {
    return Intl.message(
      'Your personal results are on their way :)',
      name: 'loadingResultsPageTitle1_ger25',
      desc: '-> loadingResultsPageTitle1',
      args: [],
    );
  }

  /// `This is going faster than the Deutsche Bahn`
  String get loadingResultsPageTitle2_ger25 {
    return Intl.message(
      'This is going faster than the Deutsche Bahn',
      name: 'loadingResultsPageTitle2_ger25',
      desc: '-> loadingResultsPageTitle2',
      args: [],
    );
  }

  /// `Hold on, it’s almost done - pinky promise, no layovers!`
  String get loadingResultsPageTitle3_ger25 {
    return Intl.message(
      'Hold on, it’s almost done - pinky promise, no layovers!',
      name: 'loadingResultsPageTitle3_ger25',
      desc: '-> loadingResultsPageTitle3',
      args: [],
    );
  }

  /// `Almost ready, one last check...`
  String get loadingResultsPageTitle4_ger25 {
    return Intl.message(
      'Almost ready, one last check...',
      name: 'loadingResultsPageTitle4_ger25',
      desc: '-> loadingResultsPageTitle4',
      args: [],
    );
  }

  /// `A match and much more`
  String get resultsPage1Title_ger25 {
    return Intl.message(
      'A match and much more',
      name: 'resultsPage1Title_ger25',
      desc: '-> resultsPage1Title',
      args: [],
    );
  }

  /// `In the next screens, you’ll discover which party is compatible with you. And we even found a few extra things based on your answers!`
  String get resultsPage1Text_ger25 {
    return Intl.message(
      'In the next screens, you’ll discover which party is compatible with you. And we even found a few extra things based on your answers!',
      name: 'resultsPage1Text_ger25',
      desc: '-> resultsPage1Text',
      args: [],
    );
  }

  /// `Honestly,`
  String get resultsPage2_1Title_ger25 {
    return Intl.message(
      'Honestly,',
      name: 'resultsPage2_1Title_ger25',
      desc: '-> resultsPage2_1Title',
      args: [],
    );
  }

  /// `and I, we are like Currywurst and fries`
  String get resultsPage2_2Title_ger25 {
    return Intl.message(
      'and I, we are like Currywurst and fries',
      name: 'resultsPage2_2Title_ger25',
      desc: '-> resultsPage2_2Title',
      args: [],
    );
  }

  /// `How close I am to the parties running in this German election`
  String get resultsPage3Title_ger25 {
    return Intl.message(
      'How close I am to the parties running in this German election',
      name: 'resultsPage3Title_ger25',
      desc: '-> resultsPage3Title',
      args: [],
    );
  }

  /// `Socially progressive`
  String get resultsPage4TitleTop_ger25 {
    return Intl.message(
      'Socially progressive',
      name: 'resultsPage4TitleTop_ger25',
      desc: '-> resultsPage4TitleTop',
      args: [],
    );
  }

  /// `Socially conservative`
  String get resultsPage4TitleBottom_ger25 {
    return Intl.message(
      'Socially conservative',
      name: 'resultsPage4TitleBottom_ger25',
      desc: '-> resultsPage4TitleBottom',
      args: [],
    );
  }

  /// `Economic intervention`
  String get resultsPage4TitleLeft_ger25 {
    return Intl.message(
      'Economic intervention',
      name: 'resultsPage4TitleLeft_ger25',
      desc: '-> resultsPage4TitleLeft',
      args: [],
    );
  }

  /// `Free market economics`
  String get resultsPage4TitleRight_ger25 {
    return Intl.message(
      'Free market economics',
      name: 'resultsPage4TitleRight_ger25',
      desc: '-> resultsPage4TitleRight',
      args: [],
    );
  }

  /// `It’s me, hi!`
  String get resultsPage4TitleUserHere_ger25 {
    return Intl.message(
      'It’s me, hi!',
      name: 'resultsPage4TitleUserHere_ger25',
      desc: '-> resultsPage4TitleUserHere',
      args: [],
    );
  }

  /// `On more specific topics, which parties am I closest to?`
  String get resultsPage5Title_ger25 {
    return Intl.message(
      'On more specific topics, which parties am I closest to?',
      name: 'resultsPage5Title_ger25',
      desc: 'resultsPage5Title',
      args: [],
    );
  }

  /// `Environmental issues`
  String get resultsPage5Topic1_ger25 {
    return Intl.message(
      'Environmental issues',
      name: 'resultsPage5Topic1_ger25',
      desc: '-> resultsPage5Topic1',
      args: [],
    );
  }

  /// `Economy`
  String get resultsPage5Topic2_ger25 {
    return Intl.message(
      'Economy',
      name: 'resultsPage5Topic2_ger25',
      desc: '-> resultsPage5Topic2',
      args: [],
    );
  }

  /// `Social values`
  String get resultsPage5Topic3_ger25 {
    return Intl.message(
      'Social values',
      name: 'resultsPage5Topic3_ger25',
      desc: '-> resultsPage5Topic3',
      args: [],
    );
  }

  /// `Okay, it is cool to know which party gets me…`
  String get resultsPage6_1Title_ger25 {
    return Intl.message(
      'Okay, it is cool to know which party gets me…',
      name: 'resultsPage6_1Title_ger25',
      desc: '-> resultsPage6_1Title',
      args: [],
    );
  }

  /// `But at the German election you also have the option to vote for a specific candidate`
  String get resultsPage6_2Title_ger25 {
    return Intl.message(
      'But at the German election you also have the option to vote for a specific candidate',
      name: 'resultsPage6_2Title_ger25',
      desc: 'resultsPage6_2Title',
      args: [],
    );
  }

  /// `Overwhelmed? No worries, we’ve thought of that! We have some options for you on the next slide!`
  String get resultsPage6Text_ger25 {
    return Intl.message(
      'Overwhelmed? No worries, we’ve thought of that! We have some options for you on the next slide!',
      name: 'resultsPage6Text_ger25',
      desc: '-> resultsPage6Text',
      args: [],
    );
  }

  /// `Your answers are in the top {number}% regarding {dimension}`
  String resultsPage8_1Text_ger25(Object number, Object dimension) {
    return Intl.message(
      'Your answers are in the top $number% regarding $dimension',
      name: 'resultsPage8_1Text_ger25',
      desc: '-> resultsPage8_1Text',
      args: [number, dimension],
    );
  }

  /// `Active Climate Action 🌱😌`
  String get resultsPage8_2Text_ger25 {
    return Intl.message(
      'Active Climate Action 🌱😌',
      name: 'resultsPage8_2Text_ger25',
      desc: '-> resultsPage8_2Text',
      args: [],
    );
  }

  /// `Click on the cards to shuffle`
  String get resultsPage9Help_ger25 {
    return Intl.message(
      'Click on the cards to shuffle',
      name: 'resultsPage9Help_ger25',
      desc: '-> resultsPage9Help',
      args: [],
    );
  }

  /// `Elections are about many topics, but there's one that suits you perfectly! It's almost as if it was`
  String get resultsPage9Text1_ger25 {
    return Intl.message(
      'Elections are about many topics, but there\'s one that suits you perfectly! It\'s almost as if it was',
      name: 'resultsPage9Text1_ger25',
      desc: '-> resultsPage9Text1',
      args: [],
    );
  }

  /// `A notification when it’s time to go vote?`
  String get resultsPage10Title_ger25 {
    return Intl.message(
      'A notification when it’s time to go vote?',
      name: 'resultsPage10Title_ger25',
      desc: '-> resultsPage10Title',
      args: [],
    );
  }

  /// `Yesss!`
  String get messageScreenYes_ger25 {
    return Intl.message(
      'Yesss!',
      name: 'messageScreenYes_ger25',
      desc: '-> messageScreenYes',
      args: [],
    );
  }

  /// `No, thanks!`
  String get messageScreenNo_ger25 {
    return Intl.message(
      'No, thanks!',
      name: 'messageScreenNo_ger25',
      desc: '-> messageScreenNo',
      args: [],
    );
  }

  /// `Level of Education`
  String get onBoardingStep4Title {
    return Intl.message(
      'Level of Education',
      name: 'onBoardingStep4Title',
      desc: '',
      args: [],
    );
  }

  /// `University degree`
  String get onBoardingStep4Option1_ger25 {
    return Intl.message(
      'University degree',
      name: 'onBoardingStep4Option1_ger25',
      desc: '-> onBoardingStep4Option1',
      args: [],
    );
  }

  /// `⁠High school diploma`
  String get onBoardingStep4Option2_ger25 {
    return Intl.message(
      '⁠High school diploma',
      name: 'onBoardingStep4Option2_ger25',
      desc: '-> onBoardingStep4Option2',
      args: [],
    );
  }

  /// `⁠Vocational training`
  String get onBoardingStep4Option3_ger25 {
    return Intl.message(
      '⁠Vocational training',
      name: 'onBoardingStep4Option3_ger25',
      desc: '-> onBoardingStep4Option3',
      args: [],
    );
  }

  /// `Middle school diploma`
  String get onBoardingStep4Option4_ger25 {
    return Intl.message(
      'Middle school diploma',
      name: 'onBoardingStep4Option4_ger25',
      desc: '-> onBoardingStep4Option4',
      args: [],
    );
  }

  /// `some middle school`
  String get onBoardingStep4Option5_ger25 {
    return Intl.message(
      'some middle school',
      name: 'onBoardingStep4Option5_ger25',
      desc: '-> onBoardingStep4Option5',
      args: [],
    );
  }

  /// `Other`
  String get onBoardingStep4Option6_ger25 {
    return Intl.message(
      'Other',
      name: 'onBoardingStep4Option6_ger25',
      desc: '-> onBoardingStep4Option6',
      args: [],
    );
  }

  /// `I identify as`
  String get onBoardingStep3Title_ger25 {
    return Intl.message(
      'I identify as',
      name: 'onBoardingStep3Title_ger25',
      desc: '-> onBoardingStep3Title',
      args: [],
    );
  }

  /// `Press to continue`
  String get resultsPage1Button_ger25 {
    return Intl.message(
      'Press to continue',
      name: 'resultsPage1Button_ger25',
      desc: '-> onBoardingLastStepTitle',
      args: [],
    );
  }

  /// `No thanks!`
  String get resultsPage10NopButton_ger25 {
    return Intl.message(
      'No thanks!',
      name: 'resultsPage10NopButton_ger25',
      desc: '-> resultsPage10NopButton',
      args: [],
    );
  }

  /// `Yesssss`
  String get resultsPage10YesButton_ger25 {
    return Intl.message(
      'Yesssss',
      name: 'resultsPage10YesButton_ger25',
      desc: '-> resultsPage10YesButton',
      args: [],
    );
  }

  /// `The association`
  String get settingsPageTitleAssociation_ger25 {
    return Intl.message(
      'The association',
      name: 'settingsPageTitleAssociation_ger25',
      desc: '-> settingsPageTitleAssociation',
      args: [],
    );
  }

  /// `Partners`
  String get settingsPageTitlePartners_ger25 {
    return Intl.message(
      'Partners',
      name: 'settingsPageTitlePartners_ger25',
      desc: '-> settingsPageTitlePartners',
      args: [],
    );
  }

  /// `Important to tell you that partners have no editorial power on the content of the app, which remains a non-partisan initiative with a clear goal: helping you understand who supports your opinions at the european and national levels.`
  String get settingsPageTextPartners_ger25 {
    return Intl.message(
      'Important to tell you that partners have no editorial power on the content of the app, which remains a non-partisan initiative with a clear goal: helping you understand who supports your opinions at the european and national levels.',
      name: 'settingsPageTextPartners_ger25',
      desc: '-> settingsPageTextPartners',
      args: [],
    );
  }

  /// `Main Sponsors`
  String get settingsPageSubtitle1_ger25 {
    return Intl.message(
      'Main Sponsors',
      name: 'settingsPageSubtitle1_ger25',
      desc: '-> settingsPageSubtitle1',
      args: [],
    );
  }

  /// `European Partners`
  String get settingsPageSubtitle2_ger25 {
    return Intl.message(
      'European Partners',
      name: 'settingsPageSubtitle2_ger25',
      desc: '-> settingsPageSubtitle2',
      args: [],
    );
  }

  /// `Academic Partners`
  String get settingsPageSubtitle3_ger25 {
    return Intl.message(
      'Academic Partners',
      name: 'settingsPageSubtitle3_ger25',
      desc: '-> settingsPageSubtitle3',
      args: [],
    );
  }

  /// `National Institutional Partners`
  String get settingsPageSubtitle4_ger25 {
    return Intl.message(
      'National Institutional Partners',
      name: 'settingsPageSubtitle4_ger25',
      desc: '-> settingsPageSubtitle4',
      args: [],
    );
  }

  /// `Service Providers`
  String get settingsPageSubtitle5_ger25 {
    return Intl.message(
      'Service Providers',
      name: 'settingsPageSubtitle5_ger25',
      desc: '-> settingsPageSubtitle5',
      args: [],
    );
  }

  /// `If this cute pigeon can't help you vote in February, nothing will. I've used the app and you should too:`
  String get settingsPageShareText_ger25 {
    return Intl.message(
      'If this cute pigeon can\'t help you vote in February, nothing will. I\'ve used the app and you should too:',
      name: 'settingsPageShareText_ger25',
      desc: '-> settingsPageShareText',
      args: [],
    );
  }

  /// `You are a climate change fighter! You believe that tackling the climate crisis requires collective action, with everyone making it a top priority. You do not mind the Germany regulating companies to that end. After all, what use is economic growth if the planet becomes inhabitable? #ClimateActionNow #PlanetFirst`
  String get resultsPage8Help_ger25 {
    return Intl.message(
      'You are a climate change fighter! You believe that tackling the climate crisis requires collective action, with everyone making it a top priority. You do not mind the Germany regulating companies to that end. After all, what use is economic growth if the planet becomes inhabitable? #ClimateActionNow #PlanetFirst',
      name: 'resultsPage8Help_ger25',
      desc: '-> resultsPage8Help',
      args: [],
    );
  }

  /// `EU integration`
  String get resultsPage5Topic4_ger25 {
    return Intl.message(
      'EU integration',
      name: 'resultsPage5Topic4_ger25',
      desc: '-> resultsPage5Topic3',
      args: [],
    );
  }

  /// `Migration`
  String get resultsPage5Topic5_ger25 {
    return Intl.message(
      'Migration',
      name: 'resultsPage5Topic5_ger25',
      desc: '-> resultsPage5Topic5_ger25',
      args: [],
    );
  }

  /// `* On this screen only candidates from the following parties can be displayed: CDU/CSU, SPD, Grüne, AfD, Linke, FDP, BSW.`
  String get resultsPage7Disclaimer_ger25 {
    return Intl.message(
      '* On this screen only candidates from the following parties can be displayed: CDU/CSU, SPD, Grüne, AfD, Linke, FDP, BSW.',
      name: 'resultsPage7Disclaimer_ger25',
      desc: '-> resultsPage7Title',
      args: [],
    );
  }

  /// `Here’s a young candidate from {party}* —shuffle to see more! They may not be on your ballot, but represent the future of their party!`
  String resultsPage7Title_ger25(Object party) {
    return Intl.message(
      'Here’s a young candidate from $party* —shuffle to see more! They may not be on your ballot, but represent the future of their party!',
      name: 'resultsPage7Title_ger25',
      desc: '-> resultsPage7Title',
      args: [party],
    );
  }

  /// `I adhere to the Data Protection Policy and the Terms to use the app`
  String get onBoardingDataProtection_ger25 {
    return Intl.message(
      'I adhere to the Data Protection Policy and the Terms to use the app',
      name: 'onBoardingDataProtection_ger25',
      desc: '',
      args: [],
    );
  }

  /// `Data Protection Policy`
  String get onBoardingDataProtectionLink_ger25 {
    return Intl.message(
      'Data Protection Policy',
      name: 'onBoardingDataProtectionLink_ger25',
      desc: '',
      args: [],
    );
  }

  /// `made for you!`
  String get resultsPage9Text2_ger25 {
    return Intl.message(
      'made for you!',
      name: 'resultsPage9Text2_ger25',
      desc: '-> resultsPage9Text2',
      args: [],
    );
  }

  /// `No results found`
  String get resultsPage2NoResults {
    return Intl.message(
      'No results found',
      name: 'resultsPage2NoResults',
      desc: '',
      args: [],
    );
  }

  /// `Get Ready, Voting Day is {date}`
  String resultsPage10VotingDay(Object date) {
    return Intl.message(
      'Get Ready, Voting Day is $date',
      name: 'resultsPage10VotingDay',
      desc: '',
      args: [date],
    );
  }

  /// `Are you going to vote?`
  String get resultsPage10VotingQuestion {
    return Intl.message(
      'Are you going to vote?',
      name: 'resultsPage10VotingQuestion',
      desc: '',
      args: [],
    );
  }

  /// `Notifications disabled`
  String get pushDeactivatedTitle {
    return Intl.message(
      'Notifications disabled',
      name: 'pushDeactivatedTitle',
      desc: '',
      args: [],
    );
  }

  /// `To be able to receive Push Notifcation enable them in the settings`
  String get pushDeactivatedText {
    return Intl.message(
      'To be able to receive Push Notifcation enable them in the settings',
      name: 'pushDeactivatedText',
      desc: '',
      args: [],
    );
  }

  /// `Close`
  String get pushDeactivatedCancel {
    return Intl.message(
      'Close',
      name: 'pushDeactivatedCancel',
      desc: '',
      args: [],
    );
  }

  /// `Open Settings`
  String get pushDeactivatedConfirm {
    return Intl.message(
      'Open Settings',
      name: 'pushDeactivatedConfirm',
      desc: '',
      args: [],
    );
  }

  /// `Shuffle my politcal love 🔀`
  String get resultsPageCandidatesShuffle {
    return Intl.message(
      'Shuffle my politcal love 🔀',
      name: 'resultsPageCandidatesShuffle',
      desc: '',
      args: [],
    );
  }

  /// `no local parties`
  String get resultsPageCandidatesNoParties {
    return Intl.message(
      'no local parties',
      name: 'resultsPageCandidatesNoParties',
      desc: '',
      args: [],
    );
  }

  /// `Choose an Election`
  String get electionPageTitle {
    return Intl.message(
      'Choose an Election',
      name: 'electionPageTitle',
      desc: '',
      args: [],
    );
  }

  /// ``
  String get electionPageSubtitle {
    return Intl.message('', name: 'electionPageSubtitle', desc: '', args: []);
  }

  /// `European Elections 2024 🇪🇺`
  String get electionEU {
    return Intl.message(
      'European Elections 2024 🇪🇺',
      name: 'electionEU',
      desc: '',
      args: [],
    );
  }

  /// `Bundestagswahl 2025 🇩🇪`
  String get electionDE {
    return Intl.message(
      'Bundestagswahl 2025 🇩🇪',
      name: 'electionDE',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'bg'),
      Locale.fromSubtags(languageCode: 'ca'),
      Locale.fromSubtags(languageCode: 'cs'),
      Locale.fromSubtags(languageCode: 'da'),
      Locale.fromSubtags(languageCode: 'de'),
      Locale.fromSubtags(languageCode: 'el'),
      Locale.fromSubtags(languageCode: 'es-ES'),
      Locale.fromSubtags(languageCode: 'et'),
      Locale.fromSubtags(languageCode: 'eu'),
      Locale.fromSubtags(languageCode: 'fi'),
      Locale.fromSubtags(languageCode: 'fr'),
      Locale.fromSubtags(languageCode: 'ga-IE'),
      Locale.fromSubtags(languageCode: 'hr'),
      Locale.fromSubtags(languageCode: 'hu'),
      Locale.fromSubtags(languageCode: 'it'),
      Locale.fromSubtags(languageCode: 'lb'),
      Locale.fromSubtags(languageCode: 'lt'),
      Locale.fromSubtags(languageCode: 'lv'),
      Locale.fromSubtags(languageCode: 'mt'),
      Locale.fromSubtags(languageCode: 'nl'),
      Locale.fromSubtags(languageCode: 'pl'),
      Locale.fromSubtags(languageCode: 'pt-PT'),
      Locale.fromSubtags(languageCode: 'ro'),
      Locale.fromSubtags(languageCode: 'sk'),
      Locale.fromSubtags(languageCode: 'sl'),
      Locale.fromSubtags(languageCode: 'sv-SE'),
      Locale.fromSubtags(languageCode: 'tr'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
