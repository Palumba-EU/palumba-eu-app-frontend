class Localization {
  List<Country>? countries;
  List<Language>? languages;

  Localization({this.countries, this.languages});

  Localization.fromJson(Map<String, dynamic> json) {
    if (json['countries'] != null) {
      countries = <Country>[];
      json['countries'].forEach((v) {
        countries!.add(Country.fromJson(v));
      });
    }
    if (json['languages'] != null) {
      languages = <Language>[];
      json['languages'].forEach((v) {
        languages!.add(Language.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['countries'] =countries != null ? countries!.map((v) => v.toJson()).toList() : null;
    data['languages'] =languages != null ? languages!.map((v) => v.toJson()).toList() : null;
    return data;
  }
}

class Country {
  int? id;
  String? name;
  String? countrycode;
  String? flagimage;

  Country({this.id, this.name, this.countrycode, this.flagimage});

  Country.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    countrycode = json['country_code'];
    flagimage = json['flag_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['name'] = name;
    data['country_code'] = countrycode;
    data['flag_image'] = flagimage;
    return data;
  }
}

class Language {
  int? id;
  String? name;
  String? languagecode;

  Language({this.id, this.name, this.languagecode});

  Language.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    languagecode = json['language_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['name'] = name;
    data['language_code'] = languagecode;
    return data;
  }
}

