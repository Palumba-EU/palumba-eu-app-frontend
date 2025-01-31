import 'package:get/get.dart';
import 'package:palumba_eu/data/model/election.dart';
import 'package:palumba_eu/data/model/elections_response.dart';
import 'package:palumba_eu/data/repositories/local/local_data_repository.dart';
import 'package:palumba_eu/modules/home/home_page_controller.dart';
import 'package:palumba_eu/utils/managers/user_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:device_region/device_region.dart';

class ElectionManager {
  static final Rx<Election> currentElection = Election.EU.obs;
  static EggScreen? eggInfo;

  static const String keyElection = 'election';

  ElectionManager._internal() {
    init();
  }

  static init() async {
    await setupElection();
  }

  static setupElection() async {
    // returned AT => need to test it for DE
    var election = await getSavedElection();
    var countryCode = await DeviceRegion.getSIMCountryCode();

    if (election != null) {
      currentElection.value = election;
    } else {
      currentElection.value = countryCode == "DE" ? Election.DE : Election.EU;
    }
  }

  static setElection(Election election) async {
    // reset pre election data
    if (currentElection.value != election) {
      final LocalDataRepository _localDataRepository =
          Get.find<LocalDataRepository>();
      _localDataRepository.answers = null;
      _localDataRepository.results = null;

      // TODO:
      // clean up this answers code completely.
      // No view should directly use the _localDataRepository,
      // but have a ViewModel wrapper which holds Rx instances writing back and forth with _localDataRepository
      if (Get.isRegistered<HomePageController>()) {
        // If it is for some reason not registerd, the init runs the function anyway
        Get.find<HomePageController>().obtainLocalStoredLastResults();
      }
      UserManager.isTestRunning = false;
    }

    currentElection.value = election;
    setSavedElection(election);
  }

  /// Manage Local Data
  static Future setSavedElection(Election newElection) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.setString(keyElection, newElection.toString());
  }

  static Future<Election?> getSavedElection() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var enumString = sharedPreferences.getString(keyElection);
    return enumString != null
        ? Election.values.firstWhere((e) => e.toString() == enumString)
        : null;
  }
}
