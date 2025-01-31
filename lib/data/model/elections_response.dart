class ElectionsResponse {
  final List<ElectionResponse> data;

  ElectionsResponse({required this.data});

  factory ElectionsResponse.fromJson(Map<String, dynamic> json) {
    return ElectionsResponse(
      data: List<ElectionResponse>.from(
        json['data'].map((election) => ElectionResponse.fromJson(election)),
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'data': data.map((election) => election.toJson()).toList(),
    };
  }
}

class ElectionResponse {
  final int id;
  final String name;
  final DateTime date;
  final Country? country;
  final EggScreen eggScreen;

  ElectionResponse({
    required this.id,
    required this.name,
    required this.date,
    required this.country,
    required this.eggScreen,
  });

  // Factory method to create an ElectionsResponse from JSON
  factory ElectionResponse.fromJson(Map<String, dynamic> json) {
    return ElectionResponse(
      id: json['id'],
      name: json['name'],
      date: DateTime.parse(json['date']),
      country:
          json['country'] == null ? null : Country.fromJson(json['country']),
      eggScreen: EggScreen.fromJson(json['egg_screen']),
    );
  }

  // Method to convert ElectionsResponse to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'date': date.toIso8601String(),
      'country': country?.toJson(),
      'egg_screen': eggScreen.toJson(),
    };
  }
}

class Country {
  final int id;
  final String name;
  final String countryCode;
  final String flagImage;

  Country({
    required this.id,
    required this.name,
    required this.countryCode,
    required this.flagImage,
  });

  // Factory method to create a Country from JSON
  factory Country.fromJson(Map<String, dynamic> json) {
    return Country(
      id: json['id'],
      name: json['name'],
      countryCode: json['country_code'],
      flagImage: json['flag_image'],
    );
  }

  // Method to convert Country to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'country_code': countryCode,
      'flag_image': flagImage,
    };
  }
}

class EggScreen {
  final String title;
  final String description;
  final String image;
  final String yesBtnText;
  final String yesBtnLink;
  final String noBtnText;

  EggScreen({
    required this.title,
    required this.description,
    required this.image,
    required this.yesBtnText,
    required this.yesBtnLink,
    required this.noBtnText,
  });

  // Factory method to create an EggScreen from JSON
  factory EggScreen.fromJson(Map<String, dynamic> json) {
    return EggScreen(
      title: json['title'],
      description: json['description'],
      image: json['image'],
      yesBtnText: json['yes_btn_text'],
      yesBtnLink: json['yes_btn_link'],
      noBtnText: json['no_btn_text'],
    );
  }

  // Method to convert EggScreen to JSON
  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'description': description,
      'image': image,
      'yes_btn_text': yesBtnText,
      'yes_btn_link': yesBtnLink,
      'no_btn_text': noBtnText,
    };
  }
}
