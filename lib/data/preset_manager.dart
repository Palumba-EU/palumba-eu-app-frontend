import 'dart:convert';

import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'models/preset.dart';

class PresetManager {
  RxList<Preset> presets = <Preset>[].obs;

  static final PresetManager _singleton = new PresetManager._internal();

  factory PresetManager() {
    return _singleton;
  }

  PresetManager._internal();

  static PresetManager getInstance() {
    return new PresetManager();
  }

  saveData(Preset newPreset) async {
    presets.value.insert(0, newPreset);
    _save();
  }

  _save() async {
    var prefs = await SharedPreferences.getInstance();

    final String encodedData = Preset.encode(presets.value);
    await prefs.setString('presets', encodedData);
    loadData();
  }

  removePreset(Preset preset) {
    presets.value.remove(preset);
    _save();
  }

  Future<bool> loadData() async {
    var prefs = await SharedPreferences.getInstance();

    try {
      final String? searchResults = prefs.getString('presets');

      final List<Preset> sRes = Preset.decode(searchResults!);

      presets.value = sRes;
    } catch (E) {
      print(E);
      presets.value = [];
    }
    return true;
  }
}
