import 'dart:convert';

import 'assets.dart';

class Preset {
  List<Asset> assets = [];

  Preset();

  Preset.fromJson(Map<String, dynamic> json) {
    print(json);
    json['assets'].forEach((v) {
      assets.add(new Asset.fromJson(v));
    });
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['assets'] = assets.map((v) => v.toJson()).toList();

    return data;
  }

  static Map<String, dynamic> toMap(Preset preset) => {'assets': preset.assets};

  static String encode(List<Preset> presets) => json.encode(
        presets
            .map<Map<String, dynamic>>((search) => Preset.toMap(search))
            .toList(),
      );

  static List<Preset> decode(String results) =>
      (json.decode(results) as List<dynamic>)
          .map<Preset>((search) => Preset.fromJson(search))
          .toList();
}
