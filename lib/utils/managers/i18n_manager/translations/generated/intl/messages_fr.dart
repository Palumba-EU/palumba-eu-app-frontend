// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a fr locale. All the
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
  String get localeName => 'fr';

  static String m0(count) => "${count} matches trouvés dans les dernières 24h";

  static String m1(count) => "${count} matches trouvés dans les dernières 24h";

  static String m2(country) =>
      "Recherche de matches avec les listes de candidat·es en ${country} 🔍";

  static String m3(country) => "Aucune liste locale trouvée en ${country}";

  static String m4(country, group) =>
      "Les listes en ${country} les plus alignées avec ${group}";

  static String m5(topic, percentage) =>
      "Sur ${topic}, tu es ${percentage}% plus pour";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "alertServerErrorText": MessageLookupByLibrary.simpleMessage(
            "Quelque chose s’est mal passé de notre côté. Veuillez réessayer."),
        "alertServerErrorTitle": MessageLookupByLibrary.simpleMessage("Oups !"),
        "appName": MessageLookupByLibrary.simpleMessage("Palumba EU"),
        "cancel": MessageLookupByLibrary.simpleMessage("Annuler"),
        "denmark": MessageLookupByLibrary.simpleMessage("Danemark"),
        "entranceMatchesFoundQuote": m0,
        "entranceStartButton":
            MessageLookupByLibrary.simpleMessage("Lancer Palumba"),
        "entranceTitle1": MessageLookupByLibrary.simpleMessage(
            "Si ce pigeon n\'arrive pas à te faire voter en juin, rien n\'y arrivera."),
        "entranceTitle2": MessageLookupByLibrary.simpleMessage(
            "Swipe ton opinion sur une multitude de sujets."),
        "entranceTitle3": MessageLookupByLibrary.simpleMessage(
            "Découvre qui soutient tes priorités et candidate aux élections."),
        "faq": MessageLookupByLibrary.simpleMessage("FAQ"),
        "france": MessageLookupByLibrary.simpleMessage("France"),
        "germany": MessageLookupByLibrary.simpleMessage("Allemagne"),
        "homePageBackToTest":
            MessageLookupByLibrary.simpleMessage("Retour au test"),
        "homePageMatchesFoundQuote": m1,
        "homePageMyResults":
            MessageLookupByLibrary.simpleMessage("Mes résultats"),
        "homePageStartButton":
            MessageLookupByLibrary.simpleMessage("Lancer un nouveau test"),
        "hungary": MessageLookupByLibrary.simpleMessage("Hongrie"),
        "languagePageSubtitle": MessageLookupByLibrary.simpleMessage(
            "Cela pourra être modifié plus tard dans les paramètres."),
        "languagePageTitle": MessageLookupByLibrary.simpleMessage(
            "On continue en Français ? :)"),
        "loadingResultsPageTitle1": MessageLookupByLibrary.simpleMessage(
            "Tes résultats personnalisés sont en route :)"),
        "loadingResultsPageTitle2": MessageLookupByLibrary.simpleMessage(
            "Ça devrait être plus rapide que d\'obtenir des billets pour Taylor Swift 👀 "),
        "loadingResultsPageTitle3": m2,
        "loadingResultsPageTitle4": MessageLookupByLibrary.simpleMessage(
            "Presque prêt,<br>un dernier check..."),
        "neutral": MessageLookupByLibrary.simpleMessage("Neutre"),
        "no": MessageLookupByLibrary.simpleMessage("Non"),
        "ok": MessageLookupByLibrary.simpleMessage("Ok"),
        "onBoardingCardQuestion": MessageLookupByLibrary.simpleMessage(
            "Je n\'ai aucune idée de pour qui voter aux Élections Européennes 2024"),
        "onBoardingLastStepTitle": MessageLookupByLibrary.simpleMessage(
            "Swipe en fonction de ton opinion"),
        "onBoardingNotAnswerButton":
            MessageLookupByLibrary.simpleMessage("Préfère ne pas dire"),
        "onBoardingStep1Subtitle":
            MessageLookupByLibrary.simpleMessage("Je ne sais pas"),
        "onBoardingStep1Title":
            MessageLookupByLibrary.simpleMessage("Dans quel pays votes-tu ?"),
        "onBoardingStep2Title": MessageLookupByLibrary.simpleMessage("Mon âge"),
        "onBoardingStep3Option1": MessageLookupByLibrary.simpleMessage("Femme"),
        "onBoardingStep3Option2": MessageLookupByLibrary.simpleMessage("Homme"),
        "onBoardingStep3Option3":
            MessageLookupByLibrary.simpleMessage("Gender-fluide"),
        "onBoardingStep3Option4":
            MessageLookupByLibrary.simpleMessage("Non-binaire"),
        "onBoardingStep3Option5": MessageLookupByLibrary.simpleMessage("Autre"),
        "onBoardingStep3Title":
            MessageLookupByLibrary.simpleMessage("Je m\'identifie comme"),
        "poland": MessageLookupByLibrary.simpleMessage("Pologne"),
        "resultsPage10NopButton":
            MessageLookupByLibrary.simpleMessage("Non merci !"),
        "resultsPage10Title": MessageLookupByLibrary.simpleMessage(
            "Recevoir un rappel d\'aller voter ?"),
        "resultsPage10YesButton":
            MessageLookupByLibrary.simpleMessage("Ouiiiii"),
        "resultsPage1Button":
            MessageLookupByLibrary.simpleMessage("Appuie pour continuer"),
        "resultsPage1Text": MessageLookupByLibrary.simpleMessage(
            "Dans les écrans suivants, tu trouveras le groupe le plus compatible avec tes idées au Parlement européen, les listes locales correspondantes dans ton pays, et nous avons même trouvé quelques infos supplémentaires à partir de tes réponses 😌"),
        "resultsPage1Title":
            MessageLookupByLibrary.simpleMessage("Un match et bien plus 👉👈"),
        "resultsPage2_1Title":
            MessageLookupByLibrary.simpleMessage("En vrai, entre le"),
        "resultsPage2_2Title": MessageLookupByLibrary.simpleMessage(
            "et moi, c\'est une Love Story (EU\'s Version)"),
        "resultsPage3Title": MessageLookupByLibrary.simpleMessage(
            "Ma proximité avec les Groupes Parlementaires Européens"),
        "resultsPage4TitleBottom":
            MessageLookupByLibrary.simpleMessage("Anti Intégration européenne"),
        "resultsPage4TitleLeft":
            MessageLookupByLibrary.simpleMessage("de Gauche"),
        "resultsPage4TitleRight":
            MessageLookupByLibrary.simpleMessage("de Droite"),
        "resultsPage4TitleTop":
            MessageLookupByLibrary.simpleMessage("Pro Intégration européenne"),
        "resultsPage4TitleUserHere":
            MessageLookupByLibrary.simpleMessage("It’s me, hi!"),
        "resultsPage5Title": MessageLookupByLibrary.simpleMessage(
            "Sur des sujets plus spécifiques, de quel groupe suis-je plus proche ?"),
        "resultsPage5Topic1":
            MessageLookupByLibrary.simpleMessage("Questions environnementales"),
        "resultsPage5Topic2":
            MessageLookupByLibrary.simpleMessage("Droits Humains et Sociaux"),
        "resultsPage5Topic3":
            MessageLookupByLibrary.simpleMessage("Intervention Économique"),
        "resultsPage6Text": MessageLookupByLibrary.simpleMessage(
            "Dans l\'écran qui suit, tu peux découvrir les listes de candidat·es de ton pays qui sont les plus susceptibles de rejoindre ton groupe parlementaire européen."),
        "resultsPage6_1Title": MessageLookupByLibrary.simpleMessage(
            "Ok, c\'est cool de savoir quel groupe me convient..."),
        "resultsPage6_2Title": MessageLookupByLibrary.simpleMessage(
            "Mais aux Élections Européennes, on vote pour une liste locale"),
        "resultsPage7Disclaimer": MessageLookupByLibrary.simpleMessage(
            "Dans aucun ordre particulier."),
        "resultsPage7NoLocalCandidates": m3,
        "resultsPage7Title": m4,
        "resultsPage8Help": MessageLookupByLibrary.simpleMessage(
            "Tu es un combattant pour le climat ! Tu crois que pour lutter contre la crise climatique il faut une action collective et que chacun doit en faire sa grande priorité. Tu es favorable au fait que l\'Union Européenne régule les entreprises pour aider dans cet objectif. Après tout, à quoi ça sert d\'avoir de la \"croissance\" économique si la planète deviens invivable ?"),
        "resultsPage8_1Text": m5,
        "resultsPage8_2Text":
            MessageLookupByLibrary.simpleMessage("Action climatique 🌱😌"),
        "resultsPage9Help": MessageLookupByLibrary.simpleMessage(
            "Appuie sur la carte pour en voir d\'autres"),
        "resultsPage9Text1": MessageLookupByLibrary.simpleMessage(
            "Les élections portent sur beaucoup de sujets, mais il y a une chose qui vraiment"),
        "resultsPage9Text2":
            MessageLookupByLibrary.simpleMessage("Belongs With Me 🫡"),
        "resultsShare": MessageLookupByLibrary.simpleMessage("Partager"),
        "romania": MessageLookupByLibrary.simpleMessage("Roumanie"),
        "settingsPagePrivacyPolicy":
            MessageLookupByLibrary.simpleMessage("Protection des données"),
        "settingsPageShareButtonText":
            MessageLookupByLibrary.simpleMessage("Partager"),
        "settingsPageSubtitle1":
            MessageLookupByLibrary.simpleMessage("Sponsors Principaux"),
        "settingsPageSubtitle2":
            MessageLookupByLibrary.simpleMessage("Partenaires Européens"),
        "settingsPageSubtitle3":
            MessageLookupByLibrary.simpleMessage("Partenaire académique"),
        "settingsPageSubtitle4": MessageLookupByLibrary.simpleMessage(
            "Partenaires Institutionnels Nationaux"),
        "settingsPageSubtitle5":
            MessageLookupByLibrary.simpleMessage("Prestataires de services"),
        "settingsPageSubtitleLanguage": MessageLookupByLibrary.simpleMessage(
            "Je préfère utiliser Palumba en"),
        "settingsPageTextAbout": MessageLookupByLibrary.simpleMessage(
            "Palumba n\'est ni une entreprise, ni un parti politique, ni un gouvernement. Nous sommes une association indépendante à but non lucratif de plus de 120 jeunes 🐦 de toute l\'Europe qui se sont réuni·es l\'été dernier et ont commencé à créer cette application. Nous avons un objectif : t\'aider à mieux comprendre comment fonctionnent les élections européennes et quelles listes de candidat·es pourraient correspondre à tes idées, pour que tu puisses voter plus en confiance pour celles et ceux qui soutiennent tes priorités. Notre algorithme est open-source, les déclarations sur lesquelles tu swipes ont été revues par des chercheur·ses, et tes données sont tellement anonymisées que nous n\'avons aucun moyen de t\'identifier :)"),
        "settingsPageTextLanguage": MessageLookupByLibrary.simpleMessage(
            "Pour changer la langue, clique sur celle ci-dessous"),
        "settingsPageTextPartners": MessageLookupByLibrary.simpleMessage(
            "Important de te préciser que les partenaires n\'ont pas de pouvoir éditorial sur le contenu de l\'application, qui reste une initiative non partisane avec un objectif clair : t\'aider à comprendre qui soutient tes opinions aux niveaux européen et national."),
        "settingsPageTitleAbout":
            MessageLookupByLibrary.simpleMessage("À propos"),
        "settingsPageTitleAssociation":
            MessageLookupByLibrary.simpleMessage("L\'association"),
        "settingsPageTitleLanguage":
            MessageLookupByLibrary.simpleMessage("Langue"),
        "settingsPageTitlePartners":
            MessageLookupByLibrary.simpleMessage("Partenaires"),
        "shortAppName": MessageLookupByLibrary.simpleMessage("Palumba"),
        "skip": MessageLookupByLibrary.simpleMessage("Ignorer"),
        "spain": MessageLookupByLibrary.simpleMessage("Espagne"),
        "splashPageNoInternet": MessageLookupByLibrary.simpleMessage(
            "On dirait que tu n\'es plus connecté à internet :("),
        "sweden": MessageLookupByLibrary.simpleMessage("Suède"),
        "textContinue": MessageLookupByLibrary.simpleMessage("Continuer"),
        "yes": MessageLookupByLibrary.simpleMessage("Oui")
      };
}
