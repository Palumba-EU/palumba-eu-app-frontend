import 'package:palumba_eu/data/model/user_model.dart';

class ResultsData {
  List<PoliticParty>? parties;
  List<Topic>? topics;

  ResultsData({this.parties});

  ResultsData.fromJson(Map<String, dynamic> json) {
    if (json['parties'] != null) {
      parties = <PoliticParty>[];
      json['parties'].forEach((v) {
        parties!.add(new PoliticParty.fromJson(v));
      });
    }
    if (json['topics'] != null) {
      topics = <Topic>[];
      json['topics'].forEach((v) {
        topics!.add(new Topic.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.parties != null) {
      data['parties'] = this.parties!.map((v) => v.toJson()).toList();
    }
    if (this.topics != null) {
      data['topics'] = this.topics!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Topic {
  int? id;
  String? name;
  String? icon;
  String? color;
  String? extreme1;
  String? extreme1Emojis;
  String? extreme1Details;
  String? extreme2;
  String? extreme2Emojis;
  String? extreme2Details;
  List<dynamic>? associatedStatements;

  Topic({
    required this.id,
    required this.name,
    required this.icon,
    required this.color,
    required this.extreme1,
    required this.extreme1Emojis,
    required this.extreme1Details,
    required this.extreme2,
    required this.extreme2Emojis,
    required this.extreme2Details,
    required this.associatedStatements,
  });
  Topic.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'] ?? '';
    icon = json['icon'] ?? '';
    color = json['color'] ?? '';
    extreme1 = json['extreme1'] ?? '';
    extreme1Emojis = json['extreme1_emojis'] ?? '';
    extreme1Details = json['extreme1_details'] ?? '';
    extreme2 = json['extreme2'] ?? '';
    extreme2Emojis = json['extreme2_emojis'] ?? '';
    extreme2Details = json['extreme2_details'] ?? '';
    associatedStatements = json['associated_statements'] ?? [];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['icon'] = this.icon;
    data['color'] = this.color;
    data['extreme1'] = this.extreme1;
    data['extreme1_emojis'] = this.extreme1Emojis;
    data['extreme1_details'] = this.extreme1Details;
    data['extreme2'] = this.extreme2;
    data['extreme2_emojis'] = this.extreme2Emojis;
    data['extreme2_details'] = this.extreme2Details;
    data['associated_statements'] = this.associatedStatements;
    return data;
  }
}

class PoliticParty {
  int? id;
  String? name;
  String? color;
  String? logo;
  List<LocalParties>? localParties;
  String? acronym;
  List<Answer>? answers;

  PoliticParty(
      {this.id,
      this.name,
      this.color,
      this.logo,
      this.localParties,
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
    acronym = json['acronym'];
    if (json["answers"] != null) {
      answers = <Answer>[];
      json["answers"].forEach((x) => answers!.add(Answer.fromJson(x)));
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
