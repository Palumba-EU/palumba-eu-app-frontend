// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a cs locale. All the
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
  String get localeName => 'cs';

  static String m0(count) =>
      "Nalezeno ${count} shodných výsledků za posledních 24 h";

  static String m1(count) =>
      "Nalezeno ${count} shodných výsledků za posledních 24 h";

  static String m2(country) => "Hledám shodu s kandidáty v ${country}";

  static String m3(date) => "Get Ready, Voting Day is ${date}";

  static String m4(date) => "Get ready, voting day is ${date}";

  static String m5(country) =>
      "V ${country} jsme nenalezli žádné místní strany";

  static String m6(country, group) =>
      "Kandidáti v ${country} mají nejblíže ke ${group}";

  static String m7(party) =>
      "Here’s a young candidate from ${party}* —shuffle to see more! They may not be on your ballot, but represent the future of their party!";

  static String m8(topic, percentage) =>
      "V ${topic}, se z ${percentage}% shodujete v";

  static String m9(number, dimension) =>
      "Your answers are in the top ${number}% regarding ${dimension}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "alertServerErrorText": MessageLookupByLibrary.simpleMessage(
      "Něco pokazilo. Zkuste to prosím později.",
    ),
    "alertServerErrorTitle": MessageLookupByLibrary.simpleMessage("Ops!"),
    "appName": MessageLookupByLibrary.simpleMessage("Palumba EU"),
    "cancel": MessageLookupByLibrary.simpleMessage("Zrušit"),
    "dataProtectionText1": MessageLookupByLibrary.simpleMessage(
      "I adhere to the",
    ),
    "dataProtectionText2": MessageLookupByLibrary.simpleMessage(
      "and the Terms to use the app",
    ),
    "deepDiveIntro": MessageLookupByLibrary.simpleMessage(
      "Let’s deep dive into your compatibility with all candidates & policies in the next screens. Tap the right/left of the screen to navigate.",
    ),
    "denmark": MessageLookupByLibrary.simpleMessage("Dánsko"),
    "electionDE": MessageLookupByLibrary.simpleMessage(
      "Bundestagswahl 2025 🇩🇪",
    ),
    "electionEU": MessageLookupByLibrary.simpleMessage(
      "European Elections 2024 🇪🇺",
    ),
    "electionPageSubtitle": MessageLookupByLibrary.simpleMessage(""),
    "electionPageTitle": MessageLookupByLibrary.simpleMessage(
      "Choose an Election",
    ),
    "entranceMatchesFoundQuote": m0,
    "entranceStartButton": MessageLookupByLibrary.simpleMessage(
      "Spustit Palumbu",
    ),
    "entranceTitle1": MessageLookupByLibrary.simpleMessage(
      "Pokud vám tento roztomilý holub nepomůže v červnu volit, nepomůže vám nic.",
    ),
    "entranceTitle1_ger25": MessageLookupByLibrary.simpleMessage(
      "If this cute pigeon can’t help you vote in February, nothing will.",
    ),
    "entranceTitle2": MessageLookupByLibrary.simpleMessage(
      "Posuňte svůj názor na témata, která vás zajímají.",
    ),
    "entranceTitle2_ger25": MessageLookupByLibrary.simpleMessage(
      "Swipe your opinion on topics that matter to you.",
    ),
    "entranceTitle3": MessageLookupByLibrary.simpleMessage(
      "Najdi shodu a zjistíte, koho máte ve volbách volit.",
    ),
    "entranceTitle3_ger25": MessageLookupByLibrary.simpleMessage(
      "Find out your match and an orientation for who to vote for at the Elections.",
    ),
    "faq": MessageLookupByLibrary.simpleMessage("FAQ"),
    "france": MessageLookupByLibrary.simpleMessage("Francie"),
    "germany": MessageLookupByLibrary.simpleMessage("Německo"),
    "homePageBackToTest": MessageLookupByLibrary.simpleMessage("Zpět k testu"),
    "homePageMatchesFoundQuote": m1,
    "homePageMyResults": MessageLookupByLibrary.simpleMessage("Mé výsledky"),
    "homePageStartButton": MessageLookupByLibrary.simpleMessage(
      "Spustit nový test",
    ),
    "hungary": MessageLookupByLibrary.simpleMessage("Maďarsko"),
    "languagePageSubtitle": MessageLookupByLibrary.simpleMessage(
      "Toto lze změnit později v sekci Nastavení.",
    ),
    "languagePageTitle": MessageLookupByLibrary.simpleMessage(
      "Pokračovat v češtině? :)",
    ),
    "loadingResultsPageTitle1": MessageLookupByLibrary.simpleMessage(
      "Vaše výsledky jsou na cestě :)",
    ),
    "loadingResultsPageTitle1_ger25": MessageLookupByLibrary.simpleMessage(
      "Your personal results are on their way :)",
    ),
    "loadingResultsPageTitle2": MessageLookupByLibrary.simpleMessage(
      "Bude to rychlejší než prodej lístků na Taylor Swift ",
    ),
    "loadingResultsPageTitle2_ger25": MessageLookupByLibrary.simpleMessage(
      "This is going faster than the Deutsche Bahn",
    ),
    "loadingResultsPageTitle3": m2,
    "loadingResultsPageTitle3_ger25": MessageLookupByLibrary.simpleMessage(
      "Hold on, it’s almost done - pinky promise, no layovers!",
    ),
    "loadingResultsPageTitle4": MessageLookupByLibrary.simpleMessage(
      "Téměř připraveno, ještě poslední kontrola...",
    ),
    "loadingResultsPageTitle4_ger25": MessageLookupByLibrary.simpleMessage(
      "Almost ready, one last check...",
    ),
    "maybe": MessageLookupByLibrary.simpleMessage("Maybe"),
    "messageScreenNo_ger25": MessageLookupByLibrary.simpleMessage(
      "No, thanks!",
    ),
    "messageScreenYes_ger25": MessageLookupByLibrary.simpleMessage("Yesss!"),
    "message_five_cards_left": MessageLookupByLibrary.simpleMessage(
      "Už jen 5 karet do konce :)",
    ),
    "message_half_test_done": MessageLookupByLibrary.simpleMessage(
      "Swipuj dál, už jsi v půlce!",
    ),
    "neutral": MessageLookupByLibrary.simpleMessage("Neutrální"),
    "no": MessageLookupByLibrary.simpleMessage("Ne"),
    "ok": MessageLookupByLibrary.simpleMessage("Ok"),
    "onBoardingCardQuestion": MessageLookupByLibrary.simpleMessage(
      "Nemám ponětí, pro koho budu hlasovat v evropských volbách roku 2024",
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
      "Přetáhněte dle svých preferencí",
    ),
    "onBoardingNotAnswerButton": MessageLookupByLibrary.simpleMessage(
      "Nechci uvádět",
    ),
    "onBoardingStep1Subtitle": MessageLookupByLibrary.simpleMessage("Nevím"),
    "onBoardingStep1Title": MessageLookupByLibrary.simpleMessage(
      "Ve které zemi budete hlasovat?",
    ),
    "onBoardingStep2Title": MessageLookupByLibrary.simpleMessage("Můj věk"),
    "onBoardingStep3Option1": MessageLookupByLibrary.simpleMessage("Žena"),
    "onBoardingStep3Option2": MessageLookupByLibrary.simpleMessage("Muž"),
    "onBoardingStep3Option3": MessageLookupByLibrary.simpleMessage(
      "Genderfluidní",
    ),
    "onBoardingStep3Option4": MessageLookupByLibrary.simpleMessage("Nebinární"),
    "onBoardingStep3Option5": MessageLookupByLibrary.simpleMessage("Jinak"),
    "onBoardingStep3Title": MessageLookupByLibrary.simpleMessage(
      "Identifikuji se jako",
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
      "Middle school diploma",
    ),
    "onBoardingStep4Option5_ger25": MessageLookupByLibrary.simpleMessage(
      "Incomplete school education",
    ),
    "onBoardingStep4Option6_ger25": MessageLookupByLibrary.simpleMessage(
      "Other",
    ),
    "onBoardingStep4Title": MessageLookupByLibrary.simpleMessage(
      "Level of Education",
    ),
    "poland": MessageLookupByLibrary.simpleMessage("Polsko"),
    "pushDeactivatedCancel": MessageLookupByLibrary.simpleMessage("Close"),
    "pushDeactivatedConfirm": MessageLookupByLibrary.simpleMessage(
      "Open Settings",
    ),
    "pushDeactivatedText": MessageLookupByLibrary.simpleMessage(
      "To be able to receive Push Notifcation enable them in the settings",
    ),
    "pushDeactivatedTitle": MessageLookupByLibrary.simpleMessage(
      "Notifications disabled",
    ),
    "resultsPage10AreYouGoingToVote_ger25":
        MessageLookupByLibrary.simpleMessage("Are you going to vote?"),
    "resultsPage10MaybeButton_ger25": MessageLookupByLibrary.simpleMessage(
      "Maybe",
    ),
    "resultsPage10NopButton": MessageLookupByLibrary.simpleMessage("Ne, díky!"),
    "resultsPage10NopButton_ger25": MessageLookupByLibrary.simpleMessage(
      "No thanks!",
    ),
    "resultsPage10Title": MessageLookupByLibrary.simpleMessage(
      "Upozornit mě, až bude čas jít volit?",
    ),
    "resultsPage10Title_ger25": MessageLookupByLibrary.simpleMessage(
      "A notification when it’s time to go vote?",
    ),
    "resultsPage10VotingDay": m3,
    "resultsPage10VotingDay_ger25": m4,
    "resultsPage10VotingQuestion": MessageLookupByLibrary.simpleMessage(
      "Are you going to vote?",
    ),
    "resultsPage10YesButton": MessageLookupByLibrary.simpleMessage("Jasněěě"),
    "resultsPage10YesButton_ger25": MessageLookupByLibrary.simpleMessage(
      "Yesssss",
    ),
    "resultsPage1Button": MessageLookupByLibrary.simpleMessage(
      "Stiskněte pro pokračování",
    ),
    "resultsPage1Button_ger25": MessageLookupByLibrary.simpleMessage(
      "Press to continue",
    ),
    "resultsPage1Text": MessageLookupByLibrary.simpleMessage(
      "Na následujících obrazovkách se dozvíte, s jakou skupinou v Evropském parlamentu se nejvíce ztotožňujete, naleznete odpovídající kandidáty, pro které můžete v červnu ve vaší zemi hlasovat. Na základě vašich odpovědí jsme dokonce jsme našli několik dalších zajímavostí 😌",
    ),
    "resultsPage1Text_ger25": MessageLookupByLibrary.simpleMessage(
      "In the next screens, you’ll discover which party is compatible with you. And we even found a few extra things based on your answers!",
    ),
    "resultsPage1Title": MessageLookupByLibrary.simpleMessage(
      "Shoda a mnohem více",
    ),
    "resultsPage1Title_ger25": MessageLookupByLibrary.simpleMessage(
      "A match and much more",
    ),
    "resultsPage2NoResults": MessageLookupByLibrary.simpleMessage(
      "No results found",
    ),
    "resultsPage2_1Title": MessageLookupByLibrary.simpleMessage(
      "Upřímně řečeno, mezi",
    ),
    "resultsPage2_1Title_ger25": MessageLookupByLibrary.simpleMessage(
      "Honestly,",
    ),
    "resultsPage2_2Title": MessageLookupByLibrary.simpleMessage(
      "a mnou, je to tak trochu Love Story (verze EU)",
    ),
    "resultsPage2_2Title_ger25": MessageLookupByLibrary.simpleMessage(
      "and I, we are like Currywurst and fries",
    ),
    "resultsPage3Title": MessageLookupByLibrary.simpleMessage(
      "Jak blízko mám ke skupinám Evropského parlamentu",
    ),
    "resultsPage3Title_ger25": MessageLookupByLibrary.simpleMessage(
      "How close I am to the main parties running in this German election",
    ),
    "resultsPage4TitleBottom": MessageLookupByLibrary.simpleMessage(
      "Proti evropské integraci",
    ),
    "resultsPage4TitleBottom_ger25": MessageLookupByLibrary.simpleMessage(
      "Socially progressive",
    ),
    "resultsPage4TitleLeft": MessageLookupByLibrary.simpleMessage("Left"),
    "resultsPage4TitleLeft_ger25": MessageLookupByLibrary.simpleMessage(
      "Economic intervention",
    ),
    "resultsPage4TitleRight": MessageLookupByLibrary.simpleMessage("Right"),
    "resultsPage4TitleRight_ger25": MessageLookupByLibrary.simpleMessage(
      "Free market economics",
    ),
    "resultsPage4TitleTop": MessageLookupByLibrary.simpleMessage(
      "Pro evropskou integraci",
    ),
    "resultsPage4TitleTop_ger25": MessageLookupByLibrary.simpleMessage(
      "Socially conservative",
    ),
    "resultsPage4TitleUserHere": MessageLookupByLibrary.simpleMessage(
      "To jsem já, ahoj!",
    ),
    "resultsPage4TitleUserHere_ger25": MessageLookupByLibrary.simpleMessage(
      "It’s me, hi!",
    ),
    "resultsPage5Title": MessageLookupByLibrary.simpleMessage(
      "Pokud jde o konkrétnější témata, ke které skupině Evropského parlamentu mám blíže?",
    ),
    "resultsPage5Title_ger25": MessageLookupByLibrary.simpleMessage(
      "On more specific topics, which parties am I closest to?",
    ),
    "resultsPage5Topic1": MessageLookupByLibrary.simpleMessage(
      "Otázky životního prostředí",
    ),
    "resultsPage5Topic1_ger25": MessageLookupByLibrary.simpleMessage(
      "Environmental issues",
    ),
    "resultsPage5Topic2": MessageLookupByLibrary.simpleMessage(
      "Lidská a sociální práva",
    ),
    "resultsPage5Topic2_ger25": MessageLookupByLibrary.simpleMessage("Economy"),
    "resultsPage5Topic3": MessageLookupByLibrary.simpleMessage(
      "Hospodářské intervence",
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
      "Na následujících obrazovkách naleznete seznamy kandidátů ve vaší zemi, se kterými se pravděpodobně shodujete nejvíce.",
    ),
    "resultsPage6Text_ger25": MessageLookupByLibrary.simpleMessage(
      "Overwhelmed? No worries, we’ve thought of that! We have some options for you on the next slide!",
    ),
    "resultsPage6_1Title": MessageLookupByLibrary.simpleMessage(
      "Ok, je skvělé vědět, ke které skupině mám nejblíž...",
    ),
    "resultsPage6_1Title_ger25": MessageLookupByLibrary.simpleMessage(
      "Okay, it is cool to know which party gets me…",
    ),
    "resultsPage6_2Title": MessageLookupByLibrary.simpleMessage(
      "Při evropských volbách však hlasujeme pro místní kandidáty",
    ),
    "resultsPage6_2Title_ger25": MessageLookupByLibrary.simpleMessage(
      "But in the German election you also have the option to vote for a specific candidate",
    ),
    "resultsPage7Disclaimer": MessageLookupByLibrary.simpleMessage(
      "Bez konkrétního pořadí.",
    ),
    "resultsPage7Disclaimer_ger25": MessageLookupByLibrary.simpleMessage(
      "* On this screen only candidates from the following parties can be displayed: CDU/CSU, SPD, Grüne, AfD, Linke, FDP, BSW.",
    ),
    "resultsPage7NoLocalCandidates": m5,
    "resultsPage7Title": m6,
    "resultsPage7Title_ger25": m7,
    "resultsPage8Help": MessageLookupByLibrary.simpleMessage(
      "Jste bojovníkem za změnu klimatu! Věříte, že boj proti klimatické krizi vyžaduje kolektivní přístup, přičemž z něj každý učiní svou hlavní prioritu. Nevadí vám regulace společností ze strany EU. Vždyť jaký užitek má hospodářský růst ve chvíli, kdy se planeta stane neobyvatelnou?",
    ),
    "resultsPage8Help_ger25": MessageLookupByLibrary.simpleMessage(
      "You are a climate change fighter! You believe that tackling the climate crisis requires collective action, with everyone making it a top priority. You do not mind the Germany regulating companies to that end. After all, what use is economic growth if the planet becomes inhabitable? #ClimateActionNow #PlanetFirst",
    ),
    "resultsPage8_1Text": m8,
    "resultsPage8_1Text_ger25": m9,
    "resultsPage8_2Text": MessageLookupByLibrary.simpleMessage(
      "Aktivní opatření v oblasti klimatu 🌱😌",
    ),
    "resultsPage8_2Text_ger25": MessageLookupByLibrary.simpleMessage(
      "Active Climate Action 🌱😌",
    ),
    "resultsPage9Help": MessageLookupByLibrary.simpleMessage(
      "Pro zamíchání klikněte na karty",
    ),
    "resultsPage9Help_ger25": MessageLookupByLibrary.simpleMessage(
      "Click on the cards to shuffle",
    ),
    "resultsPage9Text1": MessageLookupByLibrary.simpleMessage(
      "Volby se týkají mnoha témat, ale jedna věc je",
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
    "resultsPageAllPartiesDescription_ger25": MessageLookupByLibrary.simpleMessage(
      "But what would your ranking look like if we also include smaller parties? - This list includes parties that currently do not have representatives in the Bundestag.",
    ),
    "resultsPageAllPartiesTitle_ger25": MessageLookupByLibrary.simpleMessage(
      "Your personal ranking of all parties",
    ),
    "resultsPageCandidatesNoParties": MessageLookupByLibrary.simpleMessage(
      "no local parties",
    ),
    "resultsPageCandidatesShuffle": MessageLookupByLibrary.simpleMessage(
      "Shuffle my politcal love 🔀",
    ),
    "resultsSentYouARose": MessageLookupByLibrary.simpleMessage(
      "sent you a rose",
    ),
    "resultsShare": MessageLookupByLibrary.simpleMessage("Sdílet"),
    "romania": MessageLookupByLibrary.simpleMessage("Rumunsko"),
    "settingsPagePrivacyPolicy": MessageLookupByLibrary.simpleMessage(
      "Zásady ochrany osobních údajů",
    ),
    "settingsPageShareButtonText": MessageLookupByLibrary.simpleMessage(
      "Sdílet",
    ),
    "settingsPageShareText": MessageLookupByLibrary.simpleMessage(
      "Pokud vám tento roztomilý holub nepomůže v červnu volit, nepomůže vám nic. Aplikaci jsem použil a vy byste měli také:",
    ),
    "settingsPageShareText_ger25": MessageLookupByLibrary.simpleMessage(
      "If this cute pigeon can\'t help you vote in February, nothing will. I\'ve used the app and you should too:",
    ),
    "settingsPageSubtitle1": MessageLookupByLibrary.simpleMessage(
      "Hlavní sponzoři",
    ),
    "settingsPageSubtitle1_ger25": MessageLookupByLibrary.simpleMessage(
      "Main Sponsors",
    ),
    "settingsPageSubtitle2": MessageLookupByLibrary.simpleMessage(
      "Evropští partneři",
    ),
    "settingsPageSubtitle2_ger25": MessageLookupByLibrary.simpleMessage(
      "European Partners",
    ),
    "settingsPageSubtitle3": MessageLookupByLibrary.simpleMessage(
      "Akademičtí partneři",
    ),
    "settingsPageSubtitle3_ger25": MessageLookupByLibrary.simpleMessage(
      "Academic Partners",
    ),
    "settingsPageSubtitle4": MessageLookupByLibrary.simpleMessage(
      "Partneři z národních institucí",
    ),
    "settingsPageSubtitle4_ger25": MessageLookupByLibrary.simpleMessage(
      "National Institutional Partners",
    ),
    "settingsPageSubtitle5": MessageLookupByLibrary.simpleMessage(
      "Poskytovatelé služeb",
    ),
    "settingsPageSubtitle5_ger25": MessageLookupByLibrary.simpleMessage(
      "Service Providers",
    ),
    "settingsPageSubtitleLanguage": MessageLookupByLibrary.simpleMessage(
      "Preferuji používat tuto aplikaci v",
    ),
    "settingsPageTextAbout": MessageLookupByLibrary.simpleMessage(
      "Palumba není společnost, politická strana, ani vláda. Jsme nezávislé neziskové sdružení 120+ mladých lidí 🐦 z celé Evropy, kteří se sešli loni v létě a začali s realizací této aplikace. Máme jeden cíl: pomoci vám lépe pochopit, jak fungují evropské volby a kteří kandidáti by mohli být nejblíže k vašim představám, abyste tak mohli s větší jistotou hlasovat pro lidi, kteří podporují vaše priority. Náš algoritmus je otevřený zdrojový kód, prohlášení, se kterými hledáte shodu, byla přezkoumána politology, a vaše data jsou zašifrovaná, takže neexistuje žádný způsob, jak bychom vás mohli identifikovat :)",
    ),
    "settingsPageTextElection": MessageLookupByLibrary.simpleMessage(
      "To change the questionnaire, click on the current one",
    ),
    "settingsPageTextLanguage": MessageLookupByLibrary.simpleMessage(
      "Pro změnu jazyka klikněte na výše uvedený",
    ),
    "settingsPageTextPartners": MessageLookupByLibrary.simpleMessage(
      "Deklarujeme, že následující partneři nemají žádným způsobem neovlivnili obsah aplikace, která zůstává nestrannou iniciativou s jasným cílem: pomůže vám pochopit, kdo podporuje vaše názory na evropské a vnitrostátní úrovni.",
    ),
    "settingsPageTextPartners_ger25": MessageLookupByLibrary.simpleMessage(
      "Important to tell you that partners have no editorial power on the content of the app, which remains a non-partisan initiative with a clear goal: helping you understand who supports your opinions at the european and national levels.",
    ),
    "settingsPageTitleAbout": MessageLookupByLibrary.simpleMessage("O nás"),
    "settingsPageTitleAssociation": MessageLookupByLibrary.simpleMessage(
      "Asociace",
    ),
    "settingsPageTitleAssociation_ger25": MessageLookupByLibrary.simpleMessage(
      "The association",
    ),
    "settingsPageTitleElection": MessageLookupByLibrary.simpleMessage(
      "Election",
    ),
    "settingsPageTitleLanguage": MessageLookupByLibrary.simpleMessage("Jazyk"),
    "settingsPageTitlePartners": MessageLookupByLibrary.simpleMessage(
      "Partneři",
    ),
    "settingsPageTitlePartners_ger25": MessageLookupByLibrary.simpleMessage(
      "Partners",
    ),
    "shortAppName": MessageLookupByLibrary.simpleMessage("Palumba"),
    "skip": MessageLookupByLibrary.simpleMessage("Přeskočit"),
    "spain": MessageLookupByLibrary.simpleMessage("Španělsko"),
    "splashPageNoInternet": MessageLookupByLibrary.simpleMessage(
      "Vypadá to, že nejste připojeni k internetu",
    ),
    "statementsTutorialTurnInfo_ger25": MessageLookupByLibrary.simpleMessage(
      "Tap to turn & read more info",
    ),
    "sweden": MessageLookupByLibrary.simpleMessage("Švédsko"),
    "textContinue": MessageLookupByLibrary.simpleMessage("Pokračovat"),
    "yes": MessageLookupByLibrary.simpleMessage("Ano"),
  };
}
