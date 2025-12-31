class InfoResponse {
  final String userId;
  final String name;
  final int ranking;
  final String? profileImageUrl;

  InfoResponse({
    required this.userId,
    required this.name,
    required this.ranking,
    this.profileImageUrl,
  });

  factory InfoResponse.fromJson(Map<String, dynamic> json) {
    return InfoResponse(
      userId: json['userId'],
      name: json['name'],
      ranking: json['ranking'],
      profileImageUrl: json['profileImageUrl'],
    );
  }
}
