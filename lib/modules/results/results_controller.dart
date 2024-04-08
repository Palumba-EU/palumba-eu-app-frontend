import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:palumba_eu/data/model/results_data.dart';
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

  final List<CustomChartData> chartData = CustomChartData.mockData;

  final List<CandidatesData> candidates = CandidatesData.mockData;

  List<int> showButtonSharePages = [1, 2, 5];

  RxInt _currentPage = 0.obs;
  int get currentPage => _currentPage.value;

  ResultsData? _resultsData;

  @override
  void onInit() {
    _getArguments();
    // Make sure to order list by value, from mayor to minor, before user it
    chartData.sort((b, a) => a.value.compareTo(b.value));
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
      _resultsData = ResultsData.fromJson(args[StringUtils.resultsDataKey]);
      _resultsData!.parties?.map((party) {
        chartData.add(CustomChartData(
          party: party.name ?? '',
          value: 20,
          image: party.logo ?? '',
          percentage: 'party.position![0]',
        ));
      });
    }
  }

  PoliticParty? getFisrtParty() {
    var partyWithSmallestPosition =
        _resultsData?.parties?.reduce((party1, party2) {
      return party1.position![0] < party2.position![0] ? party1 : party2;
    });
    return partyWithSmallestPosition;
  }

  Color getFirstPartyColor() {
    final party = getFisrtParty();
    if (party?.color != null) {
      return Color(
          int.parse(party!.color!.substring(1, 7), radix: 16) + 0xFF000000);
    } else {
      return AppColors.text;
    }
  }
}
