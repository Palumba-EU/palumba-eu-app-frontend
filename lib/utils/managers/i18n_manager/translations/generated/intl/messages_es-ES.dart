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
      "Buscando \"matches\" para las listas de candidatos de ${country}  🔍";

  static String m3(country) =>
      "No se han encontrado partidos nacionales en ${country}";

  static String m4(country, group) =>
      "Los candidatos de ${country} más en línea con ${group}";

  static String m5(topic, percentage) =>
      "Si hablamos de ${topic}, te acercas en un ${percentage}% a la búsqueda de";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "alertServerErrorText": MessageLookupByLibrary.simpleMessage(
            "Algo ha ido mal. Inténtalo otra vez más tarde, por favor."),
        "alertServerErrorTitle": MessageLookupByLibrary.simpleMessage("¡Ups!"),
        "appName": MessageLookupByLibrary.simpleMessage("Palumba EU"),
        "cancel": MessageLookupByLibrary.simpleMessage("Cancelar"),
        "denmark": MessageLookupByLibrary.simpleMessage("Dinamarca"),
        "entranceMatchesFoundQuote": m0,
        "entranceStartButton":
            MessageLookupByLibrary.simpleMessage("Empezar con Palumba"),
        "entranceTitle1": MessageLookupByLibrary.simpleMessage(
            "Si esta palomita no te ayuda a votar en junio, no hay nada que hacer."),
        "entranceTitle2": MessageLookupByLibrary.simpleMessage(
            "Haz \"swipe\" con tu opinión sobre los temas que te importan."),
        "entranceTitle3": MessageLookupByLibrary.simpleMessage(
            "Descubre tu \"match\" y una orientación de voto para las elecciones."),
        "faq": MessageLookupByLibrary.simpleMessage("FAQ"),
        "france": MessageLookupByLibrary.simpleMessage("Francia"),
        "germany": MessageLookupByLibrary.simpleMessage("Alemania"),
        "homePageBackToTest":
            MessageLookupByLibrary.simpleMessage("Volver al test"),
        "homePageMatchesFoundQuote": m1,
        "homePageMyResults":
            MessageLookupByLibrary.simpleMessage("Tus resultados"),
        "homePageStartButton":
            MessageLookupByLibrary.simpleMessage("Empezar un nuevo test"),
        "hungary": MessageLookupByLibrary.simpleMessage("Hungría"),
        "languagePageSubtitle": MessageLookupByLibrary.simpleMessage(
            "Puedes cambiar de idioma en ajustes más a adelante."),
        "languagePageTitle": MessageLookupByLibrary.simpleMessage(
            "¿Empezamos en castellano? :)"),
        "loadingResultsPageTitle1": MessageLookupByLibrary.simpleMessage(
            "Estamos preparando tus resultados personalizados :)"),
        "loadingResultsPageTitle2": MessageLookupByLibrary.simpleMessage(
            "Tardaremos menos de los que cuesta conseguir entradas para Taylor Swift 👀 "),
        "loadingResultsPageTitle3": m2,
        "loadingResultsPageTitle4": MessageLookupByLibrary.simpleMessage(
            "Casi estamos, una última comprobación..."),
        "neutral": MessageLookupByLibrary.simpleMessage("Neutral"),
        "no": MessageLookupByLibrary.simpleMessage("No"),
        "ok": MessageLookupByLibrary.simpleMessage("Vale"),
        "onBoardingCardQuestion": MessageLookupByLibrary.simpleMessage(
            "No tengo ni idea de qué votar en las elecciones europeas de 2024"),
        "onBoardingLastStepTitle": MessageLookupByLibrary.simpleMessage(
            "Haz \"swipe\" según estés o no de acuerdo"),
        "onBoardingNotAnswerButton":
            MessageLookupByLibrary.simpleMessage("Prefiero no especificarlo"),
        "onBoardingStep1Subtitle":
            MessageLookupByLibrary.simpleMessage("No lo sé"),
        "onBoardingStep1Title":
            MessageLookupByLibrary.simpleMessage("¿Dónde vas a votar?"),
        "onBoardingStep2Title": MessageLookupByLibrary.simpleMessage("Mi edad"),
        "onBoardingStep3Option1": MessageLookupByLibrary.simpleMessage("Mujer"),
        "onBoardingStep3Option2":
            MessageLookupByLibrary.simpleMessage("Hombre"),
        "onBoardingStep3Option3":
            MessageLookupByLibrary.simpleMessage("De género fluido"),
        "onBoardingStep3Option4":
            MessageLookupByLibrary.simpleMessage("No binarie"),
        "onBoardingStep3Option5":
            MessageLookupByLibrary.simpleMessage("De otro género"),
        "onBoardingStep3Title": MessageLookupByLibrary.simpleMessage("Soy"),
        "poland": MessageLookupByLibrary.simpleMessage("Polonia"),
        "resultsPage10NopButton":
            MessageLookupByLibrary.simpleMessage("No, gracias"),
        "resultsPage10Title": MessageLookupByLibrary.simpleMessage(
            "¿Te avisamos cuando toque ir a votar?"),
        "resultsPage10YesButton":
            MessageLookupByLibrary.simpleMessage("Sí, porfiiii"),
        "resultsPage1Button": MessageLookupByLibrary.simpleMessage("Continuar"),
        "resultsPage1Text": MessageLookupByLibrary.simpleMessage(
            "A continuación te mostramos el grupo parlamentario de la UE que es más compatible contigo y las listas de candidatos nacionales en línea con él. Así podrás votarlas en junio en tu país. También te explicamos alguna que otra cosa más según lo que has respondido 😌"),
        "resultsPage1Title": MessageLookupByLibrary.simpleMessage(
            "Tienes un \"match\" y mucho más 👉👈"),
        "resultsPage2_1Title":
            MessageLookupByLibrary.simpleMessage("A decir verdad, entre el"),
        "resultsPage2_2Title": MessageLookupByLibrary.simpleMessage(
            "y tú hay como una verdadera Love Story (EU’s Version)"),
        "resultsPage3Title": MessageLookupByLibrary.simpleMessage(
            "Cómo de compatible eres con los grupos parlamentarios europeos"),
        "resultsPage4TitleBottom": MessageLookupByLibrary.simpleMessage(
            "Contra la pertenencia a la UE"),
        "resultsPage4TitleLeft":
            MessageLookupByLibrary.simpleMessage("Izquierda"),
        "resultsPage4TitleRight":
            MessageLookupByLibrary.simpleMessage("Derecha"),
        "resultsPage4TitleTop": MessageLookupByLibrary.simpleMessage(
            "A favor de la pertenencia a la UE"),
        "resultsPage4TitleUserHere":
            MessageLookupByLibrary.simpleMessage("It’s me, hi!"),
        "resultsPage5Title": MessageLookupByLibrary.simpleMessage(
            "Si hablamos de temas más específicos, ¿con qué grupo parlamentario europeo congenio más?"),
        "resultsPage5Topic1":
            MessageLookupByLibrary.simpleMessage("Cuestiones medioambientales"),
        "resultsPage5Topic2":
            MessageLookupByLibrary.simpleMessage("Derechos humanos y sociales"),
        "resultsPage5Topic3":
            MessageLookupByLibrary.simpleMessage("Intervención económica"),
        "resultsPage6Text": MessageLookupByLibrary.simpleMessage(
            "A continuación verás las listas de tu país con las que probablemente más concuerdes."),
        "resultsPage6_1Title": MessageLookupByLibrary.simpleMessage(
            "Vale, está guay saber qué grupo europeo me entiende..."),
        "resultsPage6_2Title": MessageLookupByLibrary.simpleMessage(
            "pero en las elecciones europeas se votan listas nacionales"),
        "resultsPage7Disclaimer": MessageLookupByLibrary.simpleMessage(
            "No están en ningún orden específico."),
        "resultsPage7NoLocalCandidates": m3,
        "resultsPage7Title": m4,
        "resultsPage8Help": MessageLookupByLibrary.simpleMessage(
            "¡Eres todo/a un/a activista por el clima! Crees que para afrontar la crisis climática se necesita una acción colectiva: todos tenemos que convertirla en una prioridad. No te importaría que la UE regulara las acciones de las empresas con ese fin. A fin de cuentas, ¿para qué vale el desarrollo económico si nuestro planeta acaba siendo inhabitable?"),
        "resultsPage8_1Text": m5,
        "resultsPage8_2Text": MessageLookupByLibrary.simpleMessage(
            "una acción climática activa 🌱😌"),
        "resultsPage9Help": MessageLookupByLibrary.simpleMessage(
            "Haz clic en las cartas para barajar"),
        "resultsPage9Text1": MessageLookupByLibrary.simpleMessage(
            "En las elecciones se tratan muchos temas, pero lo que realmente"),
        "resultsPage9Text2":
            MessageLookupByLibrary.simpleMessage("Belongs With Me 😌"),
        "resultsShare": MessageLookupByLibrary.simpleMessage("Compartir"),
        "romania": MessageLookupByLibrary.simpleMessage("Rumanía"),
        "settingsPagePrivacyPolicy":
            MessageLookupByLibrary.simpleMessage("Política de privacidad"),
        "settingsPageShareButtonText":
            MessageLookupByLibrary.simpleMessage("Compartir"),
        "settingsPageShareText": MessageLookupByLibrary.simpleMessage(
            "Si esta palomita no te ayuda a votar en junio, nada podrá. He usado la app y te la recomiendo:"),
        "settingsPageSubtitle1":
            MessageLookupByLibrary.simpleMessage("Principales patrocinadores"),
        "settingsPageSubtitle2":
            MessageLookupByLibrary.simpleMessage("Socios europeos"),
        "settingsPageSubtitle3":
            MessageLookupByLibrary.simpleMessage("Socios académicos"),
        "settingsPageSubtitle4": MessageLookupByLibrary.simpleMessage(
            "Socios institucionales nacionales"),
        "settingsPageSubtitle5":
            MessageLookupByLibrary.simpleMessage("Proveedores de servicios"),
        "settingsPageSubtitleLanguage":
            MessageLookupByLibrary.simpleMessage("Prefiero utilizar la app en"),
        "settingsPageTextAbout": MessageLookupByLibrary.simpleMessage(
            "Palumba no es ni una empresa, ni un partido, ni forma parte de ningún gobierno. Somos una asociación sin ánimo de lucro formada por más de 120 jóvenes 🐦 de toda Europa que se reunieron el verano pasado para empezar a crear esta app. Tenemos un objetivo: ayudarre a entender mejor cómo funcionan las elecciones europeas y qué listas de candidatos van más en línea con tus ideas para que puedas votar con seguridad a la gente que defiende tus prioridades. Nuestro algoritmo es de código abierto y las cuestiones sobre las que te preguntamos las han revisado politólogos. Además, encriptamos tus datos tan, tan, tan bien que es imposible que puedan identificarte :)"),
        "settingsPageTextLanguage": MessageLookupByLibrary.simpleMessage(
            "Para cambiar de idioma, haz clic que el que tienes seleccionado"),
        "settingsPageTextPartners": MessageLookupByLibrary.simpleMessage(
            "Es importante que sepas que nuestros socios no pueden tomar decisiones sobre el contenido de la app. Nuestra iniciativa no es partidista, nuestro único objetivo es bien claro: queremos ayudarte a entender quién apoya tus ideas a nivel nacional y europeo."),
        "settingsPageTitleAbout":
            MessageLookupByLibrary.simpleMessage("Sobre nosotros"),
        "settingsPageTitleAssociation":
            MessageLookupByLibrary.simpleMessage("Nuestra asociación"),
        "settingsPageTitleLanguage":
            MessageLookupByLibrary.simpleMessage("Idioma"),
        "settingsPageTitlePartners":
            MessageLookupByLibrary.simpleMessage("Socios"),
        "shortAppName": MessageLookupByLibrary.simpleMessage("Palumba"),
        "skip": MessageLookupByLibrary.simpleMessage("Saltar"),
        "spain": MessageLookupByLibrary.simpleMessage("España"),
        "splashPageNoInternet": MessageLookupByLibrary.simpleMessage(
            "Parece que no tienes conexión a internet"),
        "sweden": MessageLookupByLibrary.simpleMessage("Suecia"),
        "textContinue": MessageLookupByLibrary.simpleMessage("Continuar"),
        "yes": MessageLookupByLibrary.simpleMessage("Sí")
      };
}
