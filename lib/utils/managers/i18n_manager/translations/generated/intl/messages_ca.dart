// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a ca locale. All the
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
  String get localeName => 'ca';

  static String m0(count) =>
      "${count} \'match\' trobats en les darreres 24 hores";

  static String m1(count) =>
      "${count} \'matches\' trobats en les últimes 24 hores";

  static String m2(country) =>
      "Trobar coincidències amb llistes de candidats a ${country} 🔍";

  static String m3(country) =>
      "No s\'ha trobat cap partit polític local a ${country}";

  static String m4(country, group) =>
      "Aquestes són les llistes de candidats locals que coincideixen al vostre país";

  static String m5(topic, percentage) =>
      "En ${topic}, et decantes un ${percentage}% cap a";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "alertServerErrorText": MessageLookupByLibrary.simpleMessage(
            "Alguna cosa no ens està funcionant bé. Si us plau, intenta-ho més tard."),
        "alertServerErrorTitle": MessageLookupByLibrary.simpleMessage("Vaja!"),
        "appName": MessageLookupByLibrary.simpleMessage("Palumba EU"),
        "cancel": MessageLookupByLibrary.simpleMessage("Cancel·lar"),
        "denmark": MessageLookupByLibrary.simpleMessage("Dinamarca"),
        "entranceMatchesFoundQuote": m0,
        "entranceStartButton":
            MessageLookupByLibrary.simpleMessage("Començar Palumba"),
        "entranceTitle1": MessageLookupByLibrary.simpleMessage(
            "Si aquest colom tan bufó no t\'ajuda a votar al juny, res ho farà."),
        "entranceTitle2": MessageLookupByLibrary.simpleMessage(
            "Fes \"swipe\" amb la teva opinió sobre els temes que t\'importen."),
        "entranceTitle3": MessageLookupByLibrary.simpleMessage(
            "Descobreix el teu matx i una orientació de qui votar a les eleccions."),
        "faq": MessageLookupByLibrary.simpleMessage("FAQ"),
        "france": MessageLookupByLibrary.simpleMessage("França"),
        "germany": MessageLookupByLibrary.simpleMessage("Alemanya"),
        "homePageBackToTest":
            MessageLookupByLibrary.simpleMessage("Tornar al test"),
        "homePageMatchesFoundQuote": m1,
        "homePageMyResults":
            MessageLookupByLibrary.simpleMessage("Els meus resultats"),
        "homePageStartButton":
            MessageLookupByLibrary.simpleMessage("Comença un nou test"),
        "hungary": MessageLookupByLibrary.simpleMessage("Hongria"),
        "languagePageSubtitle": MessageLookupByLibrary.simpleMessage(
            "Més endavant podràs canviar-ho a la pàgina de configuració."),
        "languagePageTitle":
            MessageLookupByLibrary.simpleMessage("Continuem en català? :)"),
        "loadingResultsPageTitle1": MessageLookupByLibrary.simpleMessage(
            "Els teus resultats personalitzats estan en camí :)"),
        "loadingResultsPageTitle2": MessageLookupByLibrary.simpleMessage(
            "Això serà més ràpid que aconseguir entrades per Taylor Swift 👀 "),
        "loadingResultsPageTitle3": m2,
        "loadingResultsPageTitle4": MessageLookupByLibrary.simpleMessage(
            "Quasi preparat, una darrera comprovació..."),
        "neutral": MessageLookupByLibrary.simpleMessage("Neutral"),
        "no": MessageLookupByLibrary.simpleMessage("No"),
        "ok": MessageLookupByLibrary.simpleMessage("D\'acord"),
        "onBoardingCardQuestion": MessageLookupByLibrary.simpleMessage(
            "No tinc ni idea de qui votar a les eleccions europees del 2024"),
        "onBoardingLastStepTitle": MessageLookupByLibrary.simpleMessage(
            "Llisca en funció del teu grau d\'acord"),
        "onBoardingNotAnswerButton":
            MessageLookupByLibrary.simpleMessage("Prefereix-ho no dir-ho"),
        "onBoardingStep1Subtitle":
            MessageLookupByLibrary.simpleMessage("No ho sé"),
        "onBoardingStep1Title":
            MessageLookupByLibrary.simpleMessage("On votareu?"),
        "onBoardingStep2Title":
            MessageLookupByLibrary.simpleMessage("La meva edat"),
        "onBoardingStep3Option1": MessageLookupByLibrary.simpleMessage("Dona"),
        "onBoardingStep3Option2": MessageLookupByLibrary.simpleMessage("Home"),
        "onBoardingStep3Option3":
            MessageLookupByLibrary.simpleMessage("Gènere-fluid"),
        "onBoardingStep3Option4":
            MessageLookupByLibrary.simpleMessage("No binari"),
        "onBoardingStep3Option5":
            MessageLookupByLibrary.simpleMessage("Altres"),
        "onBoardingStep3Title":
            MessageLookupByLibrary.simpleMessage("El meu gènere és"),
        "poland": MessageLookupByLibrary.simpleMessage("Polònia"),
        "resultsPage10NopButton":
            MessageLookupByLibrary.simpleMessage("Nope, gràcies!"),
        "resultsPage10Title": MessageLookupByLibrary.simpleMessage(
            "Una notificació quan toqui anar a votar?"),
        "resultsPage10YesButton":
            MessageLookupByLibrary.simpleMessage("Síííííí"),
        "resultsPage1Button":
            MessageLookupByLibrary.simpleMessage("Clic per a continuar"),
        "resultsPage1Text": MessageLookupByLibrary.simpleMessage(
            "A les pantalles següents descobriràs amb quin grup del Parlament de la UE ets més compatible, la correspondència amb les llistes locals del teu país per votar al juny i, fins i tot, algunes coses addicionals que hem descobert a partir de les teves respostes 😌"),
        "resultsPage1Title":
            MessageLookupByLibrary.simpleMessage("T\'hem trobat un \'match\'!"),
        "resultsPage2_1Title":
            MessageLookupByLibrary.simpleMessage("Mira, entre"),
        "resultsPage2_2Title": MessageLookupByLibrary.simpleMessage(
            "i jo, hi ha una mena de Love Story (EU\'s Version)"),
        "resultsPage3Title": MessageLookupByLibrary.simpleMessage(
            "La teva compatibilitat amb els grups del Parlament Europeu"),
        "resultsPage4TitleBottom":
            MessageLookupByLibrary.simpleMessage("Anti-integració UE"),
        "resultsPage4TitleLeft":
            MessageLookupByLibrary.simpleMessage("Esquerra"),
        "resultsPage4TitleRight": MessageLookupByLibrary.simpleMessage("Dreta"),
        "resultsPage4TitleTop":
            MessageLookupByLibrary.simpleMessage("Pro-integració UE"),
        "resultsPage4TitleUserHere":
            MessageLookupByLibrary.simpleMessage("It\'s me, hi!"),
        "resultsPage5Title": MessageLookupByLibrary.simpleMessage(
            "D\'acord, és genial saber quin grup et porta..."),
        "resultsPage5Topic1":
            MessageLookupByLibrary.simpleMessage("Environmental issues"),
        "resultsPage5Topic2":
            MessageLookupByLibrary.simpleMessage("Human & Social Rights"),
        "resultsPage5Topic3":
            MessageLookupByLibrary.simpleMessage("Economic intervention"),
        "resultsPage6Text": MessageLookupByLibrary.simpleMessage(
            "A les següents pantalles, descobriràs el teu grup més compatible al Parlament Europeu, les canidatures coincidents per votar al juny al teu país, i fins i tot hem trobat algunes coses més basades en les teves respostes 😌"),
        "resultsPage6_1Title": MessageLookupByLibrary.simpleMessage(
            "Val, està guai saber amb quin grup encaixo..."),
        "resultsPage6_2Title": MessageLookupByLibrary.simpleMessage(
            "Però a les eleccions europees, votem per a candidatures locals"),
        "resultsPage7Disclaimer": MessageLookupByLibrary.simpleMessage(
            "No estan en cap ordre en concret"),
        "resultsPage7NoLocalCandidates": m3,
        "resultsPage7Title": m4,
        "resultsPage8Help": MessageLookupByLibrary.simpleMessage(
            "Ets un lluitador climàtic! Creus que donar resposta a la crisi climàtica requereix d\'acció col·lectiva, amb tothom prioritzant el tema. No sap gens de greu que la UE reguli les empreses per a fer-ho possible. Al final, de què serveix el creixement econòmic si el planeta es torna inhabitable?"),
        "resultsPage8_1Text": m5,
        "resultsPage8_2Text":
            MessageLookupByLibrary.simpleMessage("Active Climate Action 🌱😌"),
        "resultsPage9Help": MessageLookupByLibrary.simpleMessage(
            "Fes clic a les cartes per barrejar-les"),
        "resultsPage9Text1": MessageLookupByLibrary.simpleMessage(
            "Les eleccions van de molts temes, però hi ha una cosa que realment"),
        "resultsPage9Text2":
            MessageLookupByLibrary.simpleMessage("Belongs With Me 🫡"),
        "resultsShare": MessageLookupByLibrary.simpleMessage("Comparteix"),
        "romania": MessageLookupByLibrary.simpleMessage("Romania"),
        "settingsPagePrivacyPolicy":
            MessageLookupByLibrary.simpleMessage("Política de Privacitat"),
        "settingsPageShareButtonText":
            MessageLookupByLibrary.simpleMessage("Compartir"),
        "settingsPageSubtitle1":
            MessageLookupByLibrary.simpleMessage("Patrocinadors principals"),
        "settingsPageSubtitle2":
            MessageLookupByLibrary.simpleMessage("Socis europeus"),
        "settingsPageSubtitle3":
            MessageLookupByLibrary.simpleMessage("Soci acadèmic"),
        "settingsPageSubtitle4": MessageLookupByLibrary.simpleMessage(
            "Socis institucionals nacionals"),
        "settingsPageSubtitle5":
            MessageLookupByLibrary.simpleMessage("Proveïdors del servei"),
        "settingsPageSubtitleLanguage": MessageLookupByLibrary.simpleMessage(
            "Prefereixo utilitzar l\'app en"),
        "settingsPageTextAbout": MessageLookupByLibrary.simpleMessage(
            "Palumba no és una empresa, ni un partit polític, ni un govern. Som una associació independent sense ànim de lucre de més de 120 joves 🐦 d\'arreu d\'Europa que es van trobar l\'estiu passat i van començar a crear aquesta app. Tenim un objectiu: ajudar-te a entendre millor com funcionen les eleccions europees i quines candidatures encaixen amb les vostres idees, perquè puguis votar amb més confiança a les persones que donen suport a les teves prioritats. El nostre algorisme és de codi obert, un consell científic de politòlegs ha revisat les frases en què fas \"swipe\" i les teves dades estan taaan encriptades que no tenim manera d\'identificar-te ni de rebot :)"),
        "settingsPageTextLanguage": MessageLookupByLibrary.simpleMessage(
            "Per canviar l\'idioma, fes clic sobre l\'actual"),
        "settingsPageTextPartners": MessageLookupByLibrary.simpleMessage(
            "És important que sàpigues que els Partners no tenen cap poder de decisió editorial sobre els continguts de l\'app, que és una iniciativa apartidista amb un objectiu clar: ajudar-te a entendre quines opcions polítiques recolzen les teves opinions a nivell europeu i nacional."),
        "settingsPageTitleAbout":
            MessageLookupByLibrary.simpleMessage("Sobre nosaltres"),
        "settingsPageTitleAssociation":
            MessageLookupByLibrary.simpleMessage("L\'Associació"),
        "settingsPageTitleLanguage":
            MessageLookupByLibrary.simpleMessage("Llengua"),
        "settingsPageTitlePartners":
            MessageLookupByLibrary.simpleMessage("Socis"),
        "shortAppName": MessageLookupByLibrary.simpleMessage("Palumba"),
        "skip": MessageLookupByLibrary.simpleMessage("Omet"),
        "spain": MessageLookupByLibrary.simpleMessage("Espanya"),
        "splashPageNoInternet": MessageLookupByLibrary.simpleMessage(
            "Sembla que no tens connexió a Internet"),
        "sweden": MessageLookupByLibrary.simpleMessage("Suècia"),
        "textContinue": MessageLookupByLibrary.simpleMessage("Continuar"),
        "yes": MessageLookupByLibrary.simpleMessage("Sí")
      };
}
