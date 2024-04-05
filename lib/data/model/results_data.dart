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

  PoliticParty(
      {this.id,
      this.name,
      this.color,
      this.logo,
      this.localParties,
      this.policies,
      this.position});

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
    return data;
  }
}

class LocalParties {
  int? id;
  String? name;
  String? logo;
  String? link;

  LocalParties({this.id, this.name, this.logo, this.link});

  LocalParties.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    logo = json['logo'];
    link = json['link'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['logo'] = this.logo;
    data['link'] = this.link;
    return data;
  }
}
