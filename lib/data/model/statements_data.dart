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
  int? id;
  String? statement;
  String? details;
  String? footnote;
  List<int>? vector;

  Statement({this.id, this.statement, this.details, this.footnote, this.vector});

  Statement.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    statement = json['statement'];
    details = json['details'];
    footnote = json['footnote'];
    vector = json['vector'].cast<int>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['statement'] = this.statement;
    data['details'] = this.details;
    data['footnote'] = this.footnote;
    data['vector'] = this.vector;
    return data;
  }
}