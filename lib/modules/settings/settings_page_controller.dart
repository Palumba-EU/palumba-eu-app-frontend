import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:palumba_eu/data/manager/data_manager.dart';
import 'package:palumba_eu/data/model/election.dart';
import 'package:palumba_eu/data/model/localization_data.dart';
import 'package:palumba_eu/data/model/sponsors_data.dart';
import 'package:palumba_eu/modules/settings/helpers/category_sponsor.dart';
import 'package:palumba_eu/modules/welcome/election/election_controller.dart';
import 'package:palumba_eu/modules/welcome/language/language_controller.dart';
import 'package:palumba_eu/utils/managers/election_manager.dart';
import 'package:palumba_eu/utils/managers/i18n_manager/translations/generated/l10n.dart';
import 'package:palumba_eu/utils/managers/language_manager.dart';
import 'package:palumba_eu/utils/managers/plausible_manager.dart';
import 'package:palumba_eu/utils/string_utils.dart';
import 'package:palumba_eu/utils/utils.dart';
import 'package:share_plus/share_plus.dart';

class SettingsPageController extends GetxController {
  static const route = '/settings';

  final String rebuildLanguageKey = 'rebuildLanguage';
  final String rebuildElectionKey = 'rebuildElection';

  List<Language>? _languages = DataManager().getLanguages();
  List<Language>? get languages => _languages;
  Language? get selectedLang => getSelectedLanguage();

  Election get selectedElection => getSelectedElection();

  Rx<List<CategorySponsor>?> categoriesSponsors = Rx(null);

  RxString appVersionAndBuildNumber = "".obs;

  @override
  void onInit() {
    super.onInit();
    _initSponsors();
    _initAppVersion();
    PlausibleManager.trackPage(route);
  }

  void _initAppVersion() async {
    var appVersion = await Utils.appVersion();
    var buildNumber = await Utils.buildNumber();
    appVersionAndBuildNumber.value = appVersion + " (" + buildNumber + ")";
  }

  void _initSponsors() async {
    var response = DataManager().getSponsors();

    var categories = <CategorySponsor>[];
    var category = '';
    var sponsors = <Sponsor>[];
    for (var i = 0; i < response.length; i++) {
      var sponsor = response[i];

      if (category.isNotEmpty && category != sponsor.category) {
        var current = categories
            .firstWhereOrNull((element) => element.category == category);
        if (current != null) {
          current.sponsors.addAll(sponsors);
        } else {
          categories
              .add(CategorySponsor(category: category, sponsors: sponsors));
        }
        sponsors = [];
      }

      category = sponsor.category ?? '';
      sponsors.add(sponsor);
    }

    var current =
        categories.firstWhereOrNull((element) => element.category == category);
    if (current != null) {
      current.sponsors.addAll(sponsors);
    } else {
      categories.add(CategorySponsor(category: category, sponsors: sponsors));
    }

    categoriesSponsors.value = categories;
  }

  goToSelectLanguage() async {
    final result = await Get.toNamed(LanguageController.route);
    if (result == true) {
      update([rebuildLanguageKey]);
    }
  }

  Language? getSelectedLanguage() {
    try {
      return _languages?.firstWhere(
          (lang) => lang.languagecode == (LanguageManager.currentLanguage));
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }

  goToSelectElection() async {
    var result = await Get.toNamed(ElectionController.route);
    if (result == true) {
      update([rebuildElectionKey]);
    }
  }

  Election getSelectedElection() {
    return ElectionManager.currentElection.value;
  }

  void launchPrivacyPoliciesUrl() {
    Utils.launch(StringUtils.privacyStatementUrl);
  }

  void launchFaqUrl() {
    Utils.launch(StringUtils.faqUrl);
  }

  void launchOrganization() {
    Utils.launch(StringUtils.organizationUrl);
  }

  void launchEmail() {
    Utils.launch(StringUtils.contactEmailUrl);
  }

  void launchSponsors(Sponsor sponsor) {
    if (sponsor.bannerLink != null) {
      Utils.launch(sponsor.bannerLink!);
    }
  }

  void shareApp() {
    Share.share(
        '${S.of(Get.context!).settingsPageShareText} ${StringUtils.webUrl}');
  }
}
