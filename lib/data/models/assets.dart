class Assets {
  List<Asset>? assets;

  Assets({this.assets});

  Assets.fromJson(Map<String, dynamic> json) {
    if (json['assets'] != null) {
      assets = <Asset>[];
      json['assets'].forEach((v) {
        assets!.add(new Asset.fromJson(v));
      });
      assets!.sort((a, b) => a.sort!.compareTo(b.sort!));
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.assets != null) {
      data['assets'] = this.assets!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Asset {
  String? file;
  String? name;
  bool? premium;
  int? id;
  String? icon;
  double? volume;
  int? sort;

  Asset(
      {this.file,
      this.id,
      this.name,
      this.premium,
      this.icon,
      this.volume,
      this.sort});

  Asset.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    file = json['file'];
    name = json['name'];
    premium = json['premium'];
    icon = json['icon'];
    volume = json['volume'];
    sort = json['sort'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['file'] = this.file;
    data['name'] = this.name;
    data['premium'] = this.premium;
    data['id'] = this.id;
    data['icon'] = this.icon;
    data['volume'] = this.volume;
    data['sort'] = this.sort;
    return data;
  }
}
