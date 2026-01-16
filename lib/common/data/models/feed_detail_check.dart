class FeedDetailCheck {
  final int postId;
  final int userId;
  final String userName;
  final String? profileImageUrl;
  final String title;
  final String content;
  final DateTime createdAt;
  final List<Comments> comments;
  final int commentCount;

  FeedDetailCheck({
    required this.postId,
    required this.userId,
    required this.userName,
    this.profileImageUrl,
    required this.title,
    required this.content,
    required this.createdAt,
    required this.comments,
    required this.commentCount,
  });

  Map<String, dynamic> toJson() {
    return {
      'postId': postId,
      'userId': userId,
      'userName': userName,
      'profileImageUrl': profileImageUrl,
      'title': title,
      'content': content,
      'createdAt': createdAt,
      'comments': comments,
      'commentCount': commentCount
    };
  }

  factory FeedDetailCheck.fromJson(Map<String, dynamic> json) {
    return FeedDetailCheck(
        postId: json['postId'],
        userId: json['userId'],
        userName: json['userName'],
        profileImageUrl: json['profileImageUrl'],
        title: json['title'],
        content: json['content'],
        createdAt: DateTime.parse(json['createdAt']),
        comments: (json['comments'] as List).map((e) => Comments.fromJson(e)).toList(),
        commentCount: json['commentCount']
    );
  }
}

class Comments {
  final int commentId;
  final int userId;
  final String? profileImageUrl;
  final String content;
  final DateTime createdAt;

  Comments({
    required this.commentId,
    required this.userId,
    this.profileImageUrl,
    required this.content,
    required this.createdAt,
  });

  factory Comments.fromJson(Map<String, dynamic> json) {
    return Comments(
        commentId: json['commentId'],
        userId: json['userId'],
        profileImageUrl: json['profileImageUrl'],
        content: json['content'],
        createdAt: DateTime.parse(json['createdAt'])
    );
  }
}
