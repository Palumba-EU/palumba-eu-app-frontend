import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:palumba_eu/modules/results/helpers/results_helper.dart';
import 'package:palumba_eu/modules/results/models/canadidates_model.dart';
import 'package:palumba_eu/modules/results/pages/results_page_1.dart';
import 'package:palumba_eu/modules/results/pages/results_page_2.dart';
import 'package:palumba_eu/modules/results/pages/results_page_3.dart';
import 'package:palumba_eu/modules/results/pages/results_page_4.dart';
import 'package:palumba_eu/modules/results/pages/results_page_5.dart';
import 'package:palumba_eu/modules/results/pages/results_page_6.dart';
import 'package:palumba_eu/utils/common_ui/app_colors.dart';
import 'package:palumba_eu/utils/string_utils.dart';

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
  ];

  //final List<CustomChartData> chartData = CustomChartData.mockData;

  //final List<CandidatesData> candidates = CandidatesData.mockData;

  List<CustomChartData> chartData = [];

  List<int> showButtonSharePages = [1, 2, 5];

  RxInt _currentPage = 0.obs;
  int get currentPage => _currentPage.value;

  List<PartyUserDistance> _resultsData = [];

  PartyUserDistance? _maxPercentagePoliticParty;
  PartyUserDistance? get maxPercentagePoliticParty =>
      _maxPercentagePoliticParty ?? _resultsData.first;

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
      ;
      //Convert the data to the format that the chart needs
      _resultsData.forEach((result) {
        chartData.add(CustomChartData(
          party: result.party.acronym ?? (result.party.name ?? ''),
          value: result.percentage.toDouble(),
          image: result.party.logo ?? '',
          percentage: '${result.percentage}%',
        ));
      });
      //ATTENTION! Make sure to order list by value, from mayor to minor, before user it. If not chart will not work
      chartData.sort((b, a) => a.value.compareTo(b.value));
      getFisrtParty();
    }
  }

  PartyUserDistance? getFisrtParty() {
    //Get the party with mayor percentage (minor distance)
    PartyUserDistance? maxPercentageParty;
    double maxPercentageValue = double.negativeInfinity;

    for (PartyUserDistance data in _resultsData) {
      if (data.percentage > maxPercentageValue) {
        maxPercentageValue = data.percentage.toDouble();
        maxPercentageParty = data;
      }
    }

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
    if (details.localPosition.dx < Get.width / 2) {
      if (currentPage > 0) {
        pageController.previousPage(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      }
    } else {
      if (currentPage < pages.length - 1) {
        pageController.nextPage(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      }
    }
  }
}
