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

  List<PartyUserDistance> hardCodedResponse = [];

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
        if (_partyUserDistanceList.isNotEmpty) {
          Get.offAllNamed(ResultsController.route, arguments: {
            StringUtils.resultsDataKey:
                _partyUserDistanceList.map((e) => e.toJson()).toList(),
          });
        } else {
          hardCodedResponse = [
            PartyUserDistance(party: _resultsData!.parties![0], percentage: 80),
            PartyUserDistance(party: _resultsData!.parties![1], percentage: 60),
            PartyUserDistance(party: _resultsData!.parties![2], percentage: 40),
            PartyUserDistance(party: _resultsData!.parties![3], percentage: 20),
            PartyUserDistance(party: _resultsData!.parties![4], percentage: 50),
            PartyUserDistance(party: _resultsData!.parties![5], percentage: 5),
            PartyUserDistance(party: _resultsData!.parties![3], percentage: 8),
          ];
          Get.offAllNamed(ResultsController.route, arguments: {
            StringUtils.resultsDataKey:
                hardCodedResponse.map((e) => e.toJson()).toList(),
          });
        }
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
      List<StatementResponse> maxDisagreeAnswers =
          List<StatementResponse>.generate(
              numStatements, (index) => StatementResponse.stronglyDisagree);
      List<StatementResponse> maxAgreeAnswers =
          List<StatementResponse>.generate(
              numStatements, (index) => StatementResponse.stronglyAgree);
      int maxDistance = calculateDistance(maxAgreeAnswers, maxDisagreeAnswers);

      //Distance between user and party
      final distance = calculateDistance(
        UserManager.userData.answers.map((e) => e.answer).toList(),
        (party.answers ?? []).map((e) => e.answer).toList(),
      );
      /*  ResultsHelper.parseResultPartyStatementResponses(
              party.position ?? []));*/

      //Calculate percentage and add to List
      int percentage = ((1 - (distance / maxDistance)) * 100).round();
      _partyUserDistanceList
          .add(PartyUserDistance(party: party, percentage: percentage));
    }
  }

  int calculateDistance(List<StatementResponse> userAnswers,
      List<StatementResponse> epGroupAnswers) {
    int totalDistance = 0;

    for (int i = 0; i < userAnswers.length; i++) {
      if (userAnswers[i] == StatementResponse.skip) {
        continue;
      }
      int statementDistance =
          ResultsHelper.likertDistance(userAnswers[i], epGroupAnswers[i]);
      totalDistance += statementDistance;
    }

    return totalDistance;
  }
}
