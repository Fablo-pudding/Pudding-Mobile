class CreateResponse {
  final int postId;

  CreateResponse({required this.postId});

  factory CreateResponse.fromJson(Map<String, dynamic> json) {
    return CreateResponse(postId: json['postId']);
  }
}