class GlobalRankingResponse {
  final int rank;
  final int userId;
  final String userName;
  final String? userProfileImageUrl;
  final int pudding3;

  GlobalRankingResponse({
    required this.rank,
    required this.userId,
    required this.userName,
    required this.userProfileImageUrl,
    required this.pudding3,
  });

  factory GlobalRankingResponse.fromJson(Map<String, dynamic> json) {
    return GlobalRankingResponse(
      rank: json['rank'],
      userId: json['userId'],
      userName: json['userName'],
      userProfileImageUrl: json['userProfileImageUrl'],
      pudding3: json['pudding3'],
    );
  }
}