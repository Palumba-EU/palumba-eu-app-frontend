// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a hu locale. All the
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
  String get localeName => 'hu';

  static String m0(count) => "${count} kitöltés az elmúlt 24 órában";

  static String m1(count) => "${count} „párt\" találtunk az elmúlt 24 órában";

  static String m2(country) =>
      "Párosítás a jelöltlistákkal itt: ${country}  🔍";

  static String m3(country) =>
      "Finding matches with candidates lists in ${country}  🔍";

  static String m4(country) => "Nem találtunk helyi pártot itt: ${country}";

  static String m5(country) => "No local parties found in ${country}";

  static String m6(country, group) =>
      "${country} jelöltjei, akik legnagyobb összhangban vannak a(z) ${group} képviselőcsoporttal";

  static String m7(country, group) =>
      "The candidates in ${country} most aligned with ${group}";

  static String m8(topic, percentage) =>
      "A(z) ${topic} kérdésében ${percentage}% -ban közelebb áll hozzád:";

  static String m9(topic, percentage) =>
      "On ${topic}, you’re ${percentage}% more into";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "alertServerErrorText": MessageLookupByLibrary.simpleMessage(
            "Valami elromlott a mi oldalunkon. Kérlek, próbáld újra később."),
        "alertServerErrorTitle": MessageLookupByLibrary.simpleMessage("Hoppá!"),
        "appName": MessageLookupByLibrary.simpleMessage("Palumba EU"),
        "cancel": MessageLookupByLibrary.simpleMessage("Mégsem"),
        "denmark": MessageLookupByLibrary.simpleMessage("Dánia"),
        "entranceMatchesFoundQuote": m0,
        "entranceStartButton":
            MessageLookupByLibrary.simpleMessage("Mehet a Palumba?"),
        "entranceTitle1": MessageLookupByLibrary.simpleMessage(
            "Ha ez a cuki galamb nem tud segíteni szavazni júniusban, akkor semmi sem fog."),
        "entranceTitle1_ger25": MessageLookupByLibrary.simpleMessage(
            "If this cute pigeon can’t help you vote in February, nothing will."),
        "entranceTitle2": MessageLookupByLibrary.simpleMessage(
            "Jobbra vagy balra húzással dönthetsz a számodra fontos kérdésekben."),
        "entranceTitle2_ger25": MessageLookupByLibrary.simpleMessage(
            "Swipe your opinion on topics that matter to you."),
        "entranceTitle3": MessageLookupByLibrary.simpleMessage(
            "Fedezd fel a \'matchedet\' és egy kis iránymutatást arról, hogy kire érdemes szavaznod a választásokon."),
        "entranceTitle3_ger25": MessageLookupByLibrary.simpleMessage(
            "Find out your match and an orientation for who to vote for at the Elections."),
        "faq": MessageLookupByLibrary.simpleMessage("GYIK"),
        "france": MessageLookupByLibrary.simpleMessage("Franciaország"),
        "germany": MessageLookupByLibrary.simpleMessage("Németország"),
        "homePageBackToTest":
            MessageLookupByLibrary.simpleMessage("Vissza a kitöltéshez"),
        "homePageMatchesFoundQuote": m1,
        "homePageMyResults":
            MessageLookupByLibrary.simpleMessage("Eredményeim"),
        "homePageStartButton":
            MessageLookupByLibrary.simpleMessage("Új teszt indítása"),
        "hungary": MessageLookupByLibrary.simpleMessage("Magyarország"),
        "languagePageSubtitle": MessageLookupByLibrary.simpleMessage(
            "Ez később módosítható a beállításokban."),
        "languagePageTitle":
            MessageLookupByLibrary.simpleMessage("Folytassuk magyarul? :)"),
        "loadingResultsPageTitle1": MessageLookupByLibrary.simpleMessage(
            "Úton vannak a személyre szabott eredményeid :)"),
        "loadingResultsPageTitle1_ger25": MessageLookupByLibrary.simpleMessage(
            "Your personalised results are on their way :)"),
        "loadingResultsPageTitle2": MessageLookupByLibrary.simpleMessage(
            "Ez gyorsabban meglesz, mint egy Taylor Swift-jegy vásárlása 👀 "),
        "loadingResultsPageTitle2_ger25": MessageLookupByLibrary.simpleMessage(
            "This shall be quicker than getting Taylor Swift tickets 👀 "),
        "loadingResultsPageTitle3": m2,
        "loadingResultsPageTitle3_ger25": m3,
        "loadingResultsPageTitle4": MessageLookupByLibrary.simpleMessage(
            "Majdnem kész, csak az utolsó simítások..."),
        "loadingResultsPageTitle4_ger25": MessageLookupByLibrary.simpleMessage(
            "Almost ready, one last check..."),
        "messageScreenNo_ger25":
            MessageLookupByLibrary.simpleMessage("nope..."),
        "messageScreenYes_ger25":
            MessageLookupByLibrary.simpleMessage("Yesss!"),
        "message_five_cards_left": MessageLookupByLibrary.simpleMessage(
            "Már csak 5 kártya van hátra :)"),
        "message_half_test_done": MessageLookupByLibrary.simpleMessage(
            "Ne hagyd abba, már a felénél vagy!"),
        "neutral": MessageLookupByLibrary.simpleMessage("Közömbös"),
        "no": MessageLookupByLibrary.simpleMessage("Nem"),
        "ok": MessageLookupByLibrary.simpleMessage("Oké"),
        "onBoardingCardQuestion": MessageLookupByLibrary.simpleMessage(
            "Elképzelésem sincs, hogy kire szavazzak a 2024-es európai választásokon"),
        "onBoardingCardQuestion_ger25": MessageLookupByLibrary.simpleMessage(
            "I have no clue who to vote for at the 2024 European Elections"),
        "onBoardingLastStepTitle": MessageLookupByLibrary.simpleMessage(
            "Húzd abba az irányba, amellyel egyetértesz"),
        "onBoardingNotAnswerButton":
            MessageLookupByLibrary.simpleMessage("Inkább nem válaszolok"),
        "onBoardingStep1Subtitle":
            MessageLookupByLibrary.simpleMessage("Nem tudom"),
        "onBoardingStep1Title":
            MessageLookupByLibrary.simpleMessage("Hol fogsz szavazni?"),
        "onBoardingStep2Title":
            MessageLookupByLibrary.simpleMessage("Életkorom"),
        "onBoardingStep3Option1": MessageLookupByLibrary.simpleMessage("Nő"),
        "onBoardingStep3Option2": MessageLookupByLibrary.simpleMessage("Férfi"),
        "onBoardingStep3Option3":
            MessageLookupByLibrary.simpleMessage("Genderfluid"),
        "onBoardingStep3Option4":
            MessageLookupByLibrary.simpleMessage("Nonbináris"),
        "onBoardingStep3Option5": MessageLookupByLibrary.simpleMessage("Más"),
        "onBoardingStep3Title": MessageLookupByLibrary.simpleMessage("Nemem"),
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
        "poland": MessageLookupByLibrary.simpleMessage("Lengyelország"),
        "resultsPage10NopButton":
            MessageLookupByLibrary.simpleMessage("Köszönöm, nem!"),
        "resultsPage10Title": MessageLookupByLibrary.simpleMessage(
            "Szeretnél emlékeztetőt kapni, hogy mikor kell szavazni menni?"),
        "resultsPage10Title_ger25": MessageLookupByLibrary.simpleMessage(
            "A notification when it’s time to go vote?"),
        "resultsPage10YesButton":
            MessageLookupByLibrary.simpleMessage("Igeeen"),
        "resultsPage1Button":
            MessageLookupByLibrary.simpleMessage("Koppintással lapozz"),
        "resultsPage1Text": MessageLookupByLibrary.simpleMessage(
            "A következőkben felfedezheted a hozzád illő parlamenti képviselőcsoportot az EP-ben, az ehhez passzoló helyi listákat, amelyekre júniusban szavazhatsz majd az országodban, illetve mutatunk egy pár extra dolgot is a válaszaid alapján 😌"),
        "resultsPage1Text_ger25": MessageLookupByLibrary.simpleMessage(
            "In the next screens, you’ll discover your most compatible  Group at the EU Parliament, the matching Local lists to vote for in June in your country, and we even found a few extra things based on your answers 😌"),
        "resultsPage1Title": MessageLookupByLibrary.simpleMessage(
            "Egy \'match\' és sok más 👉👈"),
        "resultsPage1Title_ger25":
            MessageLookupByLibrary.simpleMessage("A match and much more 👉👈"),
        "resultsPage2_1Title":
            MessageLookupByLibrary.simpleMessage("Őszintén, a(z)"),
        "resultsPage2_1Title_ger25":
            MessageLookupByLibrary.simpleMessage("Honestly, between the"),
        "resultsPage2_2Title": MessageLookupByLibrary.simpleMessage(
            "között és köztem ez egy Love Story (EU’s Version)"),
        "resultsPage2_2Title_ger25": MessageLookupByLibrary.simpleMessage(
            "and me, it’s kind of a Love Story (EU’s Version)"),
        "resultsPage3Title": MessageLookupByLibrary.simpleMessage(
            "Mennyire állok közel az európai parlamenti képviselőcsoportokhoz"),
        "resultsPage3Title_ger25": MessageLookupByLibrary.simpleMessage(
            "How close I am to European Parliament Groups"),
        "resultsPage4TitleBottom":
            MessageLookupByLibrary.simpleMessage("EU integráció-ellenes"),
        "resultsPage4TitleBottom_ger25":
            MessageLookupByLibrary.simpleMessage("Anti-EU Integration"),
        "resultsPage4TitleLeft":
            MessageLookupByLibrary.simpleMessage("Baloldal"),
        "resultsPage4TitleLeft_ger25":
            MessageLookupByLibrary.simpleMessage("Left"),
        "resultsPage4TitleRight":
            MessageLookupByLibrary.simpleMessage("Jobboldal"),
        "resultsPage4TitleRight_ger25":
            MessageLookupByLibrary.simpleMessage("Right"),
        "resultsPage4TitleTop":
            MessageLookupByLibrary.simpleMessage("EU integráció-párti"),
        "resultsPage4TitleTop_ger25":
            MessageLookupByLibrary.simpleMessage("Pro-EU Integration"),
        "resultsPage4TitleUserHere":
            MessageLookupByLibrary.simpleMessage("It’s me, hi!"),
        "resultsPage4TitleUserHere_ger25":
            MessageLookupByLibrary.simpleMessage("It’s me, hi!"),
        "resultsPage5Title": MessageLookupByLibrary.simpleMessage(
            "Konkrétabb kérdésekben melyik európai parlamenti képviselőcsoporthoz állok közelebb?"),
        "resultsPage5Title_ger25": MessageLookupByLibrary.simpleMessage(
            "On more specific topics, which European Parliament Group am I closer to?"),
        "resultsPage5Topic1":
            MessageLookupByLibrary.simpleMessage("Környezeti problémák"),
        "resultsPage5Topic1_ger25":
            MessageLookupByLibrary.simpleMessage("Environmental issues"),
        "resultsPage5Topic2":
            MessageLookupByLibrary.simpleMessage("Emberi és szociális jogok"),
        "resultsPage5Topic2_ger25":
            MessageLookupByLibrary.simpleMessage("Human & Social Rights"),
        "resultsPage5Topic3":
            MessageLookupByLibrary.simpleMessage("Gazdasági beavatkozás"),
        "resultsPage5Topic3_ger25":
            MessageLookupByLibrary.simpleMessage("Economic intervention"),
        "resultsPage6Text": MessageLookupByLibrary.simpleMessage(
            "A következőkben felfedezheted az országod jelöltlistáit, amelyek vélhetően a hozzád közel álló képviselőcsoporthoz csatlakoznak majd."),
        "resultsPage6Text_ger25": MessageLookupByLibrary.simpleMessage(
            "In the next screens, you’ll discover the candidate lists in your country  that are most likely to join your match."),
        "resultsPage6_1Title": MessageLookupByLibrary.simpleMessage(
            "Oké, jó tudni, hogy melyik képviselőcsoport ért meg igazán..."),
        "resultsPage6_1Title_ger25": MessageLookupByLibrary.simpleMessage(
            "Ok, it\'s cool knowing which group gets me..."),
        "resultsPage6_2Title": MessageLookupByLibrary.simpleMessage(
            "De az európai választásokon egy helyi listára szavazunk"),
        "resultsPage6_2Title_ger25": MessageLookupByLibrary.simpleMessage(
            "But at the EU Elections, we vote for a local list"),
        "resultsPage7Disclaimer":
            MessageLookupByLibrary.simpleMessage("Véletlenszerű sorrendben."),
        "resultsPage7Disclaimer_ger25":
            MessageLookupByLibrary.simpleMessage("In no particular order."),
        "resultsPage7NoLocalCandidates": m4,
        "resultsPage7NoLocalCandidates_ger25": m5,
        "resultsPage7Title": m6,
        "resultsPage7Title_ger25": m7,
        "resultsPage8Help": MessageLookupByLibrary.simpleMessage(
            "Egy igazi klímaharcos vagy! Úgy gondolod, hogy a klímaválság együttes fellépést kíván, ezért mindenki fő prioritásává kell válnia. Téged nem zavar, ha az EU ebből a célból szabályozza a cégeket. Végül is mi haszna a gazdasági növekedésnek, ha a bolygó közben lakhatatlanná válik?"),
        "resultsPage8Help_ger": MessageLookupByLibrary.simpleMessage(
            "You are a climate change fighter! You believe that tackling the climate crisis requires collective action, with everyone making it a top priority. You do not mind the EU regulating companies to that end. After all, what use is economic growth if the planet becomes inhabitable?"),
        "resultsPage8Help_ger25": MessageLookupByLibrary.simpleMessage(
            "You are a climate change fighter! You believe that tackling the climate crisis requires collective action, with everyone making it a top priority. You do not mind the EU regulating companies to that end. After all, what use is economic growth if the planet becomes inhabitable?"),
        "resultsPage8_1Text": m8,
        "resultsPage8_1Text_ger25": m9,
        "resultsPage8_2Text":
            MessageLookupByLibrary.simpleMessage("Aktív klímavédelem 🌱😌"),
        "resultsPage8_2Text_ger25":
            MessageLookupByLibrary.simpleMessage("Active Climate Action 🌱😌"),
        "resultsPage9Help": MessageLookupByLibrary.simpleMessage(
            "Cseréhez koppints a kártyákra"),
        "resultsPage9Help_ger25": MessageLookupByLibrary.simpleMessage(
            "Click on the cards to shuffle"),
        "resultsPage9Text1": MessageLookupByLibrary.simpleMessage(
            "A választások sok mindenről szólnak, de van egy dolog, ami tényleg"),
        "resultsPage9Text1_ger25": MessageLookupByLibrary.simpleMessage(
            "Elections are about many topics, but there’s one thing that really"),
        "resultsPage9Text2":
            MessageLookupByLibrary.simpleMessage("Belongs With Me 😌"),
        "resultsPage9Text2_egr":
            MessageLookupByLibrary.simpleMessage("Belongs With Me 😌"),
        "resultsShare": MessageLookupByLibrary.simpleMessage("Megosztás"),
        "romania": MessageLookupByLibrary.simpleMessage("Románia"),
        "settingsPagePrivacyPolicy":
            MessageLookupByLibrary.simpleMessage("Adatvédelmi irányelvek"),
        "settingsPageShareButtonText":
            MessageLookupByLibrary.simpleMessage("Megosztás"),
        "settingsPageShareText": MessageLookupByLibrary.simpleMessage(
            "Ha ez a cuki galamb nem tud segíteni szavazni júniusban, akkor semmi sem fog. Nekem bevált az app, próbáld ki te is!"),
        "settingsPageSubtitle1":
            MessageLookupByLibrary.simpleMessage("Kiemelt támogatóink"),
        "settingsPageSubtitle2":
            MessageLookupByLibrary.simpleMessage("Európai támogatóink"),
        "settingsPageSubtitle3":
            MessageLookupByLibrary.simpleMessage("Akadémiai támogatóink"),
        "settingsPageSubtitle4": MessageLookupByLibrary.simpleMessage(
            "Nemzeti intézményi támogatóink"),
        "settingsPageSubtitle5":
            MessageLookupByLibrary.simpleMessage("Szolgáltatók"),
        "settingsPageSubtitleLanguage": MessageLookupByLibrary.simpleMessage(
            "Az appot az alábbi nyelven szeretném használni"),
        "settingsPageTextAbout": MessageLookupByLibrary.simpleMessage(
            "A Palumba nem egy cég, nem egy politikai párt, nem is egy kormány. Független, nonprofit szervezet vagyunk, amely 120+ fiatalból áll🐦 szerte Európából. Tavaly nyáron összeültünk és elkezdtünk ezen az appon dolgozni. Egy célunk van: szeretnénk neked segíteni jobban megérteni, hogy hogyan működnek az európai parlamenti választások, melyik jelöltlisták egyezhetnek az elképzeléseiddel, azért, hogy biztosan olyanokra szavazz, akik a Te prioritásaidat támogatják. Az algoritmusunk nyílt forráskódú, az állításokat amiket látsz majd, politikai szakértők is átnézték, és az adataidat titkosítottuk, szóval esélytelen, hogy valaha is beazonosítsunk a válaszaid alapján. :)"),
        "settingsPageTextLanguage": MessageLookupByLibrary.simpleMessage(
            "A nyelv módosításához koppints a jelenleg kiválasztottra"),
        "settingsPageTextPartners": MessageLookupByLibrary.simpleMessage(
            "Fontosnak tartjuk elmondani, hogy a támogatóink nem szólhattak bele az app tartalmába, amely továbbra is egy pártoktól független kezdeményezés egyetlen világos céllal: segítsünk neked megismerni, hogy ki támogatja a te véleményed európai és tagállami szinten."),
        "settingsPageTitleAbout":
            MessageLookupByLibrary.simpleMessage("Rólunk"),
        "settingsPageTitleAssociation":
            MessageLookupByLibrary.simpleMessage("A szervezet"),
        "settingsPageTitleLanguage":
            MessageLookupByLibrary.simpleMessage("Nyelv"),
        "settingsPageTitlePartners":
            MessageLookupByLibrary.simpleMessage("Partnereink"),
        "shortAppName": MessageLookupByLibrary.simpleMessage("Palumba"),
        "skip": MessageLookupByLibrary.simpleMessage("Átugrás"),
        "spain": MessageLookupByLibrary.simpleMessage("Spanyolország"),
        "splashPageNoInternet": MessageLookupByLibrary.simpleMessage(
            "Úgy tűnik, hogy nincs internetkapcsolatod"),
        "sweden": MessageLookupByLibrary.simpleMessage("Svédország"),
        "textContinue": MessageLookupByLibrary.simpleMessage("Tovább"),
        "yes": MessageLookupByLibrary.simpleMessage("Igen")
      };
}
