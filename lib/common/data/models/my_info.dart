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

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'name': name,
      'ranking': ranking,
      'profileImageUrl': profileImageUrl
    };
  }

  factory MyInfo.fromJson(Map<String, dynamic> json) {
    return MyInfo(
      userId: json['userId'].toString(),
      name: json['name'] as String,
      ranking: json['ranking'] as int,
      profileImageUrl: json['profileImageUrl'] as String?,
    );
  }
}