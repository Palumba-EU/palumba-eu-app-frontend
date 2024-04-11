import 'package:palumba_eu/data/model/user_model.dart';

class ResultsData {
  List<PoliticParty>? parties;

  ResultsData({this.parties});

  ResultsData.fromJson(Map<String, dynamic> json) {
    if (json['parties'] != null) {
      parties = <PoliticParty>[];
      json['parties'].forEach((v) {
        parties!.add(new PoliticParty.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.parties != null) {
      data['parties'] = this.parties!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class PoliticParty {
  int? id;
  String? name;
  String? color;
  String? logo;
  List<LocalParties>? localParties;
  List<Null>? policies;
  List<int>? position;
  String? acronym;
  List<Answer>? answers;

  PoliticParty(
      {this.id,
      this.name,
      this.color,
      this.logo,
      this.localParties,
      this.policies,
      this.position,
      this.acronym,
      this.answers});

  PoliticParty.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    color = json['color'];
    logo = json['logo'];
    if (json['local_parties'] != null) {
      localParties = <LocalParties>[];
      json['local_parties'].forEach((v) {
        localParties!.add(new LocalParties.fromJson(v));
      });
    }
    position = json['position'].cast<int>();
    acronym = json['acronym'];
    if (json["answers"] != null) {
      answers = <Answer>[];
      List<Answer>.from(
          json["answers"].foEach((x) => answers!.add(Answer.fromJson(x))));
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['color'] = this.color;
    data['logo'] = this.logo;
    if (this.localParties != null) {
      data['local_parties'] =
          this.localParties!.map((v) => v.toJson()).toList();
    }
    data['position'] = this.position;
    data['acronym'] = this.acronym;
    data['answers'] = this.answers?.map((v) => v.toJson()).toList();
    return data;
  }
}

class LocalParties {
  int? id;
  String? name;
  String? logo;
  String? link;
  String? acronym;
  int? countryId;

  LocalParties({this.id, this.name, this.logo, this.link});

  LocalParties.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    logo = json['logo'];
    link = json['link'];
    acronym = json['acronym'];
    countryId = json['country_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['logo'] = this.logo;
    data['link'] = this.link;
    data['acronym'] = this.acronym;
    data['country_id'] = this.countryId;
    return data;
  }
}
