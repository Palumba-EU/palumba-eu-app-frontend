// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a sv_SE locale. All the
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
  String get localeName => 'sv_SE';

  static String m0(count) => "${count} matcher hittade de senaste 24 timmarna";

  static String m1(count) => "${count} matcher hittade de senaste 24 timmarna";

  static String m2(country) =>
      "Hittar matcher med kandidatlistor i ${country}🔍";

  static String m3(country) => "Inga lokala partier hittades i ${country}";

  static String m4(country, group) =>
      "Kandidaterna i ${country} mest i linje med ${group}";

  static String m5(party) =>
      "Here’s a young candidate from ${party}* —shuffle to see more! They may not be on your ballot, but represent the future of their party!";

  static String m6(topic, percentage) =>
      "Angående ${topic}, är du ${percentage}% mer för";

  static String m7(number, dimension) =>
      "Your answers are in the top ${number}% regarding ${dimension}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "alertServerErrorText": MessageLookupByLibrary.simpleMessage(
      "Ett fel har uppstått från vårt håll. Vänligen försök igen senare.",
    ),
    "alertServerErrorTitle": MessageLookupByLibrary.simpleMessage("Oj!"),
    "appName": MessageLookupByLibrary.simpleMessage("Palumba EU"),
    "cancel": MessageLookupByLibrary.simpleMessage("Avbryt"),
    "denmark": MessageLookupByLibrary.simpleMessage("Danmark"),
    "entranceMatchesFoundQuote": m0,
    "entranceStartButton": MessageLookupByLibrary.simpleMessage(
      "Starta Palumba",
    ),
    "entranceTitle1": MessageLookupByLibrary.simpleMessage(
      "Om denna söta duva inte kan hjälpa dig att rösta i juni, kan inget.",
    ),
    "entranceTitle1_ger25": MessageLookupByLibrary.simpleMessage(
      "If this cute pigeon can’t help you vote in February, nothing will.",
    ),
    "entranceTitle2": MessageLookupByLibrary.simpleMessage(
      "Svajpa din åsikt om frågor som är viktiga för dig.",
    ),
    "entranceTitle2_ger25": MessageLookupByLibrary.simpleMessage(
      "Swipe your opinion on topics that matter to you.",
    ),
    "entranceTitle3": MessageLookupByLibrary.simpleMessage(
      "Hitta din match och en orientering för vilka du kan rösta på vid valet.",
    ),
    "entranceTitle3_ger25": MessageLookupByLibrary.simpleMessage(
      "Find out your match and an orientation for who to vote for at the Elections.",
    ),
    "faq": MessageLookupByLibrary.simpleMessage("Vanliga frågor (FAQ)"),
    "france": MessageLookupByLibrary.simpleMessage("Frankrike"),
    "germany": MessageLookupByLibrary.simpleMessage("Tyskland"),
    "homePageBackToTest": MessageLookupByLibrary.simpleMessage(
      "Tillbaka till testet",
    ),
    "homePageMatchesFoundQuote": m1,
    "homePageMyResults": MessageLookupByLibrary.simpleMessage("Mina resultat"),
    "homePageStartButton": MessageLookupByLibrary.simpleMessage(
      "Starta ett nytt test",
    ),
    "hungary": MessageLookupByLibrary.simpleMessage("Ungern"),
    "languagePageSubtitle": MessageLookupByLibrary.simpleMessage(
      "Detta kan ändras senare i inställningar.",
    ),
    "languagePageTitle": MessageLookupByLibrary.simpleMessage(
      "Fortsätt på svenska? :)",
    ),
    "loadingResultsPageTitle1": MessageLookupByLibrary.simpleMessage(
      "Dina personliga resultat är på väg :)",
    ),
    "loadingResultsPageTitle1_ger25": MessageLookupByLibrary.simpleMessage(
      "Your personal results are on their way :)",
    ),
    "loadingResultsPageTitle2": MessageLookupByLibrary.simpleMessage(
      "Detta kommer gå fortare än att skaffa biljetter till Taylor Swift 👀 ",
    ),
    "loadingResultsPageTitle2_ger25": MessageLookupByLibrary.simpleMessage(
      "This is going faster than the Deutsche Bahn",
    ),
    "loadingResultsPageTitle3": m2,
    "loadingResultsPageTitle3_ger25": MessageLookupByLibrary.simpleMessage(
      "Hold on, it’s almost done - pinky promise, no layovers!",
    ),
    "loadingResultsPageTitle4": MessageLookupByLibrary.simpleMessage(
      "Nästan klart, en sista kontroll...",
    ),
    "loadingResultsPageTitle4_ger25": MessageLookupByLibrary.simpleMessage(
      "Almost ready, one last check...",
    ),
    "messageScreenNo_ger25": MessageLookupByLibrary.simpleMessage(
      "No, thanks!",
    ),
    "messageScreenYes_ger25": MessageLookupByLibrary.simpleMessage("Yesss!"),
    "message_five_cards_left": MessageLookupByLibrary.simpleMessage(
      "Bara 5 kort kvar att svajpa :)",
    ),
    "message_half_test_done": MessageLookupByLibrary.simpleMessage(
      "Fortsätt svajpa, du är halvvägs klar!",
    ),
    "neutral": MessageLookupByLibrary.simpleMessage("Neutral"),
    "no": MessageLookupByLibrary.simpleMessage("Nej"),
    "ok": MessageLookupByLibrary.simpleMessage("Ok"),
    "onBoardingCardQuestion": MessageLookupByLibrary.simpleMessage(
      "Jag har ingen aning om vem jag ska rösta på vid valet till Europaparlamentet 2024",
    ),
    "onBoardingCardQuestion_ger25": MessageLookupByLibrary.simpleMessage(
      "I have no clue who to vote for at the 2025 German Elections",
    ),
    "onBoardingDataProtectionLink_ger25": MessageLookupByLibrary.simpleMessage(
      "Data Protection Policy",
    ),
    "onBoardingDataProtection_ger25": MessageLookupByLibrary.simpleMessage(
      "I adhere to the Data Protection Policy and the Terms to use the app",
    ),
    "onBoardingLastStepTitle": MessageLookupByLibrary.simpleMessage(
      "Svajpa enligt hur mycket du instämmer",
    ),
    "onBoardingNotAnswerButton": MessageLookupByLibrary.simpleMessage(
      "Föredrar att inte säga",
    ),
    "onBoardingStep1Subtitle": MessageLookupByLibrary.simpleMessage(
      "Jag vet inte",
    ),
    "onBoardingStep1Title": MessageLookupByLibrary.simpleMessage(
      "Var kommer du rösta?",
    ),
    "onBoardingStep2Title": MessageLookupByLibrary.simpleMessage("Min ålder"),
    "onBoardingStep3Option1": MessageLookupByLibrary.simpleMessage("Kvinna"),
    "onBoardingStep3Option2": MessageLookupByLibrary.simpleMessage("Man"),
    "onBoardingStep3Option3": MessageLookupByLibrary.simpleMessage(
      "Gender-fluid",
    ),
    "onBoardingStep3Option4": MessageLookupByLibrary.simpleMessage("Ickebinär"),
    "onBoardingStep3Option5": MessageLookupByLibrary.simpleMessage("Annat"),
    "onBoardingStep3Title": MessageLookupByLibrary.simpleMessage(
      "Jag identifierar som",
    ),
    "onBoardingStep3Title_ger25": MessageLookupByLibrary.simpleMessage(
      "I identify as",
    ),
    "onBoardingStep4Option1_ger25": MessageLookupByLibrary.simpleMessage(
      "University degree",
    ),
    "onBoardingStep4Option2_ger25": MessageLookupByLibrary.simpleMessage(
      "⁠High school diploma",
    ),
    "onBoardingStep4Option3_ger25": MessageLookupByLibrary.simpleMessage(
      "⁠Vocational training",
    ),
    "onBoardingStep4Option4_ger25": MessageLookupByLibrary.simpleMessage(
      "⁠Secondary school diploma (Realschulabschluss)",
    ),
    "onBoardingStep4Option5_ger25": MessageLookupByLibrary.simpleMessage(
      "⁠Intermediate school diploma (MSA)",
    ),
    "onBoardingStep4Option6_ger25": MessageLookupByLibrary.simpleMessage(
      "Other",
    ),
    "poland": MessageLookupByLibrary.simpleMessage("Polen"),
    "resultsPage10NopButton": MessageLookupByLibrary.simpleMessage("Nej tack!"),
    "resultsPage10NopButton_ger25": MessageLookupByLibrary.simpleMessage(
      "No thanks!",
    ),
    "resultsPage10Title": MessageLookupByLibrary.simpleMessage(
      "En notifikation när det är dags att rösta?",
    ),
    "resultsPage10Title_ger25": MessageLookupByLibrary.simpleMessage(
      "A notification when it’s time to go vote?",
    ),
    "resultsPage10YesButton": MessageLookupByLibrary.simpleMessage("Jaaaaaa"),
    "resultsPage10YesButton_ger25": MessageLookupByLibrary.simpleMessage(
      "Yesssss",
    ),
    "resultsPage1Button": MessageLookupByLibrary.simpleMessage(
      "Tryck för att fortsätta",
    ),
    "resultsPage1Button_ger25": MessageLookupByLibrary.simpleMessage(
      "Press to continue",
    ),
    "resultsPage1Text": MessageLookupByLibrary.simpleMessage(
      "På de följande sidorna kommer du att upptäcka din mest kompatibla partigrupp i Europaparlamentet, de matchande lokala kandidatlistorna att rösta på i juni i ditt land, och vi hittade även ett par extra saker baserat på dina svar 😌",
    ),
    "resultsPage1Text_ger25": MessageLookupByLibrary.simpleMessage(
      "In the next screens, you’ll discover which party is compatible with you. And we even found a few extra things based on your answers!",
    ),
    "resultsPage1Title": MessageLookupByLibrary.simpleMessage(
      "En match och mycket mer 👉👈",
    ),
    "resultsPage1Title_ger25": MessageLookupByLibrary.simpleMessage(
      "A match and much more",
    ),
    "resultsPage2_1Title": MessageLookupByLibrary.simpleMessage(
      "Ärligt talat, mellan",
    ),
    "resultsPage2_1Title_ger25": MessageLookupByLibrary.simpleMessage(
      "Honestly,",
    ),
    "resultsPage2_2Title": MessageLookupByLibrary.simpleMessage(
      "och mig, är det typ en Love Story (EU’s Version)",
    ),
    "resultsPage2_2Title_ger25": MessageLookupByLibrary.simpleMessage(
      "and I, we are like Currywurst and fries",
    ),
    "resultsPage3Title": MessageLookupByLibrary.simpleMessage(
      "Hur nära jag står partigrupperna i Europaparlamentet",
    ),
    "resultsPage3Title_ger25": MessageLookupByLibrary.simpleMessage(
      "How close I am to the parties running in this German election",
    ),
    "resultsPage4TitleBottom": MessageLookupByLibrary.simpleMessage(
      "Mot EU-Integration",
    ),
    "resultsPage4TitleBottom_ger25": MessageLookupByLibrary.simpleMessage(
      "Socially conservative",
    ),
    "resultsPage4TitleLeft": MessageLookupByLibrary.simpleMessage("Vänster"),
    "resultsPage4TitleLeft_ger25": MessageLookupByLibrary.simpleMessage(
      "Economic intervention",
    ),
    "resultsPage4TitleRight": MessageLookupByLibrary.simpleMessage("Höger"),
    "resultsPage4TitleRight_ger25": MessageLookupByLibrary.simpleMessage(
      "Free market economics",
    ),
    "resultsPage4TitleTop": MessageLookupByLibrary.simpleMessage(
      "För EU-Integration",
    ),
    "resultsPage4TitleTop_ger25": MessageLookupByLibrary.simpleMessage(
      "Socially progressive",
    ),
    "resultsPage4TitleUserHere": MessageLookupByLibrary.simpleMessage(
      "It’s me, hi!",
    ),
    "resultsPage4TitleUserHere_ger25": MessageLookupByLibrary.simpleMessage(
      "It’s me, hi!",
    ),
    "resultsPage5Title": MessageLookupByLibrary.simpleMessage(
      "När det gäller mer specifika frågor, vilken av Europaparlamentets partigrupper står jag närmast?",
    ),
    "resultsPage5Title_ger25": MessageLookupByLibrary.simpleMessage(
      "On more specific topics, which parties am I closest to?",
    ),
    "resultsPage5Topic1": MessageLookupByLibrary.simpleMessage("Miljöfrågor"),
    "resultsPage5Topic1_ger25": MessageLookupByLibrary.simpleMessage(
      "Environmental issues",
    ),
    "resultsPage5Topic2": MessageLookupByLibrary.simpleMessage(
      "Mänskliga & Sociala Rättigheter",
    ),
    "resultsPage5Topic2_ger25": MessageLookupByLibrary.simpleMessage("Economy"),
    "resultsPage5Topic3": MessageLookupByLibrary.simpleMessage(
      "Ekonomisk intervention",
    ),
    "resultsPage5Topic3_ger25": MessageLookupByLibrary.simpleMessage(
      "Social values",
    ),
    "resultsPage5Topic4_ger25": MessageLookupByLibrary.simpleMessage(
      "EU integration",
    ),
    "resultsPage5Topic5_ger25": MessageLookupByLibrary.simpleMessage(
      "Migration",
    ),
    "resultsPage6Text": MessageLookupByLibrary.simpleMessage(
      "På följande sidor kommer du hitta listorna på kandidaterna i ditt land mest troliga att ingå i din match.",
    ),
    "resultsPage6Text_ger25": MessageLookupByLibrary.simpleMessage(
      "Overwhelmed? No worries, we’ve thought of that! We have some options for you on the next slide!",
    ),
    "resultsPage6_1Title": MessageLookupByLibrary.simpleMessage(
      "Okej, coolt att veta vilken grupp som fattar mig...",
    ),
    "resultsPage6_1Title_ger25": MessageLookupByLibrary.simpleMessage(
      "Okay, it is cool to know which party gets me…",
    ),
    "resultsPage6_2Title": MessageLookupByLibrary.simpleMessage(
      "Men vid EU-valet röstar vi på en lokal kandidatlista",
    ),
    "resultsPage6_2Title_ger25": MessageLookupByLibrary.simpleMessage(
      "But at the German election you also have the option to vote for a specific candidate",
    ),
    "resultsPage7Disclaimer": MessageLookupByLibrary.simpleMessage(
      "I ingen speciell ordning.",
    ),
    "resultsPage7Disclaimer_ger25": MessageLookupByLibrary.simpleMessage(
      "* On this screen only candidates from the following parties can be displayed: CDU/CSU, SPD, Grüne, AfD, Linke, FDP, BSW.",
    ),
    "resultsPage7NoLocalCandidates": m3,
    "resultsPage7Title": m4,
    "resultsPage7Title_ger25": m5,
    "resultsPage8Help": MessageLookupByLibrary.simpleMessage(
      "Du är en klimatkämpe! Du anser att det krävs kollektiva åtgärder för att ta itu med klimatkrisen, där alla gör det till en hög prioritet. Du har inget emot att EU reglerar företag i detta syfte. När allt kommer omkring, vilken nytta har vi den ekonomiska tillväxten om planeten blir obeboelig?",
    ),
    "resultsPage8Help_ger25": MessageLookupByLibrary.simpleMessage(
      "You are a climate change fighter! You believe that tackling the climate crisis requires collective action, with everyone making it a top priority. You do not mind the Germany regulating companies to that end. After all, what use is economic growth if the planet becomes inhabitable? #ClimateActionNow #PlanetFirst",
    ),
    "resultsPage8_1Text": m6,
    "resultsPage8_1Text_ger25": m7,
    "resultsPage8_2Text": MessageLookupByLibrary.simpleMessage(
      "Aktiva Klimatåtgärder 🌱😌",
    ),
    "resultsPage8_2Text_ger25": MessageLookupByLibrary.simpleMessage(
      "Active Climate Action 🌱😌",
    ),
    "resultsPage9Help": MessageLookupByLibrary.simpleMessage(
      "Klicka på korten för att blanda",
    ),
    "resultsPage9Help_ger25": MessageLookupByLibrary.simpleMessage(
      "Click on the cards to shuffle",
    ),
    "resultsPage9Text1": MessageLookupByLibrary.simpleMessage(
      "Val handlar om många frågor, men det finns en sak som verkligen",
    ),
    "resultsPage9Text1_ger25": MessageLookupByLibrary.simpleMessage(
      "Elections are about many topics, but there\'s one that suits you perfectly! It\'s almost as if it was",
    ),
    "resultsPage9Text2": MessageLookupByLibrary.simpleMessage(
      "Belongs With Me 😌",
    ),
    "resultsPage9Text2_ger25": MessageLookupByLibrary.simpleMessage(
      "made for you!",
    ),
    "resultsShare": MessageLookupByLibrary.simpleMessage("Dela"),
    "romania": MessageLookupByLibrary.simpleMessage("Rumänien"),
    "settingsPagePrivacyPolicy": MessageLookupByLibrary.simpleMessage(
      "Integritetspolicy",
    ),
    "settingsPageShareButtonText": MessageLookupByLibrary.simpleMessage("Dela"),
    "settingsPageShareText": MessageLookupByLibrary.simpleMessage(
      "Om denna söta duva inte kan hjälpa dig att rösta i juni, kan inget. Jag har använt appen och det borde du också:",
    ),
    "settingsPageShareText_ger25": MessageLookupByLibrary.simpleMessage(
      "If this cute pigeon can\'t help you vote in February, nothing will. I\'ve used the app and you should too:",
    ),
    "settingsPageSubtitle1": MessageLookupByLibrary.simpleMessage(
      "Huvudsponsorer",
    ),
    "settingsPageSubtitle1_ger25": MessageLookupByLibrary.simpleMessage(
      "Main Sponsors",
    ),
    "settingsPageSubtitle2": MessageLookupByLibrary.simpleMessage(
      "Europeiska partner",
    ),
    "settingsPageSubtitle2_ger25": MessageLookupByLibrary.simpleMessage(
      "European Partners",
    ),
    "settingsPageSubtitle3": MessageLookupByLibrary.simpleMessage(
      "Akademiska partner",
    ),
    "settingsPageSubtitle3_ger25": MessageLookupByLibrary.simpleMessage(
      "Academic Partners",
    ),
    "settingsPageSubtitle4": MessageLookupByLibrary.simpleMessage(
      "Nationella institutionella partner",
    ),
    "settingsPageSubtitle4_ger25": MessageLookupByLibrary.simpleMessage(
      "National Institutional Partners",
    ),
    "settingsPageSubtitle5": MessageLookupByLibrary.simpleMessage(
      "Tjänsteleverantörer",
    ),
    "settingsPageSubtitle5_ger25": MessageLookupByLibrary.simpleMessage(
      "Service Providers",
    ),
    "settingsPageSubtitleLanguage": MessageLookupByLibrary.simpleMessage(
      "Jag föredrar att använda denna app på",
    ),
    "settingsPageTextAbout": MessageLookupByLibrary.simpleMessage(
      "Palumba är inte ett företeg, inte ett politiskt parti och inte en regering. Vi är en oberoende ideell förening bestående av 120+ unga människor 🐦 från hela europa som slöt sig samman förra sommaren och påbörjade skapandet av denna app. Vi har ett mål: att hjälpa dig bättre förstå hur Europavalet fungerar och vilka kandidatlistor matchar dina idéer, så att du med mer förtroende kan rösta för människor som stöttar dina prioriteringar. Vår algoritm är open-source, påståendena du svajpar på är granskade av statsvetare, och din data är sååå krypterad att vi inte har något sätt att någonsin identifiera dig :)",
    ),
    "settingsPageTextLanguage": MessageLookupByLibrary.simpleMessage(
      "För att ändra språk, klicka på det nuvarande",
    ),
    "settingsPageTextPartners": MessageLookupByLibrary.simpleMessage(
      "Det är viktigt att vi berättar för dig att våra partner inte har någon redaktionell makt över innehållet i appen, som är och förblir ett opartiskt initiativ med ett tydligt mål: att hjälpa dig att förstå vem som stöder dina åsikter på europeisk och nationell nivå.",
    ),
    "settingsPageTextPartners_ger25": MessageLookupByLibrary.simpleMessage(
      "Important to tell you that partners have no editorial power on the content of the app, which remains a non-partisan initiative with a clear goal: helping you understand who supports your opinions at the european and national levels.",
    ),
    "settingsPageTitleAbout": MessageLookupByLibrary.simpleMessage("Om oss"),
    "settingsPageTitleAssociation": MessageLookupByLibrary.simpleMessage(
      "Föreningen",
    ),
    "settingsPageTitleAssociation_ger25": MessageLookupByLibrary.simpleMessage(
      "The association",
    ),
    "settingsPageTitleLanguage": MessageLookupByLibrary.simpleMessage("Språk"),
    "settingsPageTitlePartners": MessageLookupByLibrary.simpleMessage(
      "Samarbetspartner",
    ),
    "settingsPageTitlePartners_ger25": MessageLookupByLibrary.simpleMessage(
      "Partners",
    ),
    "shortAppName": MessageLookupByLibrary.simpleMessage("Palumba"),
    "skip": MessageLookupByLibrary.simpleMessage("Hoppa över"),
    "spain": MessageLookupByLibrary.simpleMessage("Spanien"),
    "splashPageNoInternet": MessageLookupByLibrary.simpleMessage(
      "Det verkar som om du saknar internetanslutning",
    ),
    "sweden": MessageLookupByLibrary.simpleMessage("Sverige"),
    "textContinue": MessageLookupByLibrary.simpleMessage("Fortsätt"),
    "yes": MessageLookupByLibrary.simpleMessage("Ja"),
  };
}
