import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:palumba_eu/data/manager/data_manager.dart';
import 'package:palumba_eu/data/model/localization_data.dart';
import 'package:palumba_eu/data/model/sponsors_data.dart';
import 'package:palumba_eu/data/repositories/remote/data_repository.dart';
import 'package:palumba_eu/modules/settings/helpers/category_sponsor.dart';
import 'package:palumba_eu/modules/welcome/language/language_controller.dart';
import 'package:palumba_eu/utils/managers/language_manager.dart';
import 'package:palumba_eu/utils/string_utils.dart';
import 'package:palumba_eu/utils/utils.dart';

class SettingsPageController extends GetxController {
  static const route = '/settings';

  final DataRepository _dataRepository = Get.find<DataRepository>();

  final String rebuildLanguageKey = 'rebuildLanguage';

  List<Language>? _languages = DataManager().getLanguages();

  List<Language>? get languages => _languages;

  Language? get selectedLang => getSelectedLanguage();

  Rx<List<CategorySponsor>?> categoriesSponsors = Rx(null);

  @override
  void onInit() {
    super.onInit();
    _initSponsors();
  }

  void _initSponsors() async {
    var response = DataManager()
        .getSponsors(); //(await _dataRepository.fetchSponsors())?.data ?? [];

    var categories = <CategorySponsor>[];
    var category = '';
    var sponsors = <Sponsor>[];
    for (var i = 0; i < response.length; i++) {
      var sponsor = response[i];

      if (category.isNotEmpty && category != sponsor.category) {
        categories.add(CategorySponsor(category: category, sponsors: sponsors));
        sponsors = [];
      }

      category = sponsor.category ?? '';
      sponsors.add(sponsor);
    }

    categories.add(CategorySponsor(category: category, sponsors: sponsors));

    categoriesSponsors.value = categories;
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

  goToSelectLanguage() async {
    final result = await Get.toNamed(LanguageController.route);
    if (result == true) {
      update([rebuildLanguageKey]);
    }
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
    //TODO: Share link to share the app.
  }
}
