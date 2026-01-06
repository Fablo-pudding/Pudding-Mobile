class MyRanking {
  final int rank;
  final int userId;
  final String userName;
  final String? userProfileImageUrl;
  final int pudding3;

  MyRanking({
    required this.rank,
    required this.userId,
    required this.userName,
    this.userProfileImageUrl,
    required this.pudding3,
  });

  factory MyRanking.fromJson(Map<String, dynamic> json) {
    return MyRanking(
      rank: json['rank'],
      userId: json['userId'],
      userName: json['userName'],
      userProfileImageUrl: json['userProfileImageUrl'],
      pudding3: json['pudding3'],
    );
  }
}
