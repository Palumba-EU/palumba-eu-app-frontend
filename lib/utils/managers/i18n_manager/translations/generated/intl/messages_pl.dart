// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a pl locale. All the
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
  String get localeName => 'pl';

  static String m0(count) =>
      "${count} matchy znalezionych w ciągu ostatnich 24 godzin";

  static String m1(count) =>
      "${count} matchy znaleziono w ciągu ostatnich 24 godzin";

  static String m2(country) =>
      "Szukamy matchy z listami kandydatów w ${country}  🔍";

  static String m3(country) =>
      "Finding matches with candidates lists in ${country}  🔍";

  static String m4(country) => "Nie znaleziono lokalnych grup w/we ${country}";

  static String m5(country) => "No local parties found in ${country}";

  static String m6(country, group) =>
      "Kandydaci w/we ${country} najbardziej zgodni z ${group}";

  static String m7(country, group) =>
      "The candidates in ${country} most aligned with ${group}";

  static String m8(topic, percentage) =>
      "W kwestii ${topic}, jesteś w ${percentage}% za";

  static String m9(topic, percentage) =>
      "On ${topic}, you’re ${percentage}% more into";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "alertServerErrorText": MessageLookupByLibrary.simpleMessage(
            "Coś poszło nie tak po naszej stronie. Spróbuj ponownie później."),
        "alertServerErrorTitle": MessageLookupByLibrary.simpleMessage("Ups!"),
        "appName": MessageLookupByLibrary.simpleMessage("Palumba EU"),
        "cancel": MessageLookupByLibrary.simpleMessage("Anuluj"),
        "denmark": MessageLookupByLibrary.simpleMessage("Dania"),
        "entranceMatchesFoundQuote": m0,
        "entranceStartButton":
            MessageLookupByLibrary.simpleMessage("Rozpocznij Palumbę"),
        "entranceTitle1": MessageLookupByLibrary.simpleMessage(
            "Jeżeli ten uroczy gołąb nie zachęci Cię do głosowania w czerwcu, to nic innego nie da rady."),
        "entranceTitle1_ger25": MessageLookupByLibrary.simpleMessage(
            "If this cute pigeon can’t help you vote in February, nothing will."),
        "entranceTitle2": MessageLookupByLibrary.simpleMessage(
            "Przesuń palcem w kwestiach, które są dla Ciebie ważne."),
        "entranceTitle2_ger25": MessageLookupByLibrary.simpleMessage(
            "Swipe your opinion on topics that matter to you."),
        "entranceTitle3": MessageLookupByLibrary.simpleMessage(
            "Znajdź swój typ i dowiedz się, na kogo głosować w wyborach."),
        "entranceTitle3_ger25": MessageLookupByLibrary.simpleMessage(
            "Find out your match and an orientation for who to vote for at the Elections."),
        "faq": MessageLookupByLibrary.simpleMessage("FAQ"),
        "france": MessageLookupByLibrary.simpleMessage("Francja"),
        "germany": MessageLookupByLibrary.simpleMessage("Niemcy"),
        "homePageBackToTest":
            MessageLookupByLibrary.simpleMessage("Wróć do testu"),
        "homePageMatchesFoundQuote": m1,
        "homePageMyResults":
            MessageLookupByLibrary.simpleMessage("Moje wyniki"),
        "homePageStartButton":
            MessageLookupByLibrary.simpleMessage("Rozpocznij nowy test"),
        "hungary": MessageLookupByLibrary.simpleMessage("Węgry"),
        "languagePageSubtitle": MessageLookupByLibrary.simpleMessage(
            "Możesz to zmienić później w ustawieniach."),
        "languagePageTitle":
            MessageLookupByLibrary.simpleMessage("Kontynuujmy po polsku? :)"),
        "loadingResultsPageTitle1": MessageLookupByLibrary.simpleMessage(
            "Twoje spersonalizowane wyniki są w drodze :)"),
        "loadingResultsPageTitle1_ger25": MessageLookupByLibrary.simpleMessage(
            "Your personalised results are on their way :)"),
        "loadingResultsPageTitle2": MessageLookupByLibrary.simpleMessage(
            "Powinno być szybsze niż kupowanie biletów na Taylor Swift 👀 "),
        "loadingResultsPageTitle2_ger25": MessageLookupByLibrary.simpleMessage(
            "This shall be quicker than getting Taylor Swift tickets 👀 "),
        "loadingResultsPageTitle3": m2,
        "loadingResultsPageTitle3_ger25": m3,
        "loadingResultsPageTitle4": MessageLookupByLibrary.simpleMessage(
            "Prawie gotowe, robimy jeszcze ostatnie poprawki..."),
        "loadingResultsPageTitle4_ger25": MessageLookupByLibrary.simpleMessage(
            "Almost ready, one last check..."),
        "messageScreenNo_ger25":
            MessageLookupByLibrary.simpleMessage("nope..."),
        "messageScreenYes_ger25":
            MessageLookupByLibrary.simpleMessage("Yesss!"),
        "message_five_cards_left":
            MessageLookupByLibrary.simpleMessage("Tylko 5 pytań do końca :)"),
        "message_half_test_done": MessageLookupByLibrary.simpleMessage(
            "Przeciągaj dalej, 50% za Tobą!"),
        "neutral": MessageLookupByLibrary.simpleMessage("Nie mam zdania"),
        "no": MessageLookupByLibrary.simpleMessage("Nie"),
        "ok": MessageLookupByLibrary.simpleMessage("Ok"),
        "onBoardingCardQuestion": MessageLookupByLibrary.simpleMessage(
            "Nie mam pojęcia na kogo głosować w Wyborach do Parlamentu Europejskiego w 2024 roku"),
        "onBoardingCardQuestion_ger25": MessageLookupByLibrary.simpleMessage(
            "I have no clue who to vote for at the 2024 European Elections"),
        "onBoardingLastStepTitle": MessageLookupByLibrary.simpleMessage(
            "Przesuń palcem zgodnie z Twoją opinią"),
        "onBoardingNotAnswerButton":
            MessageLookupByLibrary.simpleMessage("Wolę nie odpowiadać"),
        "onBoardingStep1Subtitle":
            MessageLookupByLibrary.simpleMessage("Nie wiem"),
        "onBoardingStep1Title":
            MessageLookupByLibrary.simpleMessage("Gdzie będziesz głosować?"),
        "onBoardingStep2Title":
            MessageLookupByLibrary.simpleMessage("Mój wiek"),
        "onBoardingStep3Option1":
            MessageLookupByLibrary.simpleMessage("Kobieta"),
        "onBoardingStep3Option2":
            MessageLookupByLibrary.simpleMessage("Mężczyzna"),
        "onBoardingStep3Option3":
            MessageLookupByLibrary.simpleMessage("Gender-fluid"),
        "onBoardingStep3Option4":
            MessageLookupByLibrary.simpleMessage("Osoba niebinarna"),
        "onBoardingStep3Option5":
            MessageLookupByLibrary.simpleMessage("Żadne z powyższych"),
        "onBoardingStep3Title":
            MessageLookupByLibrary.simpleMessage("Identyfikuję się jako"),
        "onBoardingStep4Option1_ger25":
            MessageLookupByLibrary.simpleMessage("Universitätsabschluss"),
        "onBoardingStep4Option2_ger25":
            MessageLookupByLibrary.simpleMessage("Abitur"),
        "onBoardingStep4Option3_ger25":
            MessageLookupByLibrary.simpleMessage("Berufsausbildung"),
        "onBoardingStep4Option4_ger25":
            MessageLookupByLibrary.simpleMessage("Realschulabschluss"),
        "onBoardingStep4Option5_ger25":
            MessageLookupByLibrary.simpleMessage("Mittlerer Schulabschluss"),
        "onBoardingStep4Option6_ger25":
            MessageLookupByLibrary.simpleMessage("Ungebildet"),
        "poland": MessageLookupByLibrary.simpleMessage("Polska"),
        "resultsPage10NopButton":
            MessageLookupByLibrary.simpleMessage("Nie, dzięki!"),
        "resultsPage10Title": MessageLookupByLibrary.simpleMessage(
            "Chcesz dostać powiadomienie, gdy będzie czas na oddanie głosu?"),
        "resultsPage10Title_ger25": MessageLookupByLibrary.simpleMessage(
            "A notification when it’s time to go vote?"),
        "resultsPage10YesButton":
            MessageLookupByLibrary.simpleMessage("Takkkk"),
        "resultsPage1Button":
            MessageLookupByLibrary.simpleMessage("Naciśnij aby kontynuować"),
        "resultsPage1Text": MessageLookupByLibrary.simpleMessage(
            "Na następnych ekranach odkryjesz najbliższą Ci grupę w Parlamencie Europejskim i pasujące lokalne listy do głosowania w czerwcu w Twoim kraju. Będzie też kilka dodatkowych rzeczy, które stworzyliśmy na podstawie Twoich odpowiedzi 😌"),
        "resultsPage1Text_ger25": MessageLookupByLibrary.simpleMessage(
            "In the next screens, you’ll discover your most compatible  Group at the EU Parliament, the matching Local lists to vote for in June in your country, and we even found a few extra things based on your answers 😌"),
        "resultsPage1Title":
            MessageLookupByLibrary.simpleMessage("Match i wiele więcej 👉👈"),
        "resultsPage1Title_ger25":
            MessageLookupByLibrary.simpleMessage("A match and much more 👉👈"),
        "resultsPage2_1Title":
            MessageLookupByLibrary.simpleMessage("Szczerze mówiąc, pomiędzy"),
        "resultsPage2_1Title_ger25":
            MessageLookupByLibrary.simpleMessage("Honestly, between the"),
        "resultsPage2_2Title": MessageLookupByLibrary.simpleMessage(
            "a mną jest to swego rodzaju Love Story (EU’s Version)"),
        "resultsPage2_2Title_ger25": MessageLookupByLibrary.simpleMessage(
            "and me, it’s kind of a Love Story (EU’s Version)"),
        "resultsPage3Title": MessageLookupByLibrary.simpleMessage(
            "Jak bardzo jest mi blisko do grup Parlamentu Europejskiego"),
        "resultsPage3Title_ger25": MessageLookupByLibrary.simpleMessage(
            "How close I am to European Parliament Groups"),
        "resultsPage4TitleBottom": MessageLookupByLibrary.simpleMessage(
            "Przeciwko integracji europejskiej"),
        "resultsPage4TitleBottom_ger25":
            MessageLookupByLibrary.simpleMessage("Anti-EU Integration"),
        "resultsPage4TitleLeft": MessageLookupByLibrary.simpleMessage("Lewica"),
        "resultsPage4TitleLeft_ger25":
            MessageLookupByLibrary.simpleMessage("Left"),
        "resultsPage4TitleRight":
            MessageLookupByLibrary.simpleMessage("Prawica"),
        "resultsPage4TitleRight_ger25":
            MessageLookupByLibrary.simpleMessage("Right"),
        "resultsPage4TitleTop":
            MessageLookupByLibrary.simpleMessage("Za integracją europejską"),
        "resultsPage4TitleTop_ger25":
            MessageLookupByLibrary.simpleMessage("Pro-EU Integration"),
        "resultsPage4TitleUserHere":
            MessageLookupByLibrary.simpleMessage("It’s me, hi!"),
        "resultsPage4TitleUserHere_ger25":
            MessageLookupByLibrary.simpleMessage("It’s me, hi!"),
        "resultsPage5Title": MessageLookupByLibrary.simpleMessage(
            "Jeśli chodzi o bardziej konkretne tematy, do których grup Parlamentu Europejskiego jest mi bliżej?"),
        "resultsPage5Title_ger25": MessageLookupByLibrary.simpleMessage(
            "On more specific topics, which European Parliament Group am I closer to?"),
        "resultsPage5Topic1":
            MessageLookupByLibrary.simpleMessage("Kwestie środowiskowe"),
        "resultsPage5Topic1_ger25":
            MessageLookupByLibrary.simpleMessage("Environmental issues"),
        "resultsPage5Topic2": MessageLookupByLibrary.simpleMessage(
            "Prawa Człowieka i Prawa Socjalne"),
        "resultsPage5Topic2_ger25":
            MessageLookupByLibrary.simpleMessage("Human & Social Rights"),
        "resultsPage5Topic3":
            MessageLookupByLibrary.simpleMessage("Interwencjonizm Gospodarczy"),
        "resultsPage5Topic3_ger25":
            MessageLookupByLibrary.simpleMessage("Economic intervention"),
        "resultsPage6Text": MessageLookupByLibrary.simpleMessage(
            "Na następnych slajdach odkryjesz listy kandydatów w Twoim kraju, które najprowdopodbniej dołączą do Twoich matchy."),
        "resultsPage6Text_ger25": MessageLookupByLibrary.simpleMessage(
            "In the next screens, you’ll discover the candidate lists in your country  that are most likely to join your match."),
        "resultsPage6_1Title": MessageLookupByLibrary.simpleMessage(
            "Ok, dobrze wiedzieć, która grupa mnie rozumie..."),
        "resultsPage6_1Title_ger25": MessageLookupByLibrary.simpleMessage(
            "Ok, it\'s cool knowing which group gets me..."),
        "resultsPage6_2Title": MessageLookupByLibrary.simpleMessage(
            "Ale w Wyborach do Parlamentu Europejskiego głosuje się na lokalną listę"),
        "resultsPage6_2Title_ger25": MessageLookupByLibrary.simpleMessage(
            "But at the EU Elections, we vote for a local list"),
        "resultsPage7Disclaimer":
            MessageLookupByLibrary.simpleMessage("W losowej kolejności."),
        "resultsPage7Disclaimer_ger25":
            MessageLookupByLibrary.simpleMessage("In no particular order."),
        "resultsPage7NoLocalCandidates": m4,
        "resultsPage7NoLocalCandidates_ger25": m5,
        "resultsPage7Title": m6,
        "resultsPage7Title_ger25": m7,
        "resultsPage8Help": MessageLookupByLibrary.simpleMessage(
            "Walczysz o klimat! Wierzysz, że walka z kryzysem klimatycznym wymaga wspólnych działań i uczynienia z niej priorytetu. Nie przeszkadzają Ci wprowadzane przez UE regulacje w stosunku do firm. Bo przecież na co komu wzrost gospodarczy, jeśli planeta przestanie być zdolna do zamieszkiwania?"),
        "resultsPage8Help_ger": MessageLookupByLibrary.simpleMessage(
            "You are a climate change fighter! You believe that tackling the climate crisis requires collective action, with everyone making it a top priority. You do not mind the EU regulating companies to that end. After all, what use is economic growth if the planet becomes inhabitable?"),
        "resultsPage8Help_ger25": MessageLookupByLibrary.simpleMessage(
            "You are a climate change fighter! You believe that tackling the climate crisis requires collective action, with everyone making it a top priority. You do not mind the EU regulating companies to that end. After all, what use is economic growth if the planet becomes inhabitable?"),
        "resultsPage8_1Text": m8,
        "resultsPage8_1Text_ger25": m9,
        "resultsPage8_2Text": MessageLookupByLibrary.simpleMessage(
            "Aktywne działania na rzecz klimatu🌱😌"),
        "resultsPage8_2Text_ger25":
            MessageLookupByLibrary.simpleMessage("Active Climate Action 🌱😌"),
        "resultsPage9Help": MessageLookupByLibrary.simpleMessage(
            "Kliknij na karty, aby przetasować"),
        "resultsPage9Help_ger25": MessageLookupByLibrary.simpleMessage(
            "Click on the cards to shuffle"),
        "resultsPage9Text1": MessageLookupByLibrary.simpleMessage(
            "Wybory dotyczą wielu tematów, ale jest jeden, który naprawdę"),
        "resultsPage9Text1_ger25": MessageLookupByLibrary.simpleMessage(
            "Elections are about many topics, but there’s one thing that really"),
        "resultsPage9Text2":
            MessageLookupByLibrary.simpleMessage("Belongs With Me 😌"),
        "resultsPage9Text2_egr":
            MessageLookupByLibrary.simpleMessage("Belongs With Me 😌"),
        "resultsShare": MessageLookupByLibrary.simpleMessage("Udostępnij"),
        "romania": MessageLookupByLibrary.simpleMessage("Rumunia"),
        "settingsPagePrivacyPolicy":
            MessageLookupByLibrary.simpleMessage("Polityka Prywatności"),
        "settingsPageShareButtonText":
            MessageLookupByLibrary.simpleMessage("Udostępnij"),
        "settingsPageShareText": MessageLookupByLibrary.simpleMessage(
            "Jeśli ten uroczy gołąb nie pomoże Ci zagłosować w czerwcu, to już nic nie da rady. Sprawdź tę aplikację (tak jak ja):"),
        "settingsPageSubtitle1":
            MessageLookupByLibrary.simpleMessage("Sponsorzy Główni"),
        "settingsPageSubtitle2":
            MessageLookupByLibrary.simpleMessage("Partnerzy Europejscy"),
        "settingsPageSubtitle3":
            MessageLookupByLibrary.simpleMessage("Partnerzy Akademiccy"),
        "settingsPageSubtitle4": MessageLookupByLibrary.simpleMessage(
            "Krajowi Partnerzy Instytucjonalni"),
        "settingsPageSubtitle5":
            MessageLookupByLibrary.simpleMessage("Dostawcy Usług"),
        "settingsPageSubtitleLanguage": MessageLookupByLibrary.simpleMessage(
            "Wolę używać tej aplikacji po"),
        "settingsPageTextAbout": MessageLookupByLibrary.simpleMessage(
            "Palumba nie jest firmą, partią polityczną, czy rządem. Jesteśmy niezależnym stowarzyszeniem non-profit złożonym z ponad 120 młodyh ludzi 🐦 z całej Europy, którzy zebrali się latem zeszłego roku i zaczęli tworzyć tę aplikację. Mamy jeden cel: pomóc Ci lepiej zrozumieć, jak działają wybory do Parlamentu Europejskiego i jakie listy kandydatów mogą odpowiadać Twoim poglądom, aby można było głosować bardziej pewnie na tych, którzy popierają wasze priorytety. Nasz algorytm jest open-source, przeciągnięte przez Ciebie stwierdzenia zostały sprawdzone przez naukowców politycznych, a Twoje dane są tak zaszyfrowane, że nie mamy możliwości zidentyfikowania Cię :)"),
        "settingsPageTextLanguage": MessageLookupByLibrary.simpleMessage(
            "Żeby zmienić język, kliknij na język aktualnie używany w aplikacji"),
        "settingsPageTextPartners": MessageLookupByLibrary.simpleMessage(
            "Warto podkreślić, że partnerzy nie mają żadnych uprawnień redakcyjnych w odniesieniu do treści aplikacji, która pozostaje inicjatywą bezstronną i ma jasny cel: pomagać zrozumieć, kto popiera Twoje opinie na szczeblu europejskim i krajowym."),
        "settingsPageTitleAbout":
            MessageLookupByLibrary.simpleMessage("O aplikacji"),
        "settingsPageTitleAssociation":
            MessageLookupByLibrary.simpleMessage("Stowarzyszenie"),
        "settingsPageTitleLanguage":
            MessageLookupByLibrary.simpleMessage("Język"),
        "settingsPageTitlePartners":
            MessageLookupByLibrary.simpleMessage("Partnerzy"),
        "shortAppName": MessageLookupByLibrary.simpleMessage("Palumba"),
        "skip": MessageLookupByLibrary.simpleMessage("Pomiń"),
        "spain": MessageLookupByLibrary.simpleMessage("Hiszpania"),
        "splashPageNoInternet": MessageLookupByLibrary.simpleMessage(
            "Wygląda na to, że nie masz połączenia z internetem"),
        "sweden": MessageLookupByLibrary.simpleMessage("Szwecja"),
        "textContinue": MessageLookupByLibrary.simpleMessage("Dalej"),
        "yes": MessageLookupByLibrary.simpleMessage("Tak")
      };
}
