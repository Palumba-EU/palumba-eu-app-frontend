import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:palumba_eu/modules/results/pages/page_1/results_page_1.dart';
import 'package:palumba_eu/modules/results/pages/page_2/results_page_2.dart';
import 'package:palumba_eu/modules/results/pages/page_3/results_page_3.dart';
import 'package:palumba_eu/modules/results/pages/page_4/results_page_4.dart';
import 'package:palumba_eu/modules/results/pages/page_5/results_page_5.dart';
import 'package:palumba_eu/modules/results/pages/page_6/results_page_6.dart';

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

  RxInt _currentPage = 0.obs;
  int get currentPage => _currentPage.value;

  @override
  void onInit() {
    pageController.addListener(() {
      _currentPage.value = pageController.page!.round();
    });
    super.onInit();
  }
}
