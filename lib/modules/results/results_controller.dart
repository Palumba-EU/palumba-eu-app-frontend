import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:palumba_eu/modules/results/components/custom_semicircle_chart/custom_semicircle_chart.dart';
import 'package:palumba_eu/modules/results/models/canadidates_model.dart';
import 'package:palumba_eu/modules/results/pages/results_page_1.dart';
import 'package:palumba_eu/modules/results/pages/results_page_2.dart';
import 'package:palumba_eu/modules/results/pages/results_page_3.dart';
import 'package:palumba_eu/modules/results/pages/results_page_4.dart';
import 'package:palumba_eu/modules/results/pages/results_page_5.dart';
import 'package:palumba_eu/modules/results/pages/results_page_6.dart';

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

  void _getArguments() {
    final args = Get.arguments;
    if (args != null) {
      //TODO: get arguments from previous page (chartdata, candidates & results)
    }
  }
}
