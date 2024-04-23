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
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
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
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Palumba EU`
  String get appName {
    return Intl.message(
      'Palumba EU',
      name: 'appName',
      desc: '',
      args: [],
    );
  }

  /// `Palumba`
  String get shortAppName {
    return Intl.message(
      'Palumba',
      name: 'shortAppName',
      desc: '',
      args: [],
    );
  }

  /// `Ok`
  String get ok {
    return Intl.message(
      'Ok',
      name: 'ok',
      desc: '',
      args: [],
    );
  }

  /// `Yes`
  String get yes {
    return Intl.message(
      'Yes',
      name: 'yes',
      desc: '',
      args: [],
    );
  }

  /// `No`
  String get no {
    return Intl.message(
      'No',
      name: 'no',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cancel {
    return Intl.message(
      'Cancel',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }

  /// `Continue`
  String get textContinue {
    return Intl.message(
      'Continue',
      name: 'textContinue',
      desc: '',
      args: [],
    );
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
    return Intl.message(
      'Skip',
      name: 'skip',
      desc: '',
      args: [],
    );
  }

  /// `Neutral`
  String get neutral {
    return Intl.message(
      'Neutral',
      name: 'neutral',
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
  String get entranceTitle {
    return Intl.message(
      'If this cute pigeon can’t help you vote in June, nothing will.',
      name: 'entranceTitle',
      desc: '',
      args: [],
    );
  }

  /// `{count} matches found in the last {time}h`
  String entranceMatchesFoundQuote(Object count, Object time) {
    return Intl.message(
      '$count matches found in the last ${time}h',
      name: 'entranceMatchesFoundQuote',
      desc: '',
      args: [count, time],
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
    return Intl.message(
      'Hungary',
      name: 'hungary',
      desc: '',
      args: [],
    );
  }

  /// `Denmark`
  String get denmark {
    return Intl.message(
      'Denmark',
      name: 'denmark',
      desc: '',
      args: [],
    );
  }

  /// `Germany`
  String get germany {
    return Intl.message(
      'Germany',
      name: 'germany',
      desc: '',
      args: [],
    );
  }

  /// `Spain`
  String get spain {
    return Intl.message(
      'Spain',
      name: 'spain',
      desc: '',
      args: [],
    );
  }

  /// `France`
  String get france {
    return Intl.message(
      'France',
      name: 'france',
      desc: '',
      args: [],
    );
  }

  /// `Poland`
  String get poland {
    return Intl.message(
      'Poland',
      name: 'poland',
      desc: '',
      args: [],
    );
  }

  /// `Romania`
  String get romania {
    return Intl.message(
      'Romania',
      name: 'romania',
      desc: '',
      args: [],
    );
  }

  /// `Sweden`
  String get sweden {
    return Intl.message(
      'Sweden',
      name: 'sweden',
      desc: '',
      args: [],
    );
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

  /// `Almost ready,\none last check...`
  String get loadingResultsPageTitle4 {
    return Intl.message(
      'Almost ready,\none last check...',
      name: 'loadingResultsPageTitle4',
      desc: '',
      args: [],
    );
  }

  /// `Almost ready,\none last check...`
  String get loadingResultsPageTitle5 {
    return Intl.message(
      'Almost ready,\none last check...',
      name: 'loadingResultsPageTitle5',
      desc: '',
      args: [],
    );
  }

  /// `We found you a match!`
  String get resultsPage1Title {
    return Intl.message(
      'We found you a match!',
      name: 'resultsPage1Title',
      desc: '',
      args: [],
    );
  }

  /// `In the next screens, you’ll discover your most compatible  Group at the EU Parliament, the matching Local lists to vote for in June in your country, and we even found a few extra things based on your answers  😌`
  String get resultsPage1Text {
    return Intl.message(
      'In the next screens, you’ll discover your most compatible  Group at the EU Parliament, the matching Local lists to vote for in June in your country, and we even found a few extra things based on your answers  😌',
      name: 'resultsPage1Text',
      desc: '',
      args: [],
    );
  }

  /// `😍❤️‍🔥💘`
  String get resultsLabelEmoji {
    return Intl.message(
      '😍❤️‍🔥💘',
      name: 'resultsLabelEmoji',
      desc: '',
      args: [],
    );
  }

  /// `Share`
  String get resultsShare {
    return Intl.message(
      'Share',
      name: 'resultsShare',
      desc: '',
      args: [],
    );
  }

  /// `and you, it’s really a Love Story (EU’s Version)`
  String get resultsPage2Title {
    return Intl.message(
      'and you, it’s really a Love Story (EU’s Version)',
      name: 'resultsPage2Title',
      desc: '',
      args: [],
    );
  }

  /// `You both agreed on `
  String get resultsPage2FirstText {
    return Intl.message(
      'You both agreed on ',
      name: 'resultsPage2FirstText',
      desc: '',
      args: [],
    );
  }

  /// `of all the statements you swiped on.`
  String get resultsPage2LastText {
    return Intl.message(
      'of all the statements you swiped on.',
      name: 'resultsPage2LastText',
      desc: '',
      args: [],
    );
  }

  /// `Your compatibility with the European Parliament Groups`
  String get resultsPage3Title {
    return Intl.message(
      'Your compatibility with the European Parliament Groups',
      name: 'resultsPage3Title',
      desc: '',
      args: [],
    );
  }

  /// `Okay, it’s cool knowing which group gets you...`
  String get resultsPage5Title {
    return Intl.message(
      'Okay, it’s cool knowing which group gets you...',
      name: 'resultsPage5Title',
      desc: '',
      args: [],
    );
  }

  /// `In the next screens, you’ll discover your most compatible  Group at the EU Parliament, the matching Local lists to vote for in June in your country, and we even found a few extra things based on your answers  😌`
  String get resultsPage5Text {
    return Intl.message(
      'In the next screens, you’ll discover your most compatible  Group at the EU Parliament, the matching Local lists to vote for in June in your country, and we even found a few extra things based on your answers  😌',
      name: 'resultsPage5Text',
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

  /// `But at the EU Elections, you vote for a local list`
  String get resultsPage6Title {
    return Intl.message(
      'But at the EU Elections, you vote for a local list',
      name: 'resultsPage6Title',
      desc: '',
      args: [],
    );
  }

  /// `In the next screens, you’ll discover your most compatible  Group at the EU Parliament, the matching Local lists to vote for in June in your country, and we even found a few extra things based on your answers  😌`
  String get resultsPage6Text {
    return Intl.message(
      'In the next screens, you’ll discover your most compatible  Group at the EU Parliament, the matching Local lists to vote for in June in your country, and we even found a few extra things based on your answers  😌',
      name: 'resultsPage6Text',
      desc: '',
      args: [],
    );
  }

  /// `These are the matching Local Candidate lists in your country `
  String get resultsPage7Title {
    return Intl.message(
      'These are the matching Local Candidate lists in your country ',
      name: 'resultsPage7Title',
      desc: '',
      args: [],
    );
  }

  /// `Disclaimer about the order of the lists / temp. localization`
  String get resultsPage7Disclaimer {
    return Intl.message(
      'Disclaimer about the order of the lists / temp. localization',
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

  /// `Would you like to receive a notification when it’s time to vote?`
  String get resultsPage8Title {
    return Intl.message(
      'Would you like to receive a notification when it’s time to vote?',
      name: 'resultsPage8Title',
      desc: '',
      args: [],
    );
  }

  /// `I'm all good!`
  String get resultsPage8NopButton {
    return Intl.message(
      'I\'m all good!',
      name: 'resultsPage8NopButton',
      desc: '',
      args: [],
    );
  }

  /// `Yesssss`
  String get resultsPage8YesButton {
    return Intl.message(
      'Yesssss',
      name: 'resultsPage8YesButton',
      desc: '',
      args: [],
    );
  }

  /// `Me and {party} agreed on {percentage}% of all the statements you swiped on. Find out your match at palumba.eu`
  String resultsSocialShareData(Object party, Object percentage) {
    return Intl.message(
      'Me and $party agreed on $percentage% of all the statements you swiped on. Find out your match at palumba.eu',
      name: 'resultsSocialShareData',
      desc: '',
      args: [party, percentage],
    );
  }

  /// `If this cute pigeon can’t helpyou vote in June, nothing will.`
  String get homePageTitle {
    return Intl.message(
      'If this cute pigeon can’t helpyou vote in June, nothing will.',
      name: 'homePageTitle',
      desc: '',
      args: [],
    );
  }

  /// `My results · Back to the test`
  String get homePageBackToResults {
    return Intl.message(
      'My results · Back to the test',
      name: 'homePageBackToResults',
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
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
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
