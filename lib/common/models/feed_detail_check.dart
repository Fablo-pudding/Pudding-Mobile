class FeedDetailCheck {
  int? postId;
  int? userId;
  String? profileImageUrl;
  String? title;
  String? content;
  String? createdAt;
  List<Comments>? comments;
  int? commentCount;

  FeedDetailCheck({this.postId,
    this.userId,
    this.profileImageUrl,
    this.title,
    this.content,
    this.createdAt,
    this.comments,
    this.commentCount});

  FeedDetailCheck.fromJson(Map<String, dynamic> json) {
    postId = json['post_id'];
    userId = json['user_id'];
    profileImageUrl = json['profileImageUrl'];
    title = json['title'];
    content = json['content'];
    createdAt = json['created_at'];
    if (json['comments'] != null) {
      comments = <Comments>[];
      json['comments'].forEach((v) {
        comments!.add(new Comments.fromJson(v));
      });
    }
    commentCount = json['comment_count'];
  }
}


class Comments {
  int? commentId;
  int? userId;
  String? profileImageUrl;
  String? comment;
  String? createdAt;

  Comments(
      {this.commentId,
        this.userId,
        this.profileImageUrl,
        this.comment,
        this.createdAt});

  Comments.fromJson(Map<String, dynamic> json) {
    commentId = json['comment_id'];
    userId = json['user_id'];
    profileImageUrl = json['profileImageUrl'];
    comment = json['comment'];
    createdAt = json['created_at'];
  }
  }