class SponsorsData {
  List<Sponsor>? data;

  SponsorsData({this.data});

  SponsorsData.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Sponsor>[];
      json['data'].forEach((v) {
        data!.add(new Sponsor.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Sponsor {
  int? id;
  String? name;
  String? logo;
  String? link;
  String? bannerImage;
  String? bannerLink;
  String? bannerDescription;
  String? category;

  Sponsor(
      {this.id,
        this.name,
        this.logo,
        this.link,
        this.bannerImage,
        this.bannerLink,
        this.bannerDescription,
        this.category});

  Sponsor.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    logo = json['logo'];
    link = json['link'];
    bannerImage = json['banner_image'];
    bannerLink = json['banner_link'];
    bannerDescription = json['banner_description'];
    category = json['category'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['logo'] = this.logo;
    data['link'] = this.link;
    data['banner_image'] = this.bannerImage;
    data['banner_link'] = this.bannerLink;
    data['banner_description'] = this.bannerDescription;
    data['category'] = this.category;
    return data;
  }
}
