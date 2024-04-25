import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:palumba_eu/data/manager/data_manager.dart';
import 'package:palumba_eu/data/model/localization_data.dart';
import 'package:palumba_eu/data/repositories/local/local_data_repository.dart';
import 'package:palumba_eu/modules/welcome/entrance/entrance_controller.dart';
import 'package:palumba_eu/utils/managers/language_manager.dart';
import 'package:palumba_eu/utils/managers/user_manager.dart';

class LanguageController extends GetxController {
  static const route = '/language';

  final LocalDataRepository _localDataRepository =
      Get.find<LocalDataRepository>();

  ScrollController scrollController = ScrollController();

  List<Language>? _languages = DataManager().getLanguages();

  List<Language>? get languages => _languages;

  RxInt indexSelected = 0.obs;

  @override
  void onInit() {
    selectCurrentLanguage();

    super.onInit();
  }

  /**
   * Initial Actions
   */
  void selectCurrentLanguage() {
    final currentLanguage = LanguageManager.currentLanguage;
    final index = languages!
        .indexWhere((element) => element.languagecode == currentLanguage);
    if (index != -1) {
      indexSelected.value = index;
    }
    WidgetsBinding.instance.addPostFrameCallback((_) {
      scrollController.animateTo((65 * index).toDouble(),
          duration: Durations.short1, curve: Curves.easeIn);
    });
  }

  /**
   * On Click Actions
   */
  void onLanguagePressed(int index) {
    indexSelected.value = index;
  }

  void onContinueTap() async {
    final isOnboarded = await _localDataRepository.onBoarded;

    UserManager.setLanguageId(languages![indexSelected.value].id!.toString());
    LanguageManager.setLanguage(languages![indexSelected.value].languagecode!);
    _localDataRepository.language =
        languages![indexSelected.value].languagecode!;
    if (isOnboarded == true) {
      Get.back(result: true);
      return;
    }
    Get.offAllNamed(EntranceController.route);
  }
}
