import 'dart:async';

import 'package:get/get.dart';
import 'package:palumba_eu/data/model/results_data.dart';
import 'package:palumba_eu/data/model/user_model.dart';
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

  final int secondsStep = 3;

  RxInt currentStep = 0.obs;

  ResultsData? _resultsData;

  List<PartyUserDistance> _partyUserDistanceList = [];

  //TODO: add your country translation
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

    Timer.periodic(Duration(seconds: secondsStep), (timer) {
      if (currentStep.value < 4) {
        currentStep.value = currentStep.value + 1;
      } else {
        timer.cancel();

        final jsonListResults =
            _partyUserDistanceList.map((e) => e.toJson()).toList();
        //Store results as local data
        _localDataRepository.results = jsonListResults;

        //Navigate to results screen
        Get.offAllNamed(ResultsController.route, arguments: {
          StringUtils.resultsDataKey: jsonListResults,
        });
      }
    });
  }

  void _initData() async {
    final result = await _dataRepository.setResponse();
    if (!result) {
      //TODO: Handle error
    }
    await _getResultsData();
  }

  Future<void> _getResultsData() async {
    _resultsData = await _dataRepository.fetchResultsInfo();

    //Calculate distances percentage
    for (final PoliticParty party in _resultsData?.parties ?? []) {
      final userAnswers = UserManager.userData.answers;
      final partyAnswers = party.answers ?? [];
      //Calculate max distance
      final userAnswersNotSkipped = userAnswers
          .where((element) => element.answer != StatementResponse.skip)
          .toList();
      int numStatements = party.answers?.length ??
          0; //  userAnswersNotSkipped.length; //TODO: check if this is correct
      List<Answer> maxDisagreeAnswers = List<Answer>.generate(
          numStatements,
          (index) => Answer(
              statementId: index, answer: StatementResponse.stronglyDisagree));
      List<Answer> maxAgreeAnswers = List<Answer>.generate(
          numStatements,
          (index) => Answer(
              statementId: index, answer: StatementResponse.stronglyAgree));
      int maxDistance = calculateDistance(maxAgreeAnswers, maxDisagreeAnswers);

      //Calculate distance between user and party

      final distance = calculateDistance(
        userAnswers,
        partyAnswers,
      );

      //Calculate percentage and add to List
      int percentage = 0;
      if (distance != -1) {
        percentage = ((1 - (distance / maxDistance)) * 100).round();
      }

      _partyUserDistanceList
          .add(PartyUserDistance(party: party, percentage: percentage));
    }
  }

  int calculateDistance(List<Answer> userAnswers, List<Answer> epGroupAnswers) {
    int totalDistance = 0;
    int answersCount = 0;
    for (int i = 0; i < userAnswers.length; i++) {
      if (userAnswers[i] == StatementResponse.skip) {
        continue;
      }
      //Check if user statment is in the party answers
      if (!epGroupAnswers
          .any((answer) => answer.statementId == userAnswers[i].statementId)) {
        continue;
      }
      answersCount++;
      Answer matchingAnswer = epGroupAnswers.firstWhere(
        (answer) => answer.statementId == userAnswers[i].statementId,
      );
      int statementDistance = ResultsHelper.likertDistance(
        userAnswers[i].answer,
        matchingAnswer.answer,
      );
      totalDistance += statementDistance;
    }
    return answersCount == 0 ? -1 : totalDistance;
  }
}
