import 'dart:convert';

class GlobalRanking {
  final int rank;
  final int userId;
  final String userName;
  final String? userProfileImageUrl;
  final int pudding3;

  GlobalRanking({
    required this.rank,
    required this.userId,
    required this.userName,
    this.userProfileImageUrl,
    required this.pudding3,
  });

  Map<String, dynamic> toJson() {
    return {
      'rank': rank,
      'userId': userId,
      'userName': userName,
      'userProfileImageUrl': userProfileImageUrl,
      'pudding3': pudding3,
    };
  }

  factory GlobalRanking.fromJson(Map<String, dynamic> json) {
    return GlobalRanking(
      rank: json['rank'],
      userId: json['userId'],
      userName: json['userName'],
      userProfileImageUrl: json['userProfileImageUrl'],
      pudding3: json['pudding3'],
    );
  }
}

class GlobalRankingList {
  final List<GlobalRanking> ranking;

  GlobalRankingList({required this.ranking});

  factory GlobalRankingList.fromJson(List<dynamic> json) {
    return GlobalRankingList(
      ranking: json.map((i) => GlobalRanking.fromJson(i)).toList(),
    );
  }
}
