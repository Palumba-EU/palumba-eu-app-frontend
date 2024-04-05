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

//TODO: Make sure to order list by value, from mayor to minor, before user it
  final List<CustomChartData> chartData = [
    CustomChartData(
        group: 'Greens/EFA',
        value: 100,
        percentage: '100%',
        image: 'https://picsum.photos/200'),
    CustomChartData(
        group: 'Renew',
        value: 90,
        percentage: '90%',
        image: 'https://picsum.photos/200'),
    CustomChartData(
        group: 'The Left',
        value: 75,
        percentage: '75%',
        image: 'https://picsum.photos/200'),
    CustomChartData(
        group: 'ID',
        value: 50,
        percentage: '50%',
        image: 'https://picsum.photos/200'),
    CustomChartData(
        group: 'ECR',
        value: 30,
        percentage: '30%',
        image: 'https://picsum.photos/200'),
    CustomChartData(
        group: 'S&D',
        value: 10,
        percentage: '10%',
        image: 'https://picsum.photos/200'),
    CustomChartData(
        group: 'EPP',
        value: 5,
        percentage: '5%',
        image: 'https://picsum.photos/200'),
  ];

  final List<CandidatesData> candidates = [
    CandidatesData(
        name: 'Candidate 1', party: 'ABC', image: 'https://picsum.photos/200'),
    CandidatesData(
        name: 'Candidate 2', party: 'ABC', image: 'https://picsum.photos/200'),
    CandidatesData(
        name: 'Candidate 3', party: 'ABC', image: 'https://picsum.photos/200'),
    CandidatesData(
        name: 'Candidate 4', party: 'ABC', image: 'https://picsum.photos/200'),
    CandidatesData(
        name: 'Candidate 5', party: 'ABC', image: 'https://picsum.photos/200'),
    CandidatesData(
        name: 'Candidate 6', party: 'ABC', image: 'https://picsum.photos/200'),
    CandidatesData(
        name: 'Candidate 7', party: 'ABC', image: 'https://picsum.photos/200'),
  ];

  List<int> showButtonSharePages = [1, 2, 5];

  RxInt _currentPage = 0.obs;
  int get currentPage => _currentPage.value;

  @override
  void onInit() {
    chartData.sort((b, a) => a.value.compareTo(b.value));
    pageController.addListener(() {
      _currentPage.value = pageController.page!.round();
    });
    super.onInit();
  }
}
