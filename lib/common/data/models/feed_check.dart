import 'dart:convert';

class FeedCheck {
  final int postId;
  final String? profileImgUrl;
  final String name;
  final String title;
  final DateTime createdAt;
  final int commentCount;

  FeedCheck({
    required this.postId,
    this.profileImgUrl,
    required this.name,
    required this.title,
    required this.createdAt,
    required this.commentCount,
  });

  Map<String, dynamic> toJson() {
    return {
      'postId': postId,
      'profileImageUrl': profileImgUrl,
      'name': name,
      'title': title,
      'createdAt': createdAt,
      'commentCount': commentCount
    };
  }

  factory FeedCheck.fromJson(Map<String, dynamic> json) {
    return FeedCheck(
      postId: json['postId'],
      profileImgUrl: json['profileImageUrl'],
      name: json['name'],
      title: json['title'],
      createdAt: DateTime.parse(json['createdAt'] + 'Z').toLocal(),
      commentCount: json['commentCount'],
    );
  }
}
