import 'dart:convert';

class FeedCheck {
  final int postId;
  final int userId;
  final String? profileImgUrl;
  final String title;
  final String content;
  final DateTime createAt;
  final int commentCount;

  FeedCheck({
    required this.postId,
    required this.userId,
    this.profileImgUrl,
    required this.title,
    required this.content,
    required this.createAt,
    required this.commentCount,
  });

  factory FeedCheck.fromJson(Map<String, dynamic> json) {
    return FeedCheck(
      postId: json['postId'],
      userId: json['userId'],
      profileImgUrl: json['profileImgUrl'],
      title: json['title'],
      content: json['content'],
      createAt: DateTime.parse(json['createAt']),
      commentCount: json['commentCount'],
    );
  }
}
