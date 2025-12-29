import 'dart:convert';

class FeedCheckResponse {
  final int postId;
  final int userId;
  final String profileImgUrl;
  final String title;
  final String content;
  final DateTime createAt;
  final int commentCount;

  FeedCheckResponse({
    required this.postId,
    required this.userId,
    required this.profileImgUrl,
    required this.title,
    required this.content,
    required this.createAt,
    required this.commentCount,
  });

  factory FeedCheckResponse.fromJson(Map<String, dynamic>json){
    return FeedCheckResponse(
        postId: json['postId'],
        userId: json['userId'],
        profileImgUrl: json['profileImgUrl'],
        title: json['title'],
        content: json['content'],
        createAt: DateTime.parse(json['createAt']),
        commentCount: json['commentCount']);
  }
}
