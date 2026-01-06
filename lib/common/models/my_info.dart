class MyInfo {
  final String userId;
  final String name;
  final int ranking;
  final String? profileImageUrl;

  MyInfo({
    required this.userId,
    required this.name,
    required this.ranking,
    this.profileImageUrl,
  });

  factory MyInfo.fromJson(Map<String, dynamic> json) {
    return MyInfo(
      userId: json['userId'],
      name: json['name'],
      ranking: json['ranking'],
      profileImageUrl: json['profileImageUrl'],
    );
  }
}