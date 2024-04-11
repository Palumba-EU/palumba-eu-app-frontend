import 'dart:async';

import 'package:get/get.dart';
import 'package:palumba_eu/data/model/results_data.dart';
import 'package:palumba_eu/data/model/user_model.dart';
import 'package:palumba_eu/data/repositories/remote/data_repository.dart';
import 'package:palumba_eu/modules/results/helpers/results_helper.dart';
import 'package:palumba_eu/modules/results/results_controller.dart';
import 'package:palumba_eu/utils/managers/user_manager.dart';
import 'package:palumba_eu/utils/string_utils.dart';

class LoadingResultsController extends GetxController {
  static const route = '/loading_results';

  final DataRepository _dataRepository = Get.find<DataRepository>();

  final totalSteps = 6;

  RxInt currentStep = 1.obs;

  ResultsData? _resultsData;

  List<PartyUserDistance> _partyUserDistanceList = [];

  @override
  void onReady() {
    super.onReady();
    _init();
    _initData();
  }

  void _init() {
    Timer.periodic(const Duration(seconds: 2), (timer) {
      if (currentStep.value < 5) {
        currentStep.value = currentStep.value + 1;
      } else {
        timer.cancel();

        Get.offAllNamed(ResultsController.route, arguments: {
          StringUtils.resultsDataKey:
              _partyUserDistanceList.map((e) => e.toJson()).toList(),
        });
      }
    });
  }

  void _initData() async {
    final result = await _dataRepository.setResponse(UserManager.userData);
    if (!result) {
      //TODO: Handle error
    }
    await _getResultsData();
  }

  Future<void> _getResultsData() async {
    _resultsData = await _dataRepository.fetchResultsInfo();

    //Calculate distances percentage
    for (final PoliticParty party in _resultsData?.parties ?? []) {
      //Calculate max distance
      int numStatements = party.position?.length ?? 0;
      List<Answer> maxDisagreeAnswers = List<Answer>.generate(
          numStatements,
          (index) => Answer(
              statementId: index, answer: StatementResponse.stronglyDisagree));
      List<Answer> maxAgreeAnswers = List<Answer>.generate(
          numStatements,
          (index) => Answer(
              statementId: index, answer: StatementResponse.stronglyAgree));
      int maxDistance = calculateDistance(maxAgreeAnswers, maxDisagreeAnswers);

      //Distance between user and party
      final userAnswers = UserManager.userData.answers;
      final partyAnswers = party.answers ?? [];
      final distance = calculateDistance(
        userAnswers,
        partyAnswers,
      );
      /*  ResultsHelper.parseResultPartyStatementResponses(
              party.position ?? []));*/

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
