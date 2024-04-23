import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:palumba_eu/data/model/results_data.dart';
import 'package:palumba_eu/data/model/user_model.dart';
import 'package:palumba_eu/modules/home/home_page_controller.dart';
import 'package:palumba_eu/modules/results/helpers/results_helper.dart';
import 'package:palumba_eu/modules/results/pages/results_page_1.dart';
import 'package:palumba_eu/modules/results/pages/results_page_2.dart';
import 'package:palumba_eu/modules/results/pages/results_page_3.dart';
import 'package:palumba_eu/modules/results/pages/results_page_4.dart';
import 'package:palumba_eu/modules/results/pages/results_page_5.dart';
import 'package:palumba_eu/modules/results/pages/results_page_6.dart';
import 'package:palumba_eu/modules/results/pages/results_page_7.dart';
import 'package:palumba_eu/modules/results/pages/results_page_8.dart';
import 'package:palumba_eu/utils/common_ui/app_colors.dart';
import 'package:palumba_eu/utils/extensions.dart';
import 'package:palumba_eu/utils/managers/i18n_manager/translations/generated/l10n.dart';
import 'package:palumba_eu/utils/managers/language_manager.dart';
import 'package:palumba_eu/utils/managers/user_manager.dart';
import 'package:palumba_eu/utils/string_utils.dart';
import 'package:palumba_eu/utils/utils.dart';
import 'package:share_plus/share_plus.dart';

import 'models/custom_chart_data.dart';

class ResultsController extends GetxController {
  static const route = '/results';

  final pageController = PageController();
  final List<Widget> pages = [
    ResultsPage1(),
    ResultsPage2(),
    ResultsPage3(),
    ResultsPage4(),
    ResultsPage5(),
    ResultsPage6(),
    ResultsPage7(),
    ResultsPage8(),
  ];

  List<CustomChartData> chartData = [];

  UserData get userData => UserManager.userData;

  List<int> showButtonSharePages = [1, 2, 3, 5];

  RxInt _currentPage = 0.obs;
  int get currentPage => _currentPage.value;

  List<PartyUserDistance> _resultsData = [];

  List<LocalParties>? get localParties => filterLocalPartiesByCountry();

  PartyUserDistance? _maxPercentagePoliticParty;
  PartyUserDistance? get maxPercentagePoliticParty =>
      _maxPercentagePoliticParty ??
      (_resultsData.isEmpty ? null : _resultsData.first);

  bool get isSpecialPage => _currentPage.value == 4 || _currentPage.value == 5;

  //TODO: add your country translation
  String get countryName => UserManager.userCountry?.name ?? 'Your country';

  @override
  void onInit() {
    _getArguments();

    pageController.addListener(() {
      _currentPage.value = pageController.page!.round();
    });
    super.onInit();
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }

  void _getArguments() {
    final args = Get.arguments as Map<String, dynamic>?;
    if (args != null) {
      final data =
          args[StringUtils.resultsDataKey] as List<Map<String, dynamic>>;

      _resultsData = data.map((e) => PartyUserDistance.fromJson(e)).toList();

      //Convert the data to the format that the chart needs
      _resultsData.forEach((result) {
        chartData.add(CustomChartData(
          party: result.party.acronym.isNullOrEmpty
              ? (result.party.name ?? '')
              : result.party.acronym ?? '',
          value: result.percentage.toDouble(),
          image: result.party.logo ?? '',
          percentage: '${result.percentage}%',
        ));
      });
      //ATTENTION! Make sure to order list by value, from mayor to minor, before user it. If not chart will not work
      chartData.sort((b, a) => a.value.compareTo(b.value));
      _maxPercentagePoliticParty = getMajorPercentageParty();
    }
  }

  PartyUserDistance? getMajorPercentageParty() {
    if (_resultsData.isEmpty) return null;
    //Get the party with mayor percentage (minor distance)
    PartyUserDistance? maxPercentageParty;
    List<PartyUserDistance> topPercentageParties = [];
    double maxPercentageValue = double.negativeInfinity;

    for (PartyUserDistance data in _resultsData) {
      if (data.percentage > maxPercentageValue) {
        maxPercentageValue = data.percentage.toDouble();
        topPercentageParties = [data];
      } else if (data.percentage == maxPercentageValue) {
        topPercentageParties.add(data);
      }
    }
    //If there is more than one party with the same percentage, get a random one
    Random random = Random();
    maxPercentageParty =
        topPercentageParties[random.nextInt(topPercentageParties.length)];

    return maxPercentageParty;
  }

  Color getFirstPartyColor() {
    final fisrtParty = maxPercentagePoliticParty;
    if (fisrtParty?.party.color != null) {
      return Color(
          int.parse(fisrtParty!.party.color!.substring(1, 7), radix: 16) +
              0xFF000000);
    } else {
      return AppColors.text;
    }
  }

  void changePage(TapDownDetails details) {
    if (details.localPosition.dx < Get.width * .25) {
      if (currentPage > 0) {
        pageController.previousPage(
          duration: Duration(milliseconds: 1),
          curve: Curves.easeInOut,
        );
      }
    } else if (details.localPosition.dx > Get.width * .75) {
      if (currentPage < pages.length - 1) {
        pageController.nextPage(
          duration: Duration(milliseconds: 1),
          curve: Curves.easeInOut,
        );
      }
    }
  }

  List<LocalParties> filterLocalPartiesByCountry() {
    List<LocalParties> localParties = [];
    for (LocalParties localParty
        in maxPercentagePoliticParty?.party.localParties ?? []) {
      if (localParty.countryId == userData.countryId) {
        localParties.add(localParty);
      }
    }
    return localParties;
  }

  void launchUrl() {
    Utils.launch(StringUtils.electionsUrl(LanguageManager.currentLanguage));
    Get.offAllNamed(HomePageController.route);
  }

  void shareContent() async {
    final sharedText = S.of(Get.context!).resultsSocialShareData(
        "*${maxPercentagePoliticParty?.party.name ?? '-'}*",
        "*${maxPercentagePoliticParty?.percentage ?? '-'}*");
    Share.share(sharedText);
  }
}
