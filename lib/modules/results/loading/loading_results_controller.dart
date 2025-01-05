import 'dart:async';
import 'package:get/get.dart';
import 'package:palumba_eu/data/repositories/local/local_data_repository.dart';
import 'package:palumba_eu/data/repositories/remote/data_repository.dart';
import 'package:palumba_eu/modules/results/helpers/results_helper.dart';
import 'package:palumba_eu/modules/results/results_controller.dart';
import 'package:palumba_eu/utils/managers/user_manager.dart';
import 'package:palumba_eu/utils/string_utils.dart';

class LoadingResultsController extends GetxController {
  static const route = '/loading_results';

  final DataRepository _dataRepository = Get.find<DataRepository>();

  final LocalDataRepository _localDataRepository =
      Get.find<LocalDataRepository>();

  final totalSteps = 4;

  final int milliSecondsStep = 4500;

  RxInt currentStep = 0.obs;

  List<PartyUserDistance> _partyUserDistanceList = [];

  String get countryName => UserManager.userCountry?.name ?? 'Your country';

  @override
  void onInit() {
    //Set test finished
    UserManager.setTestRuning(false);
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
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
    _dataRepository.setResponse();
    _getResultsData();
  }

  Future<void> _getResultsData() async {
    _partyUserDistanceList =
        ResultsHelper.getPartyUserDistances(UserManager.userData.answers);
  }
}
