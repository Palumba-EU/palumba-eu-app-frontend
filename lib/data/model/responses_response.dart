class ResponsesResponse {
  final String id;
  final String editableUntil;

  // Constructor
  ResponsesResponse({
    required this.id,
    required this.editableUntil,
  });

  // Factory method to create an instance from JSON
  factory ResponsesResponse.fromJson(Map<String, dynamic> json) {
    return ResponsesResponse(
      id: json['id'] as String,
      editableUntil: json['editable_until'] as String,
    );
  }

  // Method to convert an instance to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'editable_until': editableUntil,
    };
  }
}
