import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:palumba_eu/data/model/election.dart';
import 'package:palumba_eu/data/repositories/local/local_data_repository.dart';
import 'package:palumba_eu/modules/results/helpers/results_helper.dart';
import 'package:palumba_eu/modules/results/results_controller.dart';
import 'package:palumba_eu/utils/managers/plausible_manager.dart';
import 'package:palumba_eu/utils/managers/user_manager.dart';
import 'package:palumba_eu/utils/string_utils.dart';
import 'package:palumba_eu/utils/managers/i18n_manager/translations/generated/l10n.dart';

class LoadingResultsController extends GetxController {
  static const route = '/loading_results';

  final LocalDataRepository _localDataRepository =
      Get.find<LocalDataRepository>();

  final totalSteps = 4;

  final int milliSecondsStep = 4500;
  //NEW: Random loading texts
    final List<String Function(BuildContext)> _loadingPool = [//NEW
    (c) => S.of(c).loadingResultsPageRandom1,
    (c) => S.of(c).loadingResultsPageRandom2,
    (c) => S.of(c).loadingResultsPageRandom3,
    (c) => S.of(c).loadingResultsPageRandom4,
    (c) => S.of(c).loadingResultsPageRandom5,
    (c) => S.of(c).loadingResultsPageRandom6,
  ];

  late List<int> _randomOrder;

  void _prepareRandomTitles() {//take 3 random titles from the loadingPool
    final indices = List<int>.generate(_loadingPool.length, (i) => i)..shuffle();
    _randomOrder = indices.take(3).toList();
  }


  RxInt currentStep = 0.obs;

  List<PartyUserDistance> _partyUserDistanceList = [];

  String get countryName => UserManager.userCountry?.name ?? 'Your country';

  @override
  void onInit() {
    //Set test finished
    UserManager.isTestRunning = false;
    super.onInit();
    PlausibleManager.trackPage(route);
  }

  @override
  void onReady() {
    super.onReady();
    _prepareRandomTitles();
    _init();
    _initData();
  }

  void _init() {
    currentStep.value = 1;

    Timer.periodic(Duration(milliseconds: milliSecondsStep), (timer) {
      if (currentStep.value < 4) {
        currentStep.value = currentStep.value + 1;
      } else {
        timer.cancel();

        //Store answers as local data
        final jsonListAnswers =
            UserManager.userData.answers.map((e) => e.toJson()).toList();
        _localDataRepository.answers = jsonListAnswers;

        //Store results as local data
        final jsonListResults =
            _partyUserDistanceList.map((e) => e.toJson()).toList();
        _localDataRepository.results = jsonListResults;

        //Navigate to results screen
        Get.offAllNamed(ResultsController.route, arguments: {
          StringUtils.answersDataKey: jsonListAnswers,
          StringUtils.resultsDataKey: jsonListResults,
        });
      }
    });
  }

  void _initData() {
    _getResultsData();
  }

  Future<void> _getResultsData() async {
    _partyUserDistanceList =
        ResultsHelper.getPartyUserDistances(UserManager.userData.answers);
  }
  bool _shouldUseRandom(Election election) {//check if the election is NYC
    return election != Election.EU && election != Election.DE;
  }

  String titleForIndex(BuildContext context, Election election) {
    switch (currentStep.value) {
      case 1:
        return _shouldUseRandom(election)
            ? _loadingPool[_randomOrder[0]](context)
            : election.loadingResultsPageTitle1(context);
      case 2:
        return _shouldUseRandom(election)
            ? _loadingPool[_randomOrder[1]](context)
            : election.loadingResultsPageTitle2(context);
      case 3:
        return _shouldUseRandom(election)
            ? _loadingPool[_randomOrder[2]](context)
            : election.loadingResultsPageTitle3(context, countryName);
      case 4:
        return election.loadingResultsPageTitle4(context);
    }
    return '';
  }
}
