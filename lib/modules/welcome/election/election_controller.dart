import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:palumba_eu/data/model/election.dart';
import 'package:palumba_eu/data/repositories/local/local_data_repository.dart';
import 'package:palumba_eu/data/repositories/remote/data_repository.dart';
import 'package:palumba_eu/modules/welcome/entrance/entrance_controller.dart';
import 'package:palumba_eu/modules/welcome/language/language_controller.dart';
import 'package:palumba_eu/utils/managers/election_manager.dart';
import 'package:palumba_eu/utils/managers/plausible_manager.dart';

class ElectionController extends GetxController {
  static const route = '/election';

  final DataRepository _dataRepository = Get.find<DataRepository>();
  final LocalDataRepository _localDataRepository =
      Get.find<LocalDataRepository>();

  ScrollController scrollController = ScrollController();

  List<Election> elections = Election.values;

  RxInt indexSelected = 0.obs;

  @override
  void onInit() {
    super.onInit();
    PlausibleManager.trackPage(route);
  }

  @override
  void onReady() {
    selectCurrentElection();
  }

  /**
   * Initial Actions
   */
  void selectCurrentElection() {
    final currentElection = ElectionManager.currentElection.value;
    final index = elections.indexWhere((e) => e == currentElection);

    if (index != -1) {
      indexSelected.value = index;
      ElectionManager.setElection(elections[indexSelected.value]);
    }

    WidgetsBinding.instance.addPostFrameCallback((_) {
      scrollController.animateTo((65 * index).toDouble(),
          duration: Durations.short1, curve: Curves.easeIn);
    });
  }

  /**
   * On Click Actions
   */
  void onElectionPressed(int index) {
    indexSelected.value = index;
    ElectionManager.setElection(elections[indexSelected.value]);
  }

  void onContinueTap() async {
    await _dataRepository.fetchLocalizations();

    final isOnboarded = await _localDataRepository.onBoarded;
    if (isOnboarded != null && isOnboarded) {
      Get.toNamed(LanguageController.route, arguments: 'fromElection');
      return;
    }
    Get.offAllNamed(EntranceController.route);
  }
}
