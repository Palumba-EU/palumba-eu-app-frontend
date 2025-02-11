// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a it locale. All the
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
  String get localeName => 'it';

  static String m0(count) => "${count} match trovati nelle ultime 24 ore";

  static String m1(count) => "${count} match trovati nelle ultime 24 ore";

  static String m2(country) =>
      "Trova gli abbinamenti con le liste candidate in ${country}  🔍";

  static String m3(date) => "Get Ready, Voting Day is ${date}";

  static String m4(date) => "Get ready, voting day is ${date}";

  static String m5(country) => "Nessun partito trovato in ${country}";

  static String m6(country, group) =>
      "I candidati in ${country} più allineati con ${group}";

  static String m7(party) =>
      "Here’s a young candidate from ${party}* —shuffle to see more! They may not be on your ballot, but represent the future of their party!";

  static String m8(topic, percentage) =>
      "Su ${topic}, sei ${percentage}% più incline in";

  static String m9(number, dimension) =>
      "Your answers are in the top ${number}% regarding ${dimension}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "alertServerErrorText": MessageLookupByLibrary.simpleMessage(
      "Qualcosa è andato storto. Per favore riprova più tardi.",
    ),
    "alertServerErrorTitle": MessageLookupByLibrary.simpleMessage("Ops!"),
    "appName": MessageLookupByLibrary.simpleMessage("Palumba EU"),
    "cancel": MessageLookupByLibrary.simpleMessage("Annulla"),
    "denmark": MessageLookupByLibrary.simpleMessage("Danimarca"),
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
      "Avvia Palumba",
    ),
    "entranceTitle1": MessageLookupByLibrary.simpleMessage(
      "Se questo piccione carino non ti aiuterà a votare a giugno, nient\'altro lo farà.",
    ),
    "entranceTitle1_ger25": MessageLookupByLibrary.simpleMessage(
      "If this cute pigeon can’t help you vote in February, nothing will.",
    ),
    "entranceTitle2": MessageLookupByLibrary.simpleMessage(
      "Scorri sull\'opinione che più ti interessa.",
    ),
    "entranceTitle2_ger25": MessageLookupByLibrary.simpleMessage(
      "Swipe your opinion on topics that matter to you.",
    ),
    "entranceTitle3": MessageLookupByLibrary.simpleMessage(
      "Trova il tuo abbinamento e l\'orientamento per cui votare alle elezioni.",
    ),
    "entranceTitle3_ger25": MessageLookupByLibrary.simpleMessage(
      "Find out your match and an orientation for who to vote for at the Elections.",
    ),
    "faq": MessageLookupByLibrary.simpleMessage("FAQ"),
    "france": MessageLookupByLibrary.simpleMessage("Francia"),
    "germany": MessageLookupByLibrary.simpleMessage("Germania"),
    "homePageBackToTest": MessageLookupByLibrary.simpleMessage("Torna al test"),
    "homePageMatchesFoundQuote": m1,
    "homePageMyResults": MessageLookupByLibrary.simpleMessage(
      "I miei risultati",
    ),
    "homePageStartButton": MessageLookupByLibrary.simpleMessage(
      "Inizia un nuovo test",
    ),
    "hungary": MessageLookupByLibrary.simpleMessage("Ungheria"),
    "languagePageSubtitle": MessageLookupByLibrary.simpleMessage(
      "Potrai cambiare in seguito nelle impostazioni.",
    ),
    "languagePageTitle": MessageLookupByLibrary.simpleMessage(
      "Continuiamo in italiano? :)",
    ),
    "loadingResultsPageTitle1": MessageLookupByLibrary.simpleMessage(
      "I tuoi risultati personalizzati sono in arrivo :)",
    ),
    "loadingResultsPageTitle1_ger25": MessageLookupByLibrary.simpleMessage(
      "Your personal results are on their way :)",
    ),
    "loadingResultsPageTitle2": MessageLookupByLibrary.simpleMessage(
      "Dovrebbe essere più veloce che prendere dei biglietti per Taylor Swift 👀 ",
    ),
    "loadingResultsPageTitle2_ger25": MessageLookupByLibrary.simpleMessage(
      "This is going faster than the Deutsche Bahn",
    ),
    "loadingResultsPageTitle3": m2,
    "loadingResultsPageTitle3_ger25": MessageLookupByLibrary.simpleMessage(
      "Hold on, it’s almost done - pinky promise, no layovers!",
    ),
    "loadingResultsPageTitle4": MessageLookupByLibrary.simpleMessage(
      "Quasi pronti, un ultimo controllo...",
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
      "Solo 5 domande rimanenti :)",
    ),
    "message_half_test_done": MessageLookupByLibrary.simpleMessage(
      "Vai avanti, sei già al 50%!",
    ),
    "neutral": MessageLookupByLibrary.simpleMessage("Neutrale"),
    "no": MessageLookupByLibrary.simpleMessage("No"),
    "ok": MessageLookupByLibrary.simpleMessage("Ok"),
    "onBoardingCardQuestion": MessageLookupByLibrary.simpleMessage(
      "Non ho alcuna idea per chi votare alle Elezioni Europee 2024",
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
      "Scorri in base a quanto sei d\'accordo",
    ),
    "onBoardingNotAnswerButton": MessageLookupByLibrary.simpleMessage(
      "Preferisco non rispondere",
    ),
    "onBoardingStep1Subtitle": MessageLookupByLibrary.simpleMessage(
      "Non lo so",
    ),
    "onBoardingStep1Title": MessageLookupByLibrary.simpleMessage(
      "Da dove voterai?",
    ),
    "onBoardingStep2Title": MessageLookupByLibrary.simpleMessage("La mia età"),
    "onBoardingStep3Option1": MessageLookupByLibrary.simpleMessage("Donna"),
    "onBoardingStep3Option2": MessageLookupByLibrary.simpleMessage("Uomo"),
    "onBoardingStep3Option3": MessageLookupByLibrary.simpleMessage(
      "Gender fluid",
    ),
    "onBoardingStep3Option4": MessageLookupByLibrary.simpleMessage(
      "Genere non binario",
    ),
    "onBoardingStep3Option5": MessageLookupByLibrary.simpleMessage("Altro"),
    "onBoardingStep3Title": MessageLookupByLibrary.simpleMessage(
      "Mi identifico come",
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
    "poland": MessageLookupByLibrary.simpleMessage("Polonia"),
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
    "resultsPage10NopButton": MessageLookupByLibrary.simpleMessage(
      "No grazie!",
    ),
    "resultsPage10NopButton_ger25": MessageLookupByLibrary.simpleMessage(
      "No thanks!",
    ),
    "resultsPage10Title": MessageLookupByLibrary.simpleMessage(
      "Vuoi ricevere una notifica per quando sarà tempo di andare a votare?",
    ),
    "resultsPage10Title_ger25": MessageLookupByLibrary.simpleMessage(
      "A notification when it’s time to go vote?",
    ),
    "resultsPage10VotingDay": m3,
    "resultsPage10VotingDay_ger25": m4,
    "resultsPage10VotingQuestion": MessageLookupByLibrary.simpleMessage(
      "Are you going to vote?",
    ),
    "resultsPage10YesButton": MessageLookupByLibrary.simpleMessage("Sììììì"),
    "resultsPage10YesButton_ger25": MessageLookupByLibrary.simpleMessage(
      "Yesssss",
    ),
    "resultsPage1Button": MessageLookupByLibrary.simpleMessage(
      "Premi per continuare",
    ),
    "resultsPage1Button_ger25": MessageLookupByLibrary.simpleMessage(
      "Press to continue",
    ),
    "resultsPage1Text": MessageLookupByLibrary.simpleMessage(
      "Nelle prossime schermate, scoprirai il gruppo del Parlamento Europeo con cui sei più compatibile, le liste locali da votare a giugno nel tuo paese e abbiamo anche trovato un paio di cose extra in base alle tue risposte  😌",
    ),
    "resultsPage1Text_ger25": MessageLookupByLibrary.simpleMessage(
      "In the next screens, you’ll discover which party is compatible with you. And we even found a few extra things based on your answers!",
    ),
    "resultsPage1Title": MessageLookupByLibrary.simpleMessage(
      "Un match e tanto altro 👉👈",
    ),
    "resultsPage1Title_ger25": MessageLookupByLibrary.simpleMessage(
      "A match and much more",
    ),
    "resultsPage2NoResults": MessageLookupByLibrary.simpleMessage(
      "No results found",
    ),
    "resultsPage2_1Title": MessageLookupByLibrary.simpleMessage(
      "Onestamente, tra",
    ),
    "resultsPage2_1Title_ger25": MessageLookupByLibrary.simpleMessage(
      "Honestly,",
    ),
    "resultsPage2_2Title": MessageLookupByLibrary.simpleMessage(
      "e me, è una Love Story (EU\'s Version)",
    ),
    "resultsPage2_2Title_ger25": MessageLookupByLibrary.simpleMessage(
      "and I, we are like Currywurst and fries",
    ),
    "resultsPage3Title": MessageLookupByLibrary.simpleMessage(
      "Quanto mi sono vicini i Gruppi Parlamentari Europei",
    ),
    "resultsPage3Title_ger25": MessageLookupByLibrary.simpleMessage(
      "How close I am to the main parties running in this German election",
    ),
    "resultsPage4TitleBottom": MessageLookupByLibrary.simpleMessage(
      "Contro l\'Integrazione UE",
    ),
    "resultsPage4TitleBottom_ger25": MessageLookupByLibrary.simpleMessage(
      "Socially progressive",
    ),
    "resultsPage4TitleLeft": MessageLookupByLibrary.simpleMessage(
      "Conservative",
    ),
    "resultsPage4TitleLeft_ger25": MessageLookupByLibrary.simpleMessage(
      "Economic intervention",
    ),
    "resultsPage4TitleRight": MessageLookupByLibrary.simpleMessage(
      "Progressive",
    ),
    "resultsPage4TitleRight_ger25": MessageLookupByLibrary.simpleMessage(
      "Free market economics",
    ),
    "resultsPage4TitleTop": MessageLookupByLibrary.simpleMessage(
      "Pro Integrazione UE",
    ),
    "resultsPage4TitleTop_ger25": MessageLookupByLibrary.simpleMessage(
      "Socially conservative",
    ),
    "resultsPage4TitleUserHere": MessageLookupByLibrary.simpleMessage(
      "It\'s me, hi!",
    ),
    "resultsPage4TitleUserHere_ger25": MessageLookupByLibrary.simpleMessage(
      "It’s me, hi!",
    ),
    "resultsPage5Title": MessageLookupByLibrary.simpleMessage(
      "Su argomenti specifici, quale Gruppo Parlamentare Europeo mi è più vicino?",
    ),
    "resultsPage5Title_ger25": MessageLookupByLibrary.simpleMessage(
      "On more specific topics, which parties am I closest to?",
    ),
    "resultsPage5Topic1": MessageLookupByLibrary.simpleMessage(
      "Questioni ambientali",
    ),
    "resultsPage5Topic1_ger25": MessageLookupByLibrary.simpleMessage(
      "Environmental issues",
    ),
    "resultsPage5Topic2": MessageLookupByLibrary.simpleMessage(
      "Diritti Umani e Sociali",
    ),
    "resultsPage5Topic2_ger25": MessageLookupByLibrary.simpleMessage("Economy"),
    "resultsPage5Topic3": MessageLookupByLibrary.simpleMessage(
      "Intervento economico",
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
      "Nelle prossime schermate, scoprirai le liste candidate nel tuo paese che potrebbero esserti più vicine.",
    ),
    "resultsPage6Text_ger25": MessageLookupByLibrary.simpleMessage(
      "Overwhelmed? No worries, we’ve thought of that! We have some options for you on the next slide!",
    ),
    "resultsPage6_1Title": MessageLookupByLibrary.simpleMessage(
      "Ok, è bello sapere quale gruppo mi è più vicino...",
    ),
    "resultsPage6_1Title_ger25": MessageLookupByLibrary.simpleMessage(
      "Okay, it is cool to know which party gets me…",
    ),
    "resultsPage6_2Title": MessageLookupByLibrary.simpleMessage(
      "Ma alle Elezioni Europee, si vota per una lista locale",
    ),
    "resultsPage6_2Title_ger25": MessageLookupByLibrary.simpleMessage(
      "But in the German election you also have the option to vote for a specific candidate",
    ),
    "resultsPage7Disclaimer": MessageLookupByLibrary.simpleMessage(
      "Non in un ordine particolare.",
    ),
    "resultsPage7Disclaimer_ger25": MessageLookupByLibrary.simpleMessage(
      "* On this screen only candidates from the following parties can be displayed: CDU/CSU, SPD, Grüne, AfD, Linke, FDP, BSW.",
    ),
    "resultsPage7NoLocalCandidates": m5,
    "resultsPage7Title": m6,
    "resultsPage7Title_ger25": m7,
    "resultsPage8Help": MessageLookupByLibrary.simpleMessage(
      "Sei un* combattente per il cambiamento climatico! Credi che combattere la crisi climatica necessiti un\'azione collettiva, che tutti ne facciano una priorità assoluta. Non ti importa che l\'UE regoli le aziende fino in fondo. Alla fine, a cosa serve la crescita economica se il pianeta diventa inabitabile?",
    ),
    "resultsPage8Help_ger25": MessageLookupByLibrary.simpleMessage(
      "You are a climate change fighter! You believe that tackling the climate crisis requires collective action, with everyone making it a top priority. You do not mind the Germany regulating companies to that end. After all, what use is economic growth if the planet becomes inhabitable? #ClimateActionNow #PlanetFirst",
    ),
    "resultsPage8_1Text": m8,
    "resultsPage8_1Text_ger25": m9,
    "resultsPage8_2Text": MessageLookupByLibrary.simpleMessage(
      "Azione Climatica Attiva",
    ),
    "resultsPage8_2Text_ger25": MessageLookupByLibrary.simpleMessage(
      "Active Climate Action 🌱😌",
    ),
    "resultsPage9Help": MessageLookupByLibrary.simpleMessage(
      "Clicca sulle carte per mescolare",
    ),
    "resultsPage9Help_ger25": MessageLookupByLibrary.simpleMessage(
      "Click on the cards to shuffle",
    ),
    "resultsPage9Text1": MessageLookupByLibrary.simpleMessage(
      "Le elezioni hanno diversi argomenti, ma ce n\'è uno che veramente",
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
    "resultsShare": MessageLookupByLibrary.simpleMessage("Condividi"),
    "romania": MessageLookupByLibrary.simpleMessage("Romania"),
    "settingsPagePrivacyPolicy": MessageLookupByLibrary.simpleMessage(
      "Protezione dati",
    ),
    "settingsPageShareButtonText": MessageLookupByLibrary.simpleMessage(
      "Condividi",
    ),
    "settingsPageShareText": MessageLookupByLibrary.simpleMessage(
      "Se questo simpatico piccione non ti aiuterà a votare a giugno, nient\'altro lo farà. Ho usato l\'app e dovresti farlo anch tu:",
    ),
    "settingsPageShareText_ger25": MessageLookupByLibrary.simpleMessage(
      "If this cute pigeon can\'t help you vote in February, nothing will. I\'ve used the app and you should too:",
    ),
    "settingsPageSubtitle1": MessageLookupByLibrary.simpleMessage(
      "Sponsor principali",
    ),
    "settingsPageSubtitle1_ger25": MessageLookupByLibrary.simpleMessage(
      "Main Sponsors",
    ),
    "settingsPageSubtitle2": MessageLookupByLibrary.simpleMessage(
      "Partners Europei",
    ),
    "settingsPageSubtitle2_ger25": MessageLookupByLibrary.simpleMessage(
      "European Partners",
    ),
    "settingsPageSubtitle3": MessageLookupByLibrary.simpleMessage(
      "Partner accademico",
    ),
    "settingsPageSubtitle3_ger25": MessageLookupByLibrary.simpleMessage(
      "Academic Partners",
    ),
    "settingsPageSubtitle4": MessageLookupByLibrary.simpleMessage(
      "Partners Istituzionali Nazionali",
    ),
    "settingsPageSubtitle4_ger25": MessageLookupByLibrary.simpleMessage(
      "National Institutional Partners",
    ),
    "settingsPageSubtitle5": MessageLookupByLibrary.simpleMessage(
      "Service Providers",
    ),
    "settingsPageSubtitle5_ger25": MessageLookupByLibrary.simpleMessage(
      "Service Providers",
    ),
    "settingsPageSubtitleLanguage": MessageLookupByLibrary.simpleMessage(
      "Preferisco usare quest\'app in",
    ),
    "settingsPageTextAbout": MessageLookupByLibrary.simpleMessage(
      "Palumba non è una compagnia, non è un partito politico, non è un ente governativo. Siamo un\'associazione no-profit indipendente con più di 120 giovani da tutta Europa che si sono riuniti la scorsa estate ed iniziato a creare l\'app. Abbiamo un solo obbiettivo: aiutarti a capire meglio come funzionano le Elezioni Europee e quali candidati potrebbero essere più vicini alle tue idee, affinché tu possa votare con più sicurezza per le persone che supportano le tue priorità. Il nostro algoritmo è open-source, le dichiarazioni che voterai sono state riviste da scienziati politici, e i tuoi dati sono così criptati che non c\'è modo di identificarti ;)",
    ),
    "settingsPageTextElection": MessageLookupByLibrary.simpleMessage(
      "To change the questionnaire, click on the current one",
    ),
    "settingsPageTextLanguage": MessageLookupByLibrary.simpleMessage(
      "Per cambiare la lingua, premi su quella attuale",
    ),
    "settingsPageTextPartners": MessageLookupByLibrary.simpleMessage(
      "È importante dirti che i partners non hanno potere editoriale sul contenuto dell\'app, che rimane un\'iniziativa imparziale con un obbiettivo chiaro: aiutarti a capire chi supporta le tue opinioni a livello europeo e nazionale.",
    ),
    "settingsPageTextPartners_ger25": MessageLookupByLibrary.simpleMessage(
      "Important to tell you that partners have no editorial power on the content of the app, which remains a non-partisan initiative with a clear goal: helping you understand who supports your opinions at the european and national levels.",
    ),
    "settingsPageTitleAbout": MessageLookupByLibrary.simpleMessage("Su di noi"),
    "settingsPageTitleAssociation": MessageLookupByLibrary.simpleMessage(
      "L\'associazione",
    ),
    "settingsPageTitleAssociation_ger25": MessageLookupByLibrary.simpleMessage(
      "The association",
    ),
    "settingsPageTitleElection": MessageLookupByLibrary.simpleMessage(
      "Election",
    ),
    "settingsPageTitleLanguage": MessageLookupByLibrary.simpleMessage("Lingua"),
    "settingsPageTitlePartners": MessageLookupByLibrary.simpleMessage(
      "Partners",
    ),
    "settingsPageTitlePartners_ger25": MessageLookupByLibrary.simpleMessage(
      "Partners",
    ),
    "shortAppName": MessageLookupByLibrary.simpleMessage("Palumba"),
    "skip": MessageLookupByLibrary.simpleMessage("Salta"),
    "spain": MessageLookupByLibrary.simpleMessage("Spagna"),
    "splashPageNoInternet": MessageLookupByLibrary.simpleMessage(
      "Sembra che tu non abbia una connessione internet",
    ),
    "statementsTutorialTurnInfo_ger25": MessageLookupByLibrary.simpleMessage(
      "Tap to turn & read more info",
    ),
    "sweden": MessageLookupByLibrary.simpleMessage("Svezia"),
    "textContinue": MessageLookupByLibrary.simpleMessage("Continua"),
    "yes": MessageLookupByLibrary.simpleMessage("Sì"),
  };
}
