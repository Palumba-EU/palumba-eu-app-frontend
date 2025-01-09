class StatementsData {
  List<Statement>? data;

  StatementsData({this.data});

  StatementsData.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Statement>[];
      json['data'].forEach((v) {
        data!.add(new Statement.fromJson(v));
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

class Statement {
  late int id;
  late String statement;
  late String details;
  late String footnote;
  late String emojis;
  late List<Weight> weights;

  Statement({
    required this.id,
    required this.statement,
    required this.details,
    required this.footnote,
    required this.emojis,
    required this.weights,
  });

  Statement.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    statement = json['statement'];
    details = json['details'];
    footnote = json['footnote'];
    emojis = json['emojis'];
    if (json['weights'] != null) {
      weights = <Weight>[];
      json['weights'].forEach((v) {
        weights.add(new Weight.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['statement'] = this.statement;
    data['details'] = this.details;
    data['footnote'] = this.footnote;
    data['emojis'] = this.emojis;
    data['weights'] = this.weights.map((v) => v.toJson()).toList();
    return data;
  }
}

class Weight {
  int? topic_id;
  int? weight;

  Weight({this.topic_id, this.weight});

  Weight.fromJson(Map<String, dynamic> json) {
    topic_id = json['topic_id'];
    weight = json['weight'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['topic_id'] = this.topic_id;
    data['weight'] = this.weight;
    return data;
  }
}
