// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a es_ES locale. All the
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
  String get localeName => 'es_ES';

  static String m0(count) =>
      "${count} \"matches\" encontrados en las últimas 24 horas";

  static String m1(count) =>
      "${count} \"matches\" encontrados en las últimas 24 horas";

  static String m2(country) =>
      "Buscando \"matches\" para las candidaturas en ${country}  🔍";

  static String m3(country) =>
      "No se han encontrado partidos nacionales en ${country}";

  static String m4(country, group) =>
      "Los candidatos de ${country} más en línea con ${group}";

  static String m5(party) =>
      "Here’s a young candidate from ${party}* —shuffle to see more! They may not be on your ballot, but represent the future of their party!";

  static String m6(topic, percentage) =>
      "Si hablamos de ${topic}, te acercas en un ${percentage}% a la búsqueda de";

  static String m7(number, dimension) =>
      "Your answers are in the top ${number}% regarding ${dimension}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "alertServerErrorText": MessageLookupByLibrary.simpleMessage(
      "Algo ha ido mal. Inténtalo otra vez más tarde, por favor.",
    ),
    "alertServerErrorTitle": MessageLookupByLibrary.simpleMessage("¡Ups!"),
    "appName": MessageLookupByLibrary.simpleMessage("Palumba EU"),
    "cancel": MessageLookupByLibrary.simpleMessage("Cancelar"),
    "denmark": MessageLookupByLibrary.simpleMessage("Dinamarca"),
    "entranceMatchesFoundQuote": m0,
    "entranceStartButton": MessageLookupByLibrary.simpleMessage(
      "Empezar con Palumba",
    ),
    "entranceTitle1": MessageLookupByLibrary.simpleMessage(
      "Si esta palomita no te ayuda a votar en junio, no hay nada que hacer.",
    ),
    "entranceTitle1_ger25": MessageLookupByLibrary.simpleMessage(
      "If this cute pigeon can’t help you vote in February, nothing will.",
    ),
    "entranceTitle2": MessageLookupByLibrary.simpleMessage(
      "Haz \"swipe\" con tu opinión sobre los temas que te importan.",
    ),
    "entranceTitle2_ger25": MessageLookupByLibrary.simpleMessage(
      "Swipe your opinion on topics that matter to you.",
    ),
    "entranceTitle3": MessageLookupByLibrary.simpleMessage(
      "Descubre tu \"match\" y una orientación de voto para las elecciones.",
    ),
    "entranceTitle3_ger25": MessageLookupByLibrary.simpleMessage(
      "Find out your match and an orientation for who to vote for at the Elections.",
    ),
    "faq": MessageLookupByLibrary.simpleMessage("FAQ"),
    "france": MessageLookupByLibrary.simpleMessage("Francia"),
    "germany": MessageLookupByLibrary.simpleMessage("Alemania"),
    "homePageBackToTest": MessageLookupByLibrary.simpleMessage(
      "Volver al test",
    ),
    "homePageMatchesFoundQuote": m1,
    "homePageMyResults": MessageLookupByLibrary.simpleMessage("Tus resultados"),
    "homePageStartButton": MessageLookupByLibrary.simpleMessage(
      "Empezar un nuevo test",
    ),
    "hungary": MessageLookupByLibrary.simpleMessage("Hungría"),
    "languagePageSubtitle": MessageLookupByLibrary.simpleMessage(
      "Puedes cambiar de idioma en ajustes más a adelante.",
    ),
    "languagePageTitle": MessageLookupByLibrary.simpleMessage(
      "¿Empezamos en castellano? :)",
    ),
    "loadingResultsPageTitle1": MessageLookupByLibrary.simpleMessage(
      "Estamos preparando tus resultados personalizados :)",
    ),
    "loadingResultsPageTitle1_ger25": MessageLookupByLibrary.simpleMessage(
      "Your personal results are on their way :)",
    ),
    "loadingResultsPageTitle2": MessageLookupByLibrary.simpleMessage(
      "Tardaremos menos de los que cuesta conseguir entradas para Taylor Swift 👀 ",
    ),
    "loadingResultsPageTitle2_ger25": MessageLookupByLibrary.simpleMessage(
      "This is going faster than the Deutsche Bahn",
    ),
    "loadingResultsPageTitle3": m2,
    "loadingResultsPageTitle3_ger25": MessageLookupByLibrary.simpleMessage(
      "Hold on, it’s almost done - pinky promise, no layovers!",
    ),
    "loadingResultsPageTitle4": MessageLookupByLibrary.simpleMessage(
      "Casi estamos, una última comprobación...",
    ),
    "loadingResultsPageTitle4_ger25": MessageLookupByLibrary.simpleMessage(
      "Almost ready, one last check...",
    ),
    "messageScreenNo_ger25": MessageLookupByLibrary.simpleMessage(
      "No, thanks!",
    ),
    "messageScreenYes_ger25": MessageLookupByLibrary.simpleMessage("Yesss!"),
    "message_five_cards_left": MessageLookupByLibrary.simpleMessage(
      "Últimas 5 preguntas :)",
    ),
    "message_half_test_done": MessageLookupByLibrary.simpleMessage(
      "Sigue así, ¡ya vas por la mitad!",
    ),
    "neutral": MessageLookupByLibrary.simpleMessage("Neutral"),
    "no": MessageLookupByLibrary.simpleMessage("No"),
    "ok": MessageLookupByLibrary.simpleMessage("Vale"),
    "onBoardingCardQuestion": MessageLookupByLibrary.simpleMessage(
      "No tengo ni idea de qué votar en las elecciones europeas de 2024",
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
      "Haz \"swipe\" según estés o no de acuerdo",
    ),
    "onBoardingNotAnswerButton": MessageLookupByLibrary.simpleMessage(
      "Prefiero no especificarlo",
    ),
    "onBoardingStep1Subtitle": MessageLookupByLibrary.simpleMessage("No lo sé"),
    "onBoardingStep1Title": MessageLookupByLibrary.simpleMessage(
      "¿Dónde vas a votar?",
    ),
    "onBoardingStep2Title": MessageLookupByLibrary.simpleMessage("Mi edad"),
    "onBoardingStep3Option1": MessageLookupByLibrary.simpleMessage("Mujer"),
    "onBoardingStep3Option2": MessageLookupByLibrary.simpleMessage("Hombre"),
    "onBoardingStep3Option3": MessageLookupByLibrary.simpleMessage(
      "De género fluido",
    ),
    "onBoardingStep3Option4": MessageLookupByLibrary.simpleMessage(
      "No binarie",
    ),
    "onBoardingStep3Option5": MessageLookupByLibrary.simpleMessage(
      "De otro género",
    ),
    "onBoardingStep3Title": MessageLookupByLibrary.simpleMessage("Soy"),
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
    "poland": MessageLookupByLibrary.simpleMessage("Polonia"),
    "resultsPage10NopButton": MessageLookupByLibrary.simpleMessage(
      "No, gracias",
    ),
    "resultsPage10NopButton_ger25": MessageLookupByLibrary.simpleMessage(
      "No thanks!",
    ),
    "resultsPage10Title": MessageLookupByLibrary.simpleMessage(
      "¿Te avisamos cuando toque ir a votar?",
    ),
    "resultsPage10Title_ger25": MessageLookupByLibrary.simpleMessage(
      "A notification when it’s time to go vote?",
    ),
    "resultsPage10YesButton": MessageLookupByLibrary.simpleMessage(
      "Sí, porfiiii",
    ),
    "resultsPage10YesButton_ger25": MessageLookupByLibrary.simpleMessage(
      "Yesssss",
    ),
    "resultsPage1Button": MessageLookupByLibrary.simpleMessage("Continuar"),
    "resultsPage1Button_ger25": MessageLookupByLibrary.simpleMessage(
      "Press to continue",
    ),
    "resultsPage1Text": MessageLookupByLibrary.simpleMessage(
      "A continuación te mostramos el grupo parlamentario de la UE que es más compatible contigo y las listas de candidatos nacionales en línea con él. Así podrás votarlas en junio en tu país. También te explicamos alguna que otra cosa más según lo que has respondido 😌",
    ),
    "resultsPage1Text_ger25": MessageLookupByLibrary.simpleMessage(
      "In the next screens, you’ll discover which party is compatible with you. And we even found a few extra things based on your answers!",
    ),
    "resultsPage1Title": MessageLookupByLibrary.simpleMessage(
      "Tienes un \"match\" y mucho más 👉👈",
    ),
    "resultsPage1Title_ger25": MessageLookupByLibrary.simpleMessage(
      "A match and much more",
    ),
    "resultsPage2_1Title": MessageLookupByLibrary.simpleMessage(
      "Oye, entre el",
    ),
    "resultsPage2_1Title_ger25": MessageLookupByLibrary.simpleMessage(
      "Honestly,",
    ),
    "resultsPage2_2Title": MessageLookupByLibrary.simpleMessage(
      "y tú hay como una verdadera Love Story (EU’s Version)",
    ),
    "resultsPage2_2Title_ger25": MessageLookupByLibrary.simpleMessage(
      "and I, we are like Currywurst and fries",
    ),
    "resultsPage3Title": MessageLookupByLibrary.simpleMessage(
      "Cómo de compatible eres con los grupos parlamentarios europeos",
    ),
    "resultsPage3Title_ger25": MessageLookupByLibrary.simpleMessage(
      "How close I am to the parties running in this German election",
    ),
    "resultsPage4TitleBottom": MessageLookupByLibrary.simpleMessage(
      "Contra la pertenencia a la UE",
    ),
    "resultsPage4TitleBottom_ger25": MessageLookupByLibrary.simpleMessage(
      "Socially conservative",
    ),
    "resultsPage4TitleLeft": MessageLookupByLibrary.simpleMessage("Izquierda"),
    "resultsPage4TitleLeft_ger25": MessageLookupByLibrary.simpleMessage(
      "Economic intervention",
    ),
    "resultsPage4TitleRight": MessageLookupByLibrary.simpleMessage("Derecha"),
    "resultsPage4TitleRight_ger25": MessageLookupByLibrary.simpleMessage(
      "Free market economics",
    ),
    "resultsPage4TitleTop": MessageLookupByLibrary.simpleMessage(
      "A favor de la pertenencia a la UE",
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
      "Si hablamos de temas más específicos, ¿con qué grupo parlamentario europeo congenio más?",
    ),
    "resultsPage5Title_ger25": MessageLookupByLibrary.simpleMessage(
      "On more specific topics, which parties am I closest to?",
    ),
    "resultsPage5Topic1": MessageLookupByLibrary.simpleMessage(
      "Cuestiones medioambientales",
    ),
    "resultsPage5Topic1_ger25": MessageLookupByLibrary.simpleMessage(
      "Environmental issues",
    ),
    "resultsPage5Topic2": MessageLookupByLibrary.simpleMessage(
      "Derechos humanos y sociales",
    ),
    "resultsPage5Topic2_ger25": MessageLookupByLibrary.simpleMessage("Economy"),
    "resultsPage5Topic3": MessageLookupByLibrary.simpleMessage(
      "Intervención económica",
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
      "A continuación verás las listas de tu país con las que probablemente más concuerdes.",
    ),
    "resultsPage6Text_ger25": MessageLookupByLibrary.simpleMessage(
      "Overwhelmed? No worries, we’ve thought of that! We have some options for you on the next slide!",
    ),
    "resultsPage6_1Title": MessageLookupByLibrary.simpleMessage(
      "Vale, está guay saber qué grupo europeo me entiende...",
    ),
    "resultsPage6_1Title_ger25": MessageLookupByLibrary.simpleMessage(
      "Okay, it is cool to know which party gets me…",
    ),
    "resultsPage6_2Title": MessageLookupByLibrary.simpleMessage(
      "pero en las elecciones europeas se votan listas nacionales",
    ),
    "resultsPage6_2Title_ger25": MessageLookupByLibrary.simpleMessage(
      "But at the German election you also have the option to vote for a specific candidate",
    ),
    "resultsPage7Disclaimer": MessageLookupByLibrary.simpleMessage(
      "No están en ningún orden específico.",
    ),
    "resultsPage7Disclaimer_ger25": MessageLookupByLibrary.simpleMessage(
      "* On this screen only candidates from the following parties can be displayed: CDU/CSU, SPD, Grüne, AfD, Linke, FDP, BSW.",
    ),
    "resultsPage7NoLocalCandidates": m3,
    "resultsPage7Title": m4,
    "resultsPage7Title_ger25": m5,
    "resultsPage8Help": MessageLookupByLibrary.simpleMessage(
      "¡Eres todo/a un/a activista por el clima! Crees que para afrontar la crisis climática se necesita una acción colectiva: todos tenemos que convertirla en una prioridad. No te importaría que la UE regulara las acciones de las empresas con ese fin. A fin de cuentas, ¿para qué vale el desarrollo económico si nuestro planeta acaba siendo inhabitable?",
    ),
    "resultsPage8Help_ger25": MessageLookupByLibrary.simpleMessage(
      "You are a climate change fighter! You believe that tackling the climate crisis requires collective action, with everyone making it a top priority. You do not mind the Germany regulating companies to that end. After all, what use is economic growth if the planet becomes inhabitable? #ClimateActionNow #PlanetFirst",
    ),
    "resultsPage8_1Text": m6,
    "resultsPage8_1Text_ger25": m7,
    "resultsPage8_2Text": MessageLookupByLibrary.simpleMessage(
      "una acción climática activa 🌱😌",
    ),
    "resultsPage8_2Text_ger25": MessageLookupByLibrary.simpleMessage(
      "Active Climate Action 🌱😌",
    ),
    "resultsPage9Help": MessageLookupByLibrary.simpleMessage(
      "Haz clic en las cartas para barajar",
    ),
    "resultsPage9Help_ger25": MessageLookupByLibrary.simpleMessage(
      "Click on the cards to shuffle",
    ),
    "resultsPage9Text1": MessageLookupByLibrary.simpleMessage(
      "En las elecciones se tratan muchos temas, pero lo que realmente",
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
    "resultsShare": MessageLookupByLibrary.simpleMessage("Compartir"),
    "romania": MessageLookupByLibrary.simpleMessage("Rumanía"),
    "settingsPagePrivacyPolicy": MessageLookupByLibrary.simpleMessage(
      "Política de privacidad",
    ),
    "settingsPageShareButtonText": MessageLookupByLibrary.simpleMessage(
      "Compartir",
    ),
    "settingsPageShareText": MessageLookupByLibrary.simpleMessage(
      "Si esta palomita no te ayuda a votar en junio, nada podrá. He usado la app y te la recomiendo:",
    ),
    "settingsPageShareText_ger25": MessageLookupByLibrary.simpleMessage(
      "If this cute pigeon can\'t help you vote in February, nothing will. I\'ve used the app and you should too:",
    ),
    "settingsPageSubtitle1": MessageLookupByLibrary.simpleMessage(
      "Principales patrocinadores",
    ),
    "settingsPageSubtitle1_ger25": MessageLookupByLibrary.simpleMessage(
      "Main Sponsors",
    ),
    "settingsPageSubtitle2": MessageLookupByLibrary.simpleMessage(
      "Socios europeos",
    ),
    "settingsPageSubtitle2_ger25": MessageLookupByLibrary.simpleMessage(
      "European Partners",
    ),
    "settingsPageSubtitle3": MessageLookupByLibrary.simpleMessage(
      "Socios académicos",
    ),
    "settingsPageSubtitle3_ger25": MessageLookupByLibrary.simpleMessage(
      "Academic Partners",
    ),
    "settingsPageSubtitle4": MessageLookupByLibrary.simpleMessage(
      "Socios institucionales nacionales",
    ),
    "settingsPageSubtitle4_ger25": MessageLookupByLibrary.simpleMessage(
      "National Institutional Partners",
    ),
    "settingsPageSubtitle5": MessageLookupByLibrary.simpleMessage(
      "Proveedores de servicios",
    ),
    "settingsPageSubtitle5_ger25": MessageLookupByLibrary.simpleMessage(
      "Service Providers",
    ),
    "settingsPageSubtitleLanguage": MessageLookupByLibrary.simpleMessage(
      "Prefiero utilizar la app en",
    ),
    "settingsPageTextAbout": MessageLookupByLibrary.simpleMessage(
      "Palumba no es ni una empresa, ni un partido, ni forma parte de ningún gobierno. Somos una asociación sin ánimo de lucro formada por más de 120 jóvenes 🐦 de toda Europa que se reunieron el verano pasado para empezar a crear esta app. Tenemos un objetivo: ayudarre a entender mejor cómo funcionan las elecciones europeas y qué listas de candidatos van más en línea con tus ideas para que puedas votar con seguridad a la gente que defiende tus prioridades. Nuestro algoritmo es de código abierto y las cuestiones sobre las que te preguntamos las han revisado politólogos. Además, encriptamos tus datos tan, tan, tan bien que es imposible que puedan identificarte :)",
    ),
    "settingsPageTextLanguage": MessageLookupByLibrary.simpleMessage(
      "Para cambiar de idioma, haz clic que el que tienes seleccionado",
    ),
    "settingsPageTextPartners": MessageLookupByLibrary.simpleMessage(
      "Es importante que sepas que nuestros socios no pueden tomar decisiones sobre el contenido de la app. Nuestra iniciativa no es partidista, nuestro único objetivo es bien claro: queremos ayudarte a entender quién apoya tus ideas a nivel nacional y europeo.",
    ),
    "settingsPageTextPartners_ger25": MessageLookupByLibrary.simpleMessage(
      "Important to tell you that partners have no editorial power on the content of the app, which remains a non-partisan initiative with a clear goal: helping you understand who supports your opinions at the european and national levels.",
    ),
    "settingsPageTitleAbout": MessageLookupByLibrary.simpleMessage(
      "Sobre nosotros",
    ),
    "settingsPageTitleAssociation": MessageLookupByLibrary.simpleMessage(
      "Nuestra asociación",
    ),
    "settingsPageTitleAssociation_ger25": MessageLookupByLibrary.simpleMessage(
      "The association",
    ),
    "settingsPageTitleLanguage": MessageLookupByLibrary.simpleMessage("Idioma"),
    "settingsPageTitlePartners": MessageLookupByLibrary.simpleMessage("Socios"),
    "settingsPageTitlePartners_ger25": MessageLookupByLibrary.simpleMessage(
      "Partners",
    ),
    "shortAppName": MessageLookupByLibrary.simpleMessage("Palumba"),
    "skip": MessageLookupByLibrary.simpleMessage("Saltar"),
    "spain": MessageLookupByLibrary.simpleMessage("España"),
    "splashPageNoInternet": MessageLookupByLibrary.simpleMessage(
      "Parece que no tienes conexión a internet",
    ),
    "sweden": MessageLookupByLibrary.simpleMessage("Suecia"),
    "textContinue": MessageLookupByLibrary.simpleMessage("Continuar"),
    "yes": MessageLookupByLibrary.simpleMessage("Sí"),
  };
}
