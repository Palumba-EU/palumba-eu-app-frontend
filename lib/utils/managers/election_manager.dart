import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:palumba_eu/data/model/election.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ElectionManager {
  static final Rx<Election> currentElection = Election.EU.obs;

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
    var countryCode =
        WidgetsBinding.instance.platformDispatcher.locale.countryCode;

    if (election != null) {
      currentElection.value = election;
    } else {
      currentElection.value = countryCode == "DE" ? Election.DE : Election.EU;
    }
  }

  static setElection(Election election) async {
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
    return Election.values.firstWhere((e) => e.toString() == enumString);
  }
}
