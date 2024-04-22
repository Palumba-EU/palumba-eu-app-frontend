// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  static String m0(count, time) =>
      "${count} matches found in the last ${time}h";

  static String m1(country) =>
      "Finding matches with candidates lists in ${country}  🔍";

  static String m2(country) => "No local parties found in ${country}";

  static String m3(party, percentage) =>
      "Me and ${party} agreed on ${percentage}% of all the statements you swiped on. Find out your match at palumba.eu";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "alertServerErrorText": MessageLookupByLibrary.simpleMessage(
            "Something has gone wrong on our side. Please try again later."),
        "alertServerErrorTitle": MessageLookupByLibrary.simpleMessage("Ops!"),
        "appName": MessageLookupByLibrary.simpleMessage("Palumba EU"),
        "cancel": MessageLookupByLibrary.simpleMessage("Cancel"),
        "denmark": MessageLookupByLibrary.simpleMessage("Denmark"),
        "entranceMatchesFoundQuote": m0,
        "entranceStartButton":
            MessageLookupByLibrary.simpleMessage("Start Palumba"),
        "entranceTitle": MessageLookupByLibrary.simpleMessage(
            "If this cute pigeon can’t help you vote in June, nothing will."),
        "france": MessageLookupByLibrary.simpleMessage("France"),
        "germany": MessageLookupByLibrary.simpleMessage("Germany"),
        "homePageBackToResults": MessageLookupByLibrary.simpleMessage(
            "My results · Back to the test"),
        "homePageStartButton":
            MessageLookupByLibrary.simpleMessage("Start a new test"),
        "homePageTitle": MessageLookupByLibrary.simpleMessage(
            "If this cute pigeon can’t helpyou vote in June, nothing will."),
        "hungary": MessageLookupByLibrary.simpleMessage("Hungary"),
        "languagePageSubtitle": MessageLookupByLibrary.simpleMessage(
            "This can be changed later in settings."),
        "languagePageTitle": MessageLookupByLibrary.simpleMessage(
            "Let’s continue in English? :)"),
        "loadingResultsPageTitle1": MessageLookupByLibrary.simpleMessage(
            "Your personalised results are on their way :)"),
        "loadingResultsPageTitle2": MessageLookupByLibrary.simpleMessage(
            "This shall be quicker than getting Taylor Swift tickets 👀 "),
        "loadingResultsPageTitle3": m1,
        "loadingResultsPageTitle4": MessageLookupByLibrary.simpleMessage(
            "Almost ready,\none last check..."),
        "loadingResultsPageTitle5": MessageLookupByLibrary.simpleMessage(
            "Almost ready,\none last check..."),
        "neutral": MessageLookupByLibrary.simpleMessage("Neutral"),
        "no": MessageLookupByLibrary.simpleMessage("No"),
        "ok": MessageLookupByLibrary.simpleMessage("Ok"),
        "onBoardingCardQuestion": MessageLookupByLibrary.simpleMessage(
            "I have no clue who to vote for at the 2024 European Elections"),
        "onBoardingNotAnswerButton":
            MessageLookupByLibrary.simpleMessage("Prefer not to say"),
        "onBoardingStep1Subtitle":
            MessageLookupByLibrary.simpleMessage("I don\'t know"),
        "onBoardingStep1Title":
            MessageLookupByLibrary.simpleMessage("Where will you vote?"),
        "onBoardingStep2Title": MessageLookupByLibrary.simpleMessage("My age"),
        "onBoardingStep3Option1": MessageLookupByLibrary.simpleMessage("Woman"),
        "onBoardingStep3Option2": MessageLookupByLibrary.simpleMessage("Man"),
        "onBoardingStep3Option3":
            MessageLookupByLibrary.simpleMessage("Gender-fluid"),
        "onBoardingStep3Option4":
            MessageLookupByLibrary.simpleMessage("Non-binary"),
        "onBoardingStep3Option5": MessageLookupByLibrary.simpleMessage("Else"),
        "onBoardingStep3Title":
            MessageLookupByLibrary.simpleMessage("I identify as"),
        "poland": MessageLookupByLibrary.simpleMessage("Poland"),
        "resultsLabelEmoji": MessageLookupByLibrary.simpleMessage("😍❤️‍🔥💘"),
        "resultsPage1Text": MessageLookupByLibrary.simpleMessage(
            "In the next screens, you’ll discover your most compatible  Group at the EU Parliament, the matching Local lists to vote for in June in your country, and we even found a few extra things based on your answers  😌"),
        "resultsPage1Title":
            MessageLookupByLibrary.simpleMessage("We found you a match!"),
        "resultsPage2FirstText":
            MessageLookupByLibrary.simpleMessage("You both agreed on "),
        "resultsPage2LastText": MessageLookupByLibrary.simpleMessage(
            "of all the statements you swiped on."),
        "resultsPage2Title": MessageLookupByLibrary.simpleMessage(
            "and you, it’s really a Love Story (EU’s Version)"),
        "resultsPage3Title": MessageLookupByLibrary.simpleMessage(
            "Your compatibility with the European Parliament Groups"),
        "resultsPage4Text": MessageLookupByLibrary.simpleMessage(
            "In the next screens, you’ll discover your most compatible  Group at the EU Parliament, the matching Local lists to vote for in June in your country, and we even found a few extra things based on your answers  😌"),
        "resultsPage4Title": MessageLookupByLibrary.simpleMessage(
            "Okay, it’s cool knowing which group gets you..."),
        "resultsPage5Text": MessageLookupByLibrary.simpleMessage(
            "In the next screens, you’ll discover your most compatible  Group at the EU Parliament, the matching Local lists to vote for in June in your country, and we even found a few extra things based on your answers  😌"),
        "resultsPage5Title": MessageLookupByLibrary.simpleMessage(
            "But at the EU Elections, you vote for a local list"),
        "resultsPage6Disclaimer": MessageLookupByLibrary.simpleMessage(
            "Disclaimer about the order of the lists / temp. localization"),
        "resultsPage6NoLocalCandidates": m2,
        "resultsPage6Title": MessageLookupByLibrary.simpleMessage(
            "These are the matching Local Candidate lists in your country "),
        "resultsPage7NopButton":
            MessageLookupByLibrary.simpleMessage("I\'m all good!"),
        "resultsPage7Title": MessageLookupByLibrary.simpleMessage(
            "Would you like to receive a notification when it’s time to vote?"),
        "resultsPage7YesButton":
            MessageLookupByLibrary.simpleMessage("Yesssss"),
        "resultsShare": MessageLookupByLibrary.simpleMessage("Share"),
        "resultsSocialShareData": m3,
        "romania": MessageLookupByLibrary.simpleMessage("Romania"),
        "shortAppName": MessageLookupByLibrary.simpleMessage("Palumba"),
        "skip": MessageLookupByLibrary.simpleMessage("Skip"),
        "spain": MessageLookupByLibrary.simpleMessage("Spain"),
        "sweden": MessageLookupByLibrary.simpleMessage("Sweden"),
        "textContinue": MessageLookupByLibrary.simpleMessage("Continue"),
        "yes": MessageLookupByLibrary.simpleMessage("Yes")
      };
}
