// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a el locale. All the
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
  String get localeName => 'el';

  static String m0(count) =>
      "Βρέθηκαν ${count} αντιστοιχίες τις τελευταίες 24 ώρες";

  static String m1(count) =>
      "Βρέθηκαν ${count} αντιστοιχίες τις τελευταίες 24 ώρες";

  static String m2(country) =>
      "Εύρεση αντιστοιχιών με λίστες υποψηφίων στη ${country}🔍";

  static String m3(country) => "Δεν βρέθηκαν τοπικά κόμματα στη ${country}";

  static String m4(country, group) =>
      "Οι υποψήφιοι στη ${country} που ευθυγραμμίζονται περισσότερο με την/το ${group}";

  static String m5(topic, percentage) =>
      "Όσον αφορά τα/την ${topic}, είστε ${percentage}% υπέρ";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "alertServerErrorText": MessageLookupByLibrary.simpleMessage(
            "Κάτι πήγε στραβά από την πλευρά μας. Παρακαλώ δοκιμάστε ξανά αργότερα."),
        "alertServerErrorTitle": MessageLookupByLibrary.simpleMessage("Ουπς!"),
        "appName": MessageLookupByLibrary.simpleMessage("Palumba EU"),
        "cancel": MessageLookupByLibrary.simpleMessage("Ακύρωση"),
        "denmark": MessageLookupByLibrary.simpleMessage("Δανία"),
        "entranceMatchesFoundQuote": m0,
        "entranceStartButton":
            MessageLookupByLibrary.simpleMessage("Έναρξη Palumba"),
        "entranceTitle1": MessageLookupByLibrary.simpleMessage(
            "Αν αυτό το χαριτωμένο περιστέρι δε μπορεί να σας βοηθήσει να  ψηφίσετε τον  Ιούνιο, τίποτα δε θα μπορέσει."),
        "entranceTitle2": MessageLookupByLibrary.simpleMessage(
            "Σύρετε τη γνώμη σας για θέματα που σας αφορούν."),
        "entranceTitle3": MessageLookupByLibrary.simpleMessage(
            "Μάθετε την αντιστοιχία σας και προσανατολιστείτε για το ποιους θα ψηφίσετε στις Εκλογές."),
        "faq": MessageLookupByLibrary.simpleMessage("ΣΥΧΝΕΣ ΕΡΩΤΗΣΕΙΣ"),
        "france": MessageLookupByLibrary.simpleMessage("Γαλλία"),
        "germany": MessageLookupByLibrary.simpleMessage("Γερμανία"),
        "homePageBackToTest":
            MessageLookupByLibrary.simpleMessage("Επιστροφή στο τεστ"),
        "homePageMatchesFoundQuote": m1,
        "homePageMyResults":
            MessageLookupByLibrary.simpleMessage("Τα αποτελέσματά μου"),
        "homePageStartButton":
            MessageLookupByLibrary.simpleMessage("Έναρξη νέου τεστ"),
        "hungary": MessageLookupByLibrary.simpleMessage("Ουγγαρία"),
        "languagePageSubtitle": MessageLookupByLibrary.simpleMessage(
            "Αυτό μπορεί να αλλάξει αργότερα από τις ρυθμίσεις."),
        "languagePageTitle": MessageLookupByLibrary.simpleMessage(
            "Ας συνεχίσουμε στα ελληνικά :)"),
        "loadingResultsPageTitle1": MessageLookupByLibrary.simpleMessage(
            "Τα εξατομικευμένα σας αποτελέσματα είναι καθ\' οδόν :)"),
        "loadingResultsPageTitle2": MessageLookupByLibrary.simpleMessage(
            "Αυτό θα είναι πιο γρήγορο από το να βρείτε εισιτήρια για την Taylor Swift 👀 "),
        "loadingResultsPageTitle3": m2,
        "loadingResultsPageTitle4": MessageLookupByLibrary.simpleMessage(
            "Σχεδόν έτοιμα, ένας τελευταίος έλεγχος..."),
        "neutral": MessageLookupByLibrary.simpleMessage("Ουδέτερος(-η)"),
        "no": MessageLookupByLibrary.simpleMessage("Όχι"),
        "ok": MessageLookupByLibrary.simpleMessage("ΟΚ"),
        "onBoardingCardQuestion": MessageLookupByLibrary.simpleMessage(
            "Δεν έχω ιδέα για το ποιους να ψηφίσω στις Ευρωεκλογές του 2024"),
        "onBoardingLastStepTitle": MessageLookupByLibrary.simpleMessage(
            "Σύρετε ανάλογα με το πόσο συμφωνείτε"),
        "onBoardingNotAnswerButton":
            MessageLookupByLibrary.simpleMessage("Προτιμώ να μην αναφέρω"),
        "onBoardingStep1Subtitle":
            MessageLookupByLibrary.simpleMessage("Δεν γνωρίζω"),
        "onBoardingStep1Title":
            MessageLookupByLibrary.simpleMessage("Πού θα ψηφίσετε;"),
        "onBoardingStep2Title": MessageLookupByLibrary.simpleMessage("Ηλικία"),
        "onBoardingStep3Option1":
            MessageLookupByLibrary.simpleMessage("Γυναίκα"),
        "onBoardingStep3Option2":
            MessageLookupByLibrary.simpleMessage("Άντρας"),
        "onBoardingStep3Option3": MessageLookupByLibrary.simpleMessage(
            "Άτομο με ρευστή ταυτότητα φύλου (gender-fluid)"),
        "onBoardingStep3Option4": MessageLookupByLibrary.simpleMessage(
            "Μη-δυαδικό άτομο (non-binary)"),
        "onBoardingStep3Option5": MessageLookupByLibrary.simpleMessage("Άλλο"),
        "onBoardingStep3Title":
            MessageLookupByLibrary.simpleMessage("Προσδιορίζομαι ως"),
        "poland": MessageLookupByLibrary.simpleMessage("Πολωνία"),
        "resultsPage10NopButton":
            MessageLookupByLibrary.simpleMessage("Όχι, ευχαριστώ!"),
        "resultsPage10Title": MessageLookupByLibrary.simpleMessage(
            "Θέλετε μια ειδοποίηση όταν έρθει η ώρα να πάτε να ψηφίσετε;"),
        "resultsPage10YesButton":
            MessageLookupByLibrary.simpleMessage("Ναιιιιι"),
        "resultsPage1Button":
            MessageLookupByLibrary.simpleMessage("Πατήστε για να συνεχίσετε"),
        "resultsPage1Text": MessageLookupByLibrary.simpleMessage(
            "Στις επόμενες οθόνες, θα ανακαλύψετε την πιο συμβατή σας Ομάδα στο Ευρωπαϊκό Κοινοβούλιο, τις αντίστοιχες τοπικές λίστες για να ψηφίσετε τον Ιούνιο στη χώρα σας, ενώ ανακαλύψαμε και μερικά επιπλέον πράγματα με βάση τις απαντήσεις σας 😌"),
        "resultsPage1Title": MessageLookupByLibrary.simpleMessage(
            "Μια αντιστοιχία και πολλά άλλα 👉👈"),
        "resultsPage2_1Title":
            MessageLookupByLibrary.simpleMessage("Ειλικρινά, ανάμεσα στο/στη"),
        "resultsPage2_2Title": MessageLookupByLibrary.simpleMessage(
            "και σε εμένα, είναι κάπως ένα Love Story (EU’s Version)"),
        "resultsPage3Title": MessageLookupByLibrary.simpleMessage(
            "Πόσο κοντά βρίσκομαι στις Ομάδες του Ευρωπαϊκού Κοινοβουλίου"),
        "resultsPage4TitleBottom":
            MessageLookupByLibrary.simpleMessage("Κατά της ένταξης στην ΕΕ"),
        "resultsPage4TitleLeft":
            MessageLookupByLibrary.simpleMessage("Αριστερά"),
        "resultsPage4TitleRight": MessageLookupByLibrary.simpleMessage("Δεξιά"),
        "resultsPage4TitleTop":
            MessageLookupByLibrary.simpleMessage("Υπέρ της ένταξης στην ΕΕ"),
        "resultsPage4TitleUserHere":
            MessageLookupByLibrary.simpleMessage("It’s me, hi!"),
        "resultsPage5Title": MessageLookupByLibrary.simpleMessage(
            "Σχετικά με πιο συγκεκριμένα θέματα, σε ποια ομάδα του Ευρωπαϊκού Κοινοβουλίου βρίσκομαι πιο κοντά;"),
        "resultsPage5Topic1":
            MessageLookupByLibrary.simpleMessage("Περιβαλλοντικά θέματα"),
        "resultsPage5Topic2": MessageLookupByLibrary.simpleMessage(
            "Ανθρώπινα & Κοινωνικά Δικαιώματα"),
        "resultsPage5Topic3":
            MessageLookupByLibrary.simpleMessage("Οικονομική παρέμβαση"),
        "resultsPage6Text": MessageLookupByLibrary.simpleMessage(
            "Στις επόμενες οθόνες, θα ανακαλύψετε τους καταλόγους υποψηφίων στη χώρα σας που είναι πιο πιθανό να ενταχθούν στην αντιστοιχία σας."),
        "resultsPage6_1Title": MessageLookupByLibrary.simpleMessage(
            "Εντάξει, είναι κούλ να ξέρω ποια ομάδα με καταλαβαίνει..."),
        "resultsPage6_2Title": MessageLookupByLibrary.simpleMessage(
            "Αλλά στις Ευρωεκλογές, ψηφίζουμε για μια τοπική λίστα"),
        "resultsPage7Disclaimer":
            MessageLookupByLibrary.simpleMessage("Χωρίς συγκεκριμένη σειρά."),
        "resultsPage7NoLocalCandidates": m3,
        "resultsPage7Title": m4,
        "resultsPage8Help": MessageLookupByLibrary.simpleMessage(
            "Είσαι μαχητής της κλιματικής αλλαγής! Πιστεύεις ότι η αντιμετώπιση της κλιματικής κρίσης απαιτεί συλλογική δράση, την οποία όλοι πρέπει να θέσουν σε ύψιστη προτεραιότητα. Δεν σε πειράζει που η ΕΕ ρυθμίζει τις εταιρείες για το σκοπό αυτό. Εξάλλου, τι νόημα έχει η οικονομική ανάπτυξη αν ο πλανήτης γίνει μη βιώσιμος;"),
        "resultsPage8_1Text": m5,
        "resultsPage8_2Text":
            MessageLookupByLibrary.simpleMessage("Ενεργού Δράσης για το κλίμα"),
        "resultsPage9Help": MessageLookupByLibrary.simpleMessage(
            "Κάντε κλικ στις κάρτες για ανακάτεμα"),
        "resultsPage9Text1": MessageLookupByLibrary.simpleMessage(
            "Οι εκλογές αφορούν πολλά θέματα, αλλά υπάρχει ένα πράγμα που πραγματικά"),
        "resultsPage9Text2":
            MessageLookupByLibrary.simpleMessage("Belongs With Me 😌"),
        "resultsShare": MessageLookupByLibrary.simpleMessage("Κοινοποίηση"),
        "romania": MessageLookupByLibrary.simpleMessage("Ρουμανία"),
        "settingsPagePrivacyPolicy":
            MessageLookupByLibrary.simpleMessage("Προστασία Δεδομένων"),
        "settingsPageShareButtonText":
            MessageLookupByLibrary.simpleMessage("Κοινοποίηση"),
        "settingsPageShareText": MessageLookupByLibrary.simpleMessage(
            "If this cute pigeon can\'t help you vote in June, nothing will. I\'ve used the app and you should too:"),
        "settingsPageSubtitle1":
            MessageLookupByLibrary.simpleMessage("Κύριοι Χορηγοί"),
        "settingsPageSubtitle2":
            MessageLookupByLibrary.simpleMessage("Ευρωπαϊκοί Συνεργάτες"),
        "settingsPageSubtitle3":
            MessageLookupByLibrary.simpleMessage("Ακαδημαϊκός Συνεργάτης"),
        "settingsPageSubtitle4":
            MessageLookupByLibrary.simpleMessage("Εθνικοί Θεσμικοί Συνεργάτες"),
        "settingsPageSubtitle5":
            MessageLookupByLibrary.simpleMessage("Πάροχοι Υπηρεσιών"),
        "settingsPageSubtitleLanguage": MessageLookupByLibrary.simpleMessage(
            "Προτιμώ να χρησιμοποιήσω αυτήν την εφαρμογή στα"),
        "settingsPageTextAbout": MessageLookupByLibrary.simpleMessage(
            "Η Palumba δεν είναι εταιρεία, ούτε πολιτικό κόμμα, ούτε κυβέρνηση. Είμαστε μια ανεξάρτητη μη κερδοσκοπική ένωση 120+ νέων 🐦 από όλη την Ευρώπη που μαζεύτηκαν πέρυσι το καλοκαίρι και άρχισαν να δημιουργούν αυτή την εφαρμογή. Έχουμε έναν στόχο: να σας βοηθήσουμε να καταλάβετε καλύτερα πώς λειτουργούν οι ευρωπαϊκές εκλογές και ποιες λίστες υποψηφίων θα μπορούσαν να ταιριάζουν με τις ιδέες σας, ώστε να μπορείτε να ψηφίσετε με μεγαλύτερη αυτοπεποίθηση ανθρώπους που υποστηρίζουν τις προτεραιότητές σας. Ο αλγόριθμός μας είναι ανοιχτού κώδικα, οι δηλώσεις στις οποίες κάνετε swipe έχουν ελεγχθεί από πολιτικούς επιστήμονες και τα δεδομένα σας είναι τόσο κρυπτογραφημένα που δεν έχουμε τρόπο να σας αναγνωρίσουμε ποτέ :)"),
        "settingsPageTextLanguage": MessageLookupByLibrary.simpleMessage(
            "Για να αλλάξετε τη γλώσσα, κάντε κλικ στην τρέχουσα γλώσσα"),
        "settingsPageTextPartners": MessageLookupByLibrary.simpleMessage(
            "Είναι σημαντικό να σας πούμε ότι οι συνεργάτες δεν έχουν καμία συντακτική εξουσία στο περιεχόμενο της εφαρμογής, η οποία παραμένει μια μη-κομματική πρωτοβουλία με σαφή στόχο: να σας βοηθήσει να καταλάβετε ποιοι υποστηρίζουν τις απόψεις σας σε ευρωπαϊκό και εθνικό επίπεδο."),
        "settingsPageTitleAbout":
            MessageLookupByLibrary.simpleMessage("Σχετικά"),
        "settingsPageTitleAssociation":
            MessageLookupByLibrary.simpleMessage("Η οργάνωση"),
        "settingsPageTitleLanguage":
            MessageLookupByLibrary.simpleMessage("Γλώσσα"),
        "settingsPageTitlePartners":
            MessageLookupByLibrary.simpleMessage("Συνεργάτες"),
        "shortAppName": MessageLookupByLibrary.simpleMessage("Palumba"),
        "skip": MessageLookupByLibrary.simpleMessage("Παράλειψη"),
        "spain": MessageLookupByLibrary.simpleMessage("Ισπανία"),
        "splashPageNoInternet": MessageLookupByLibrary.simpleMessage(
            "Φαίνεται πως δεν έχετε σύνδεση στο διαδίκτυο"),
        "sweden": MessageLookupByLibrary.simpleMessage("Σουηδία"),
        "textContinue": MessageLookupByLibrary.simpleMessage("Συνέχεια"),
        "yes": MessageLookupByLibrary.simpleMessage("Ναι")
      };
}
