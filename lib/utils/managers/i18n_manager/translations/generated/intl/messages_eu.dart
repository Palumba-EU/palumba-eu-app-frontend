// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a eu locale. All the
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
  String get localeName => 'eu';

  static String m0(count) =>
      "${count} azken 24 orduetan aurkitutako \"match-ak\"";

  static String m1(count) => "${count} matches found in the last 24h";

  static String m2(country) =>
      "Finding matches with candidates lists in ${country}  🔍";

  static String m3(country) => "No local parties found in ${country}";

  static String m4(country, group) =>
      "The candidates in ${country} most aligned with ${group}";

  static String m5(topic, percentage) =>
      "On ${topic}, you’re ${percentage}% more into";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "alertServerErrorText": MessageLookupByLibrary.simpleMessage(
            "Zerbait gaizki joan da gure aldetik. Mesedez, saiatu berriro geroago."),
        "alertServerErrorTitle": MessageLookupByLibrary.simpleMessage("Ops!"),
        "appName": MessageLookupByLibrary.simpleMessage("Palumba EB"),
        "cancel": MessageLookupByLibrary.simpleMessage("Ezeztatu"),
        "denmark": MessageLookupByLibrary.simpleMessage("Danimarka"),
        "entranceMatchesFoundQuote": m0,
        "entranceStartButton":
            MessageLookupByLibrary.simpleMessage("Hasi Palumbarekin"),
        "entranceTitle1": MessageLookupByLibrary.simpleMessage(
            "Uso eder honek ezin badizu ekainean botoa ematen lagundu, ezerk ez dizu lagunduko."),
        "entranceTitle2": MessageLookupByLibrary.simpleMessage(
            "Inporta zaizun gaiak aukeratu."),
        "entranceTitle3": MessageLookupByLibrary.simpleMessage(
            "Ezagutu zure \"match-a\" eta jakin ezazu nori eman botoa hauteskundeetan."),
        "faq":
            MessageLookupByLibrary.simpleMessage("Maiz egiten diren galderak"),
        "france": MessageLookupByLibrary.simpleMessage("Frantzia"),
        "germany": MessageLookupByLibrary.simpleMessage("Alemania"),
        "homePageBackToTest":
            MessageLookupByLibrary.simpleMessage("Testera itzuli"),
        "homePageMatchesFoundQuote": m1,
        "homePageMyResults":
            MessageLookupByLibrary.simpleMessage("Nire emaitzak"),
        "homePageStartButton":
            MessageLookupByLibrary.simpleMessage("Test berri bat hasi"),
        "hungary": MessageLookupByLibrary.simpleMessage("Hungaria"),
        "languagePageSubtitle": MessageLookupByLibrary.simpleMessage(
            "Hau konfigurazioan alda daiteke."),
        "languagePageTitle":
            MessageLookupByLibrary.simpleMessage("Ingelesez? :)"),
        "loadingResultsPageTitle1": MessageLookupByLibrary.simpleMessage(
            "Zure emaitza pertsonalizatuak bidean dira :)"),
        "loadingResultsPageTitle2": MessageLookupByLibrary.simpleMessage(
            "Hau Taylor Swiften 👀 sarrerak lortzea baino azkarragoa izango da"),
        "loadingResultsPageTitle3": m2,
        "loadingResultsPageTitle4": MessageLookupByLibrary.simpleMessage(
            "Ia prest, azken errepasoa eta kito..."),
        "message_five_cards_left": MessageLookupByLibrary.simpleMessage(
            "5 galdera bakarrik gelditzen zaizkizu :)"),
        "message_half_test_done":
            MessageLookupByLibrary.simpleMessage("%50 egin duzu, animo!"),
        "neutral": MessageLookupByLibrary.simpleMessage("Neutrala"),
        "no": MessageLookupByLibrary.simpleMessage("Ez"),
        "ok": MessageLookupByLibrary.simpleMessage("Ok"),
        "onBoardingCardQuestion": MessageLookupByLibrary.simpleMessage(
            "Ez dakit nori eman botoa 2024ko Europako hauteskundeetan"),
        "onBoardingLastStepTitle": MessageLookupByLibrary.simpleMessage(
            "Hatza pasa zure adostasunaren arabera"),
        "onBoardingNotAnswerButton":
            MessageLookupByLibrary.simpleMessage("Ez esatea nahiago dut"),
        "onBoardingStep1Subtitle":
            MessageLookupByLibrary.simpleMessage("Ez dakit"),
        "onBoardingStep1Title":
            MessageLookupByLibrary.simpleMessage("Non bozkatuko duzu?"),
        "onBoardingStep2Title":
            MessageLookupByLibrary.simpleMessage("Nire adina"),
        "onBoardingStep3Option1":
            MessageLookupByLibrary.simpleMessage("Emakume"),
        "onBoardingStep3Option2": MessageLookupByLibrary.simpleMessage("Gizon"),
        "onBoardingStep3Option3":
            MessageLookupByLibrary.simpleMessage("Genero jariakorra"),
        "onBoardingStep3Option4":
            MessageLookupByLibrary.simpleMessage("Ez-binarioa"),
        "onBoardingStep3Option5": MessageLookupByLibrary.simpleMessage("Beste"),
        "onBoardingStep3Title":
            MessageLookupByLibrary.simpleMessage("Honela identifikatzen naiz"),
        "poland": MessageLookupByLibrary.simpleMessage("Polonia"),
        "resultsPage10NopButton":
            MessageLookupByLibrary.simpleMessage("Ez, eskerrk asko!"),
        "resultsPage10Title": MessageLookupByLibrary.simpleMessage(
            "Jakinarazpena bozkatzeko momentua iristean?"),
        "resultsPage10YesButton":
            MessageLookupByLibrary.simpleMessage("Baiiiiii"),
        "resultsPage1Button":
            MessageLookupByLibrary.simpleMessage("Sakatu jarraitzeko"),
        "resultsPage1Text": MessageLookupByLibrary.simpleMessage(
            "In the next screens, you’ll discover your most compatible  Group at the EU Parliament, the matching Local lists to vote for in June in your country, and we even found a few extra things based on your answers 😌"),
        "resultsPage1Title": MessageLookupByLibrary.simpleMessage(
            "Match bat eta askoz gehio 👉👈"),
        "resultsPage2_1Title":
            MessageLookupByLibrary.simpleMessage("Honestly, between the"),
        "resultsPage2_2Title": MessageLookupByLibrary.simpleMessage(
            "eta ni, maitasun-istorio moduko bat da (EB bertsioa)"),
        "resultsPage3Title": MessageLookupByLibrary.simpleMessage(
            "Zein hurbil nagoen Europako Parlamentuko taldeetatik"),
        "resultsPage4TitleBottom":
            MessageLookupByLibrary.simpleMessage("EBko integrazioaren kontra"),
        "resultsPage4TitleLeft":
            MessageLookupByLibrary.simpleMessage("Ezkerra"),
        "resultsPage4TitleRight":
            MessageLookupByLibrary.simpleMessage("Eskuina"),
        "resultsPage4TitleTop":
            MessageLookupByLibrary.simpleMessage("EBko integrazioaren alde"),
        "resultsPage4TitleUserHere":
            MessageLookupByLibrary.simpleMessage("Kaixo!!"),
        "resultsPage5Title": MessageLookupByLibrary.simpleMessage(
            "On more specific topics, which European Parliament Group am I closer to?"),
        "resultsPage5Topic1":
            MessageLookupByLibrary.simpleMessage("Ingurumen-gaiak"),
        "resultsPage5Topic2":
            MessageLookupByLibrary.simpleMessage("Giza eta Gizarte Eskubideak"),
        "resultsPage5Topic3":
            MessageLookupByLibrary.simpleMessage("Esku-hartze ekonomikoa"),
        "resultsPage6Text": MessageLookupByLibrary.simpleMessage(
            "In the next screens, you’ll discover the candidate lists in your country  that are most likely to join your match."),
        "resultsPage6_1Title": MessageLookupByLibrary.simpleMessage(
            "Ok, it\'s cool knowing which group gets me..."),
        "resultsPage6_2Title": MessageLookupByLibrary.simpleMessage(
            "But at the EU Elections, we vote for a local list"),
        "resultsPage7Disclaimer":
            MessageLookupByLibrary.simpleMessage("In no particular order."),
        "resultsPage7NoLocalCandidates": m3,
        "resultsPage7Title": m4,
        "resultsPage8Help": MessageLookupByLibrary.simpleMessage(
            "You are a climate change fighter! You believe that tackling the climate crisis requires collective action, with everyone making it a top priority. You do not mind the EU regulating companies to that end. After all, what use is economic growth if the planet becomes inhabitable?"),
        "resultsPage8_1Text": m5,
        "resultsPage8_2Text": MessageLookupByLibrary.simpleMessage(
            "Ekintza Klimatiko Aktiboa 🌱😌"),
        "resultsPage9Help":
            MessageLookupByLibrary.simpleMessage("Egin klik kartak nahasteko"),
        "resultsPage9Text1": MessageLookupByLibrary.simpleMessage(
            "Husteskundeek gai asko jorratzen dituzte"),
        "resultsPage9Text2": MessageLookupByLibrary.simpleMessage("Bat nator"),
        "resultsShare": MessageLookupByLibrary.simpleMessage("Partekatu"),
        "romania": MessageLookupByLibrary.simpleMessage("Errumania"),
        "settingsPagePrivacyPolicy":
            MessageLookupByLibrary.simpleMessage("Datuen babesa"),
        "settingsPageShareButtonText":
            MessageLookupByLibrary.simpleMessage("Partekatu"),
        "settingsPageShareText": MessageLookupByLibrary.simpleMessage(
            "If this cute pigeon can\'t help you vote in June, nothing will. I\'ve used the app and you should too:"),
        "settingsPageSubtitle1":
            MessageLookupByLibrary.simpleMessage("Babesle nagusiak"),
        "settingsPageSubtitle2":
            MessageLookupByLibrary.simpleMessage("Europako bazkideak"),
        "settingsPageSubtitle3":
            MessageLookupByLibrary.simpleMessage("Bazkide akdemikoa"),
        "settingsPageSubtitle4": MessageLookupByLibrary.simpleMessage(
            "Bazkide instituzional nazionalak"),
        "settingsPageSubtitle5":
            MessageLookupByLibrary.simpleMessage("Zerbitzu-hornitzaileak"),
        "settingsPageSubtitleLanguage": MessageLookupByLibrary.simpleMessage(
            "Nahiago dut aplikazio hau hemen erabili"),
        "settingsPageTextAbout": MessageLookupByLibrary.simpleMessage(
            "Palumba is not a company, not a political party, not a government. We’re an independent non-profit association of 120+ young people 🐦 from all over Europe who got together last summer and started crafting this app. We have one goal: helping you understand better how the European Elections work and which candidate lists could match your ideas, so you can vote more confidently for people who support your priorities. Our algorithm is open-source, the statements you swipe on were reviewed by political scientists, and your data is sooo encrypted that we have no way to ever identify you :)"),
        "settingsPageTextLanguage": MessageLookupByLibrary.simpleMessage(
            "Hikuntza aldatzeko egin klik"),
        "settingsPageTextPartners": MessageLookupByLibrary.simpleMessage(
            "Important to tell you that partners have no editorial power on the content of the app, which remains a non-partisan initiative with a clear goal: helping you understand who supports your opinions at the european and national levels."),
        "settingsPageTitleAbout":
            MessageLookupByLibrary.simpleMessage("Guri guruz"),
        "settingsPageTitleAssociation":
            MessageLookupByLibrary.simpleMessage("Elkartea"),
        "settingsPageTitleLanguage":
            MessageLookupByLibrary.simpleMessage("Hizkuntza"),
        "settingsPageTitlePartners":
            MessageLookupByLibrary.simpleMessage("Patners"),
        "shortAppName": MessageLookupByLibrary.simpleMessage("Palumba"),
        "skip": MessageLookupByLibrary.simpleMessage("Salto"),
        "spain": MessageLookupByLibrary.simpleMessage("Espainia"),
        "splashPageNoInternet": MessageLookupByLibrary.simpleMessage(
            "Badirudi ez duzula Interneteko konexiorik"),
        "sweden": MessageLookupByLibrary.simpleMessage("Suedia"),
        "textContinue": MessageLookupByLibrary.simpleMessage("Jarraitu"),
        "yes": MessageLookupByLibrary.simpleMessage("Bai")
      };
}
