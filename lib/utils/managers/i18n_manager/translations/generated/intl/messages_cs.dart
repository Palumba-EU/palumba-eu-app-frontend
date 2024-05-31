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

  static String m3(country) =>
      "V ${country} jsme nenalezli žádné místní strany";

  static String m4(country, group) =>
      "Kandidáti v ${country} mají nejblíže ke ${group}";

  static String m5(topic, percentage) =>
      "V ${topic}, se z ${percentage}% shodujete v";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "alertServerErrorText": MessageLookupByLibrary.simpleMessage(
            "Něco pokazilo. Zkuste to prosím později."),
        "alertServerErrorTitle": MessageLookupByLibrary.simpleMessage("Ops!"),
        "appName": MessageLookupByLibrary.simpleMessage("Palumba EU"),
        "cancel": MessageLookupByLibrary.simpleMessage("Zrušit"),
        "denmark": MessageLookupByLibrary.simpleMessage("Dánsko"),
        "entranceMatchesFoundQuote": m0,
        "entranceStartButton":
            MessageLookupByLibrary.simpleMessage("Spustit Palumbu"),
        "entranceTitle1": MessageLookupByLibrary.simpleMessage(
            "Pokud vám tento roztomilý holub nepomůže v červnu volit, nepomůže vám nic."),
        "entranceTitle2": MessageLookupByLibrary.simpleMessage(
            "Posuňte svůj názor na témata, která vás zajímají."),
        "entranceTitle3": MessageLookupByLibrary.simpleMessage(
            "Najdi shodu a zjistíte, koho máte ve volbách volit."),
        "faq": MessageLookupByLibrary.simpleMessage("FAQ"),
        "france": MessageLookupByLibrary.simpleMessage("Francie"),
        "germany": MessageLookupByLibrary.simpleMessage("Německo"),
        "homePageBackToTest":
            MessageLookupByLibrary.simpleMessage("Zpět k testu"),
        "homePageMatchesFoundQuote": m1,
        "homePageMyResults":
            MessageLookupByLibrary.simpleMessage("Mé výsledky"),
        "homePageStartButton":
            MessageLookupByLibrary.simpleMessage("Spustit nový test"),
        "hungary": MessageLookupByLibrary.simpleMessage("Maďarsko"),
        "languagePageSubtitle": MessageLookupByLibrary.simpleMessage(
            "Toto lze změnit později v sekci Nastavení."),
        "languagePageTitle":
            MessageLookupByLibrary.simpleMessage("Pokračovat v češtině? :)"),
        "loadingResultsPageTitle1": MessageLookupByLibrary.simpleMessage(
            "Vaše výsledky jsou na cestě :)"),
        "loadingResultsPageTitle2": MessageLookupByLibrary.simpleMessage(
            "Bude to rychlejší než prodej lístků na Taylor Swift "),
        "loadingResultsPageTitle3": m2,
        "loadingResultsPageTitle4": MessageLookupByLibrary.simpleMessage(
            "Téměř připraveno, ještě poslední kontrola..."),
        "message_five_cards_left":
            MessageLookupByLibrary.simpleMessage("Už jen 5 karet do konce :)"),
        "message_half_test_done":
            MessageLookupByLibrary.simpleMessage("Swipuj dál, už jsi v půlce!"),
        "neutral": MessageLookupByLibrary.simpleMessage("Neutrální"),
        "no": MessageLookupByLibrary.simpleMessage("Ne"),
        "ok": MessageLookupByLibrary.simpleMessage("Ok"),
        "onBoardingCardQuestion": MessageLookupByLibrary.simpleMessage(
            "Nemám ponětí, pro koho budu hlasovat v evropských volbách roku 2024"),
        "onBoardingLastStepTitle": MessageLookupByLibrary.simpleMessage(
            "Přetáhněte dle svých preferencí"),
        "onBoardingNotAnswerButton":
            MessageLookupByLibrary.simpleMessage("Nechci uvádět"),
        "onBoardingStep1Subtitle":
            MessageLookupByLibrary.simpleMessage("Nevím"),
        "onBoardingStep1Title": MessageLookupByLibrary.simpleMessage(
            "Ve které zemi budete hlasovat?"),
        "onBoardingStep2Title": MessageLookupByLibrary.simpleMessage("Můj věk"),
        "onBoardingStep3Option1": MessageLookupByLibrary.simpleMessage("Žena"),
        "onBoardingStep3Option2": MessageLookupByLibrary.simpleMessage("Muž"),
        "onBoardingStep3Option3":
            MessageLookupByLibrary.simpleMessage("Genderfluidní"),
        "onBoardingStep3Option4":
            MessageLookupByLibrary.simpleMessage("Nebinární"),
        "onBoardingStep3Option5": MessageLookupByLibrary.simpleMessage("Jinak"),
        "onBoardingStep3Title":
            MessageLookupByLibrary.simpleMessage("Identifikuji se jako"),
        "poland": MessageLookupByLibrary.simpleMessage("Polsko"),
        "resultsPage10NopButton":
            MessageLookupByLibrary.simpleMessage("Ne, díky!"),
        "resultsPage10Title": MessageLookupByLibrary.simpleMessage(
            "Upozornit mě, až bude čas jít volit?"),
        "resultsPage10YesButton":
            MessageLookupByLibrary.simpleMessage("Jasněěě"),
        "resultsPage1Button":
            MessageLookupByLibrary.simpleMessage("Stiskněte pro pokračování"),
        "resultsPage1Text": MessageLookupByLibrary.simpleMessage(
            "Na následujících obrazovkách se dozvíte, s jakou skupinou v Evropském parlamentu se nejvíce ztotožňujete, naleznete odpovídající kandidáty, pro které můžete v červnu ve vaší zemi hlasovat. Na základě vašich odpovědí jsme dokonce jsme našli několik dalších zajímavostí 😌"),
        "resultsPage1Title":
            MessageLookupByLibrary.simpleMessage("Shoda a mnohem více"),
        "resultsPage2_1Title":
            MessageLookupByLibrary.simpleMessage("Upřímně řečeno, mezi"),
        "resultsPage2_2Title": MessageLookupByLibrary.simpleMessage(
            "a mnou, je to tak trochu Love Story (verze EU)"),
        "resultsPage3Title": MessageLookupByLibrary.simpleMessage(
            "Jak blízko mám ke skupinám Evropského parlamentu"),
        "resultsPage4TitleBottom":
            MessageLookupByLibrary.simpleMessage("Proti evropské integraci"),
        "resultsPage4TitleLeft":
            MessageLookupByLibrary.simpleMessage("Levicové"),
        "resultsPage4TitleRight":
            MessageLookupByLibrary.simpleMessage("Pravicové"),
        "resultsPage4TitleTop":
            MessageLookupByLibrary.simpleMessage("Pro evropskou integraci"),
        "resultsPage4TitleUserHere":
            MessageLookupByLibrary.simpleMessage("To jsem já, ahoj!"),
        "resultsPage5Title": MessageLookupByLibrary.simpleMessage(
            "Pokud jde o konkrétnější témata, ke které skupině Evropského parlamentu mám blíže?"),
        "resultsPage5Topic1":
            MessageLookupByLibrary.simpleMessage("Otázky životního prostředí"),
        "resultsPage5Topic2":
            MessageLookupByLibrary.simpleMessage("Lidská a sociální práva"),
        "resultsPage5Topic3":
            MessageLookupByLibrary.simpleMessage("Hospodářské intervence"),
        "resultsPage6Text": MessageLookupByLibrary.simpleMessage(
            "Na následujících obrazovkách naleznete seznamy kandidátů ve vaší zemi, se kterými se pravděpodobně shodujete nejvíce."),
        "resultsPage6_1Title": MessageLookupByLibrary.simpleMessage(
            "Ok, je skvělé vědět, ke které skupině mám nejblíž..."),
        "resultsPage6_2Title": MessageLookupByLibrary.simpleMessage(
            "Při evropských volbách však hlasujeme pro místní kandidáty"),
        "resultsPage7Disclaimer":
            MessageLookupByLibrary.simpleMessage("Bez konkrétního pořadí."),
        "resultsPage7NoLocalCandidates": m3,
        "resultsPage7Title": m4,
        "resultsPage8Help": MessageLookupByLibrary.simpleMessage(
            "Jste bojovníkem za změnu klimatu! Věříte, že boj proti klimatické krizi vyžaduje kolektivní přístup, přičemž z něj každý učiní svou hlavní prioritu. Nevadí vám regulace společností ze strany EU. Vždyť jaký užitek má hospodářský růst ve chvíli, kdy se planeta stane neobyvatelnou?"),
        "resultsPage8_1Text": m5,
        "resultsPage8_2Text": MessageLookupByLibrary.simpleMessage(
            "Aktivní opatření v oblasti klimatu 🌱😌"),
        "resultsPage9Help": MessageLookupByLibrary.simpleMessage(
            "Pro zamíchání klikněte na karty"),
        "resultsPage9Text1": MessageLookupByLibrary.simpleMessage(
            "Volby se týkají mnoha témat, ale jedna věc je"),
        "resultsPage9Text2":
            MessageLookupByLibrary.simpleMessage("Belongs With Me 😌"),
        "resultsShare": MessageLookupByLibrary.simpleMessage("Sdílet"),
        "romania": MessageLookupByLibrary.simpleMessage("Rumunsko"),
        "settingsPagePrivacyPolicy": MessageLookupByLibrary.simpleMessage(
            "Zásady ochrany osobních údajů"),
        "settingsPageShareButtonText":
            MessageLookupByLibrary.simpleMessage("Sdílet"),
        "settingsPageShareText": MessageLookupByLibrary.simpleMessage(
            "Pokud vám tento roztomilý holub nepomůže v červnu volit, nepomůže vám nic. Aplikaci jsem použil a vy byste měli také:"),
        "settingsPageSubtitle1":
            MessageLookupByLibrary.simpleMessage("Hlavní sponzoři"),
        "settingsPageSubtitle2":
            MessageLookupByLibrary.simpleMessage("Evropští partneři"),
        "settingsPageSubtitle3":
            MessageLookupByLibrary.simpleMessage("Akademičtí partneři"),
        "settingsPageSubtitle4": MessageLookupByLibrary.simpleMessage(
            "Partneři z národních institucí"),
        "settingsPageSubtitle5":
            MessageLookupByLibrary.simpleMessage("Poskytovatelé služeb"),
        "settingsPageSubtitleLanguage": MessageLookupByLibrary.simpleMessage(
            "Preferuji používat tuto aplikaci v"),
        "settingsPageTextAbout": MessageLookupByLibrary.simpleMessage(
            "Palumba není společnost, politická strana, ani vláda. Jsme nezávislé neziskové sdružení 120+ mladých lidí 🐦 z celé Evropy, kteří se sešli loni v létě a začali s realizací této aplikace. Máme jeden cíl: pomoci vám lépe pochopit, jak fungují evropské volby a kteří kandidáti by mohli být nejblíže k vašim představám, abyste tak mohli s větší jistotou hlasovat pro lidi, kteří podporují vaše priority. Náš algoritmus je otevřený zdrojový kód, prohlášení, se kterými hledáte shodu, byla přezkoumána politology, a vaše data jsou zašifrovaná, takže neexistuje žádný způsob, jak bychom vás mohli identifikovat :)"),
        "settingsPageTextLanguage": MessageLookupByLibrary.simpleMessage(
            "Pro změnu jazyka klikněte na výše uvedený"),
        "settingsPageTextPartners": MessageLookupByLibrary.simpleMessage(
            "Deklarujeme, že následující partneři nemají žádným způsobem neovlivnili obsah aplikace, která zůstává nestrannou iniciativou s jasným cílem: pomůže vám pochopit, kdo podporuje vaše názory na evropské a vnitrostátní úrovni."),
        "settingsPageTitleAbout": MessageLookupByLibrary.simpleMessage("O nás"),
        "settingsPageTitleAssociation":
            MessageLookupByLibrary.simpleMessage("Asociace"),
        "settingsPageTitleLanguage":
            MessageLookupByLibrary.simpleMessage("Jazyk"),
        "settingsPageTitlePartners":
            MessageLookupByLibrary.simpleMessage("Partneři"),
        "shortAppName": MessageLookupByLibrary.simpleMessage("Palumba"),
        "skip": MessageLookupByLibrary.simpleMessage("Přeskočit"),
        "spain": MessageLookupByLibrary.simpleMessage("Španělsko"),
        "splashPageNoInternet": MessageLookupByLibrary.simpleMessage(
            "Vypadá to, že nejste připojeni k internetu"),
        "sweden": MessageLookupByLibrary.simpleMessage("Švédsko"),
        "textContinue": MessageLookupByLibrary.simpleMessage("Pokračovat"),
        "yes": MessageLookupByLibrary.simpleMessage("Ano")
      };
}
