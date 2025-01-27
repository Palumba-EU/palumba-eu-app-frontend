// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a bg locale. All the
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
  String get localeName => 'bg';

  static String m0(count) => "${count} Съвпадения намерени през последните 24ч";

  static String m1(count) => "${count} съвпадения намерени в последните 24ч";

  static String m2(country) =>
      "Намиране на съвпадения с кандидатски листи в ${country}";

  static String m3(country) =>
      "Finding matches with candidates lists in ${country}  🔍";

  static String m4(country) => "Не са намерени местни партии в ${country}";

  static String m5(country) => "No local parties found in ${country}";

  static String m6(country, group) =>
      "Кандидатите в${country}, които най-много се придържат към ${group}";

  static String m7(country, group) =>
      "The candidates in ${country} most aligned with ${group}";

  static String m8(topic, percentage) =>
      "На ${topic} вие сте ${percentage}% повече към";

  static String m9(topic, percentage) =>
      "On ${topic}, you’re ${percentage}% more into";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "alertServerErrorText": MessageLookupByLibrary.simpleMessage(
            "Нещо се е объркало от наша страна. Моля, опитайте отново по-късно."),
        "alertServerErrorTitle": MessageLookupByLibrary.simpleMessage("Упс!"),
        "appName": MessageLookupByLibrary.simpleMessage("Palumba EU"),
        "cancel": MessageLookupByLibrary.simpleMessage("Отказ"),
        "denmark": MessageLookupByLibrary.simpleMessage("Дания"),
        "entranceMatchesFoundQuote": m0,
        "entranceStartButton":
            MessageLookupByLibrary.simpleMessage("Старт Palumba"),
        "entranceTitle1": MessageLookupByLibrary.simpleMessage(
            "Ако този симпатичен гълъб не ви помогне да гласувате през юни, нищо няма да ви помогне."),
        "entranceTitle1_ger25": MessageLookupByLibrary.simpleMessage(
            "If this cute pigeon can’t help you vote in February, nothing will."),
        "entranceTitle2": MessageLookupByLibrary.simpleMessage(
            "Прелиствайте мнението си по важни за вас теми."),
        "entranceTitle2_ger25": MessageLookupByLibrary.simpleMessage(
            "Swipe your opinion on topics that matter to you."),
        "entranceTitle3": MessageLookupByLibrary.simpleMessage(
            "Намери си съвпадение с вижданията ти и виж за кого да гласуваш."),
        "entranceTitle3_ger25": MessageLookupByLibrary.simpleMessage(
            "Find out your match and an orientation for who to vote for at the Elections."),
        "faq": MessageLookupByLibrary.simpleMessage("ЧЗВ"),
        "france": MessageLookupByLibrary.simpleMessage("Франция"),
        "germany": MessageLookupByLibrary.simpleMessage("Германия"),
        "homePageBackToTest":
            MessageLookupByLibrary.simpleMessage("Обратно към теста"),
        "homePageMatchesFoundQuote": m1,
        "homePageMyResults":
            MessageLookupByLibrary.simpleMessage("Моите резултати"),
        "homePageStartButton":
            MessageLookupByLibrary.simpleMessage("Започни нов тест"),
        "hungary": MessageLookupByLibrary.simpleMessage("Унгария"),
        "languagePageSubtitle": MessageLookupByLibrary.simpleMessage(
            "Това може да бъде променено по-късно в настройките."),
        "languagePageTitle":
            MessageLookupByLibrary.simpleMessage("Да продължим на български"),
        "loadingResultsPageTitle1": MessageLookupByLibrary.simpleMessage(
            "Вашите персонализирани резултати са на път"),
        "loadingResultsPageTitle1_ger25": MessageLookupByLibrary.simpleMessage(
            "Your personalised results are on their way :)"),
        "loadingResultsPageTitle2": MessageLookupByLibrary.simpleMessage(
            "Това ще е по-бързо, отколкото да се сдобиете с билети за Тейлър Суифт "),
        "loadingResultsPageTitle2_ger25": MessageLookupByLibrary.simpleMessage(
            "This shall be quicker than getting Taylor Swift tickets 👀 "),
        "loadingResultsPageTitle3": m2,
        "loadingResultsPageTitle3_ger25": m3,
        "loadingResultsPageTitle4": MessageLookupByLibrary.simpleMessage(
            "Почти готово, последна проверка..."),
        "loadingResultsPageTitle4_ger25": MessageLookupByLibrary.simpleMessage(
            "Almost ready, one last check..."),
        "messageScreenNo_ger25":
            MessageLookupByLibrary.simpleMessage("nope..."),
        "messageScreenYes_ger25":
            MessageLookupByLibrary.simpleMessage("Yesss!"),
        "message_five_cards_left":
            MessageLookupByLibrary.simpleMessage("Остават още само 5 карти :)"),
        "message_half_test_done": MessageLookupByLibrary.simpleMessage(
            "Продължи напред, готов/а си на 50%!"),
        "neutral": MessageLookupByLibrary.simpleMessage("Неутрален"),
        "no": MessageLookupByLibrary.simpleMessage("Не"),
        "ok": MessageLookupByLibrary.simpleMessage("Добре"),
        "onBoardingCardQuestion": MessageLookupByLibrary.simpleMessage(
            "Нямам представа за кого да гласувам на европейските избори през 2024 г"),
        "onBoardingCardQuestion_ger25": MessageLookupByLibrary.simpleMessage(
            "I have no clue who to vote for at the 2024 European Elections"),
        "onBoardingLastStepTitle": MessageLookupByLibrary.simpleMessage(
            "Плъзнете според това за кое сте съгласни и за кое не сте"),
        "onBoardingNotAnswerButton":
            MessageLookupByLibrary.simpleMessage("Предпочитам да не казвам"),
        "onBoardingStep1Subtitle":
            MessageLookupByLibrary.simpleMessage("Не знам"),
        "onBoardingStep1Title":
            MessageLookupByLibrary.simpleMessage("Къде ще гласувате?"),
        "onBoardingStep2Title":
            MessageLookupByLibrary.simpleMessage("Моята възраст"),
        "onBoardingStep3Option1": MessageLookupByLibrary.simpleMessage("Жена"),
        "onBoardingStep3Option2": MessageLookupByLibrary.simpleMessage("Мъж"),
        "onBoardingStep3Option3":
            MessageLookupByLibrary.simpleMessage("Gender-fluid"),
        "onBoardingStep3Option4":
            MessageLookupByLibrary.simpleMessage("Небинарен"),
        "onBoardingStep3Option5": MessageLookupByLibrary.simpleMessage("Друго"),
        "onBoardingStep3Title":
            MessageLookupByLibrary.simpleMessage("Аз се идентифицирам като"),
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
        "poland": MessageLookupByLibrary.simpleMessage("Полша "),
        "resultsPage10NopButton":
            MessageLookupByLibrary.simpleMessage("Не, благодаря!"),
        "resultsPage10Title": MessageLookupByLibrary.simpleMessage(
            "Уведомление, когато е време да отидете да гласувате?"),
        "resultsPage10Title_ger25": MessageLookupByLibrary.simpleMessage(
            "A notification when it’s time to go vote?"),
        "resultsPage10YesButton":
            MessageLookupByLibrary.simpleMessage("Дааааа"),
        "resultsPage1Button":
            MessageLookupByLibrary.simpleMessage("Натиснете, за да продължите"),
        "resultsPage1Text": MessageLookupByLibrary.simpleMessage(
            "На следващите екрани ще откриете най-съвместимата си група в Европейския парламент, подходящите местни листи, за които да гласувате през юни във вашата страна, и дори открихме няколко допълнителни неща въз основа на вашите отговори"),
        "resultsPage1Text_ger25": MessageLookupByLibrary.simpleMessage(
            "In the next screens, you’ll discover your most compatible  Group at the EU Parliament, the matching Local lists to vote for in June in your country, and we even found a few extra things based on your answers 😌"),
        "resultsPage1Title":
            MessageLookupByLibrary.simpleMessage("Съвпадение и много повече"),
        "resultsPage1Title_ger25":
            MessageLookupByLibrary.simpleMessage("A match and much more 👉👈"),
        "resultsPage2_1Title":
            MessageLookupByLibrary.simpleMessage("Честно, между"),
        "resultsPage2_1Title_ger25":
            MessageLookupByLibrary.simpleMessage("Honestly, between the"),
        "resultsPage2_2Title": MessageLookupByLibrary.simpleMessage(
            "и мен, е нещо като Love story (EU\'s Version)"),
        "resultsPage2_2Title_ger25": MessageLookupByLibrary.simpleMessage(
            "and me, it’s kind of a Love Story (EU’s Version)"),
        "resultsPage3Title": MessageLookupByLibrary.simpleMessage(
            "Колко близко съм до дадени Европейски парламентарни групи"),
        "resultsPage3Title_ger25": MessageLookupByLibrary.simpleMessage(
            "How close I am to European Parliament Groups"),
        "resultsPage4TitleBottom":
            MessageLookupByLibrary.simpleMessage("Анти-ЕС интеграция"),
        "resultsPage4TitleBottom_ger25":
            MessageLookupByLibrary.simpleMessage("Anti-EU Integration"),
        "resultsPage4TitleLeft": MessageLookupByLibrary.simpleMessage("Ляво"),
        "resultsPage4TitleLeft_ger25":
            MessageLookupByLibrary.simpleMessage("Left"),
        "resultsPage4TitleRight": MessageLookupByLibrary.simpleMessage("Дясно"),
        "resultsPage4TitleRight_ger25":
            MessageLookupByLibrary.simpleMessage("Right"),
        "resultsPage4TitleTop":
            MessageLookupByLibrary.simpleMessage("Про-ЕС интеграция"),
        "resultsPage4TitleTop_ger25":
            MessageLookupByLibrary.simpleMessage("Pro-EU Integration"),
        "resultsPage4TitleUserHere":
            MessageLookupByLibrary.simpleMessage("It’s me, hi!"),
        "resultsPage4TitleUserHere_ger25":
            MessageLookupByLibrary.simpleMessage("It’s me, hi!"),
        "resultsPage5Title": MessageLookupByLibrary.simpleMessage(
            "По по-специфични теми - към коя група в Европейския парламент съм по-близо?"),
        "resultsPage5Title_ger25": MessageLookupByLibrary.simpleMessage(
            "On more specific topics, which European Parliament Group am I closer to?"),
        "resultsPage5Topic1":
            MessageLookupByLibrary.simpleMessage("Екологични проблеми"),
        "resultsPage5Topic1_ger25":
            MessageLookupByLibrary.simpleMessage("Environmental issues"),
        "resultsPage5Topic2":
            MessageLookupByLibrary.simpleMessage("Човешки и социални права"),
        "resultsPage5Topic2_ger25":
            MessageLookupByLibrary.simpleMessage("Human & Social Rights"),
        "resultsPage5Topic3":
            MessageLookupByLibrary.simpleMessage("Икономическа интервенция"),
        "resultsPage5Topic3_ger25":
            MessageLookupByLibrary.simpleMessage("Economic intervention"),
        "resultsPage6Text": MessageLookupByLibrary.simpleMessage(
            "В следващите екрани ще откриете списъците с кандидати във вашата страна, които е най-вероятно да се присъединят към вашето съвпадение."),
        "resultsPage6Text_ger25": MessageLookupByLibrary.simpleMessage(
            "In the next screens, you’ll discover the candidate lists in your country  that are most likely to join your match."),
        "resultsPage6_1Title": MessageLookupByLibrary.simpleMessage(
            "Добре, готино е да знаеш коя група те разбира..."),
        "resultsPage6_1Title_ger25": MessageLookupByLibrary.simpleMessage(
            "Ok, it\'s cool knowing which group gets me..."),
        "resultsPage6_2Title": MessageLookupByLibrary.simpleMessage(
            "Но на европейските избори гласуваме за местна листа"),
        "resultsPage6_2Title_ger25": MessageLookupByLibrary.simpleMessage(
            "But at the EU Elections, we vote for a local list"),
        "resultsPage7Disclaimer":
            MessageLookupByLibrary.simpleMessage("Без определен ред."),
        "resultsPage7Disclaimer_ger25":
            MessageLookupByLibrary.simpleMessage("In no particular order."),
        "resultsPage7NoLocalCandidates": m4,
        "resultsPage7NoLocalCandidates_ger25": m5,
        "resultsPage7Title": m6,
        "resultsPage7Title_ger25": m7,
        "resultsPage8Help": MessageLookupByLibrary.simpleMessage(
            "Вие сте борец срещу климатичните проблеми! Вярвате, че справянето с кризата с климата изисква колективни действия, които да се превърнат в основен приоритет за всички. Нямате нищо против ЕС да регулира компаниите за тази цел. В края на краищата, каква е ползата от икономическия растеж, ако планетата стане необитаема?"),
        "resultsPage8Help_ger": MessageLookupByLibrary.simpleMessage(
            "You are a climate change fighter! You believe that tackling the climate crisis requires collective action, with everyone making it a top priority. You do not mind the EU regulating companies to that end. After all, what use is economic growth if the planet becomes inhabitable?"),
        "resultsPage8Help_ger25": MessageLookupByLibrary.simpleMessage(
            "You are a climate change fighter! You believe that tackling the climate crisis requires collective action, with everyone making it a top priority. You do not mind the EU regulating companies to that end. After all, what use is economic growth if the planet becomes inhabitable?"),
        "resultsPage8_1Text": m8,
        "resultsPage8_1Text_ger25": m9,
        "resultsPage8_2Text": MessageLookupByLibrary.simpleMessage(
            "Активни действия по отношение на климата"),
        "resultsPage8_2Text_ger25":
            MessageLookupByLibrary.simpleMessage("Active Climate Action 🌱😌"),
        "resultsPage9Help": MessageLookupByLibrary.simpleMessage(
            "Кликнете върху картите, за да ги разбъркате"),
        "resultsPage9Help_ger25": MessageLookupByLibrary.simpleMessage(
            "Click on the cards to shuffle"),
        "resultsPage9Text1": MessageLookupByLibrary.simpleMessage(
            "Изборите са свързани с много теми, но има едно нещо, което наистина"),
        "resultsPage9Text1_ger25": MessageLookupByLibrary.simpleMessage(
            "Elections are about many topics, but there’s one thing that really"),
        "resultsPage9Text2":
            MessageLookupByLibrary.simpleMessage("Belongs With Me 😌"),
        "resultsPage9Text2_egr":
            MessageLookupByLibrary.simpleMessage("Belongs With Me 😌"),
        "resultsShare": MessageLookupByLibrary.simpleMessage("Споделяне"),
        "romania": MessageLookupByLibrary.simpleMessage("Румъния"),
        "settingsPagePrivacyPolicy":
            MessageLookupByLibrary.simpleMessage("Защита на данните"),
        "settingsPageShareButtonText":
            MessageLookupByLibrary.simpleMessage("Споделяне"),
        "settingsPageShareText": MessageLookupByLibrary.simpleMessage(
            "Ако този сладък гълъб не може да ти помогне да гласуваш юни месец, нищо няма да ти помогне. Аз съм използвал приложението, пробвай и ти:"),
        "settingsPageSubtitle1":
            MessageLookupByLibrary.simpleMessage("Главни спонсори"),
        "settingsPageSubtitle2":
            MessageLookupByLibrary.simpleMessage("Европейски партньори"),
        "settingsPageSubtitle3":
            MessageLookupByLibrary.simpleMessage("Академични партньори"),
        "settingsPageSubtitle4": MessageLookupByLibrary.simpleMessage(
            "Национални институционални партньори"),
        "settingsPageSubtitle5":
            MessageLookupByLibrary.simpleMessage("Доставчици на услуги"),
        "settingsPageSubtitleLanguage": MessageLookupByLibrary.simpleMessage(
            "Предпочитам да използвам приложението в"),
        "settingsPageTextAbout": MessageLookupByLibrary.simpleMessage(
            "Palumba не е компания, не е политическа партия, не е правителство. Ние сме независимо сдружение с нестопанска цел на над 120 млади хора 🐦 от цяла Европа, които се събраха миналото лято и започнаха да създават това приложение. Имаме една цел: да ви помогнем да разберете по-добре как протичат европейските избори и кои кандидатски листи биха могли да отговарят на вашите идеи, за да можете да гласувате по-уверено за хора, които подкрепят вашите приоритети. Алгоритъмът ни е с отворен код, изявленията, върху които плъзгате пръст, са прегледани от политолози, а данните ви са толкова криптирани, че няма как да ви идентифицираме :)"),
        "settingsPageTextLanguage": MessageLookupByLibrary.simpleMessage(
            "За да промените езика, натиснете върху текущия език"),
        "settingsPageTextPartners": MessageLookupByLibrary.simpleMessage(
            "Важно е да ви кажем, че партньорите нямат редакционни правомощия по отношение на съдържанието на приложението, което остава непартийна инициатива с ясна цел: да ви помогне да разберете кой подкрепя вашето мнение на европейско и национално равнище."),
        "settingsPageTitleAbout":
            MessageLookupByLibrary.simpleMessage("Относно"),
        "settingsPageTitleAssociation":
            MessageLookupByLibrary.simpleMessage("Асоциацията"),
        "settingsPageTitleLanguage":
            MessageLookupByLibrary.simpleMessage("Език"),
        "settingsPageTitlePartners":
            MessageLookupByLibrary.simpleMessage("Партньори"),
        "shortAppName": MessageLookupByLibrary.simpleMessage("Palumba"),
        "skip": MessageLookupByLibrary.simpleMessage("Пропускане"),
        "spain": MessageLookupByLibrary.simpleMessage("Испания"),
        "splashPageNoInternet": MessageLookupByLibrary.simpleMessage(
            "Изглежда, че нямате връзка с интернет"),
        "sweden": MessageLookupByLibrary.simpleMessage("Швеция"),
        "textContinue": MessageLookupByLibrary.simpleMessage("Продължи"),
        "yes": MessageLookupByLibrary.simpleMessage("Да")
      };
}
