class CreateResponse {
  final int id;

  CreateResponse({required this.id});

  factory CreateResponse.fromJson(Map<String, dynamic> json) {
    return CreateResponse(id: json['id'] ?? 0);
  }
}