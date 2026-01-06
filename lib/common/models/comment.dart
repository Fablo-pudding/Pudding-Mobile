class CommentRequest {
  final int userId;
  final String content;

  CommentRequest({required this.userId, required this.content});

  Map<String, dynamic> toJson() {
    return {'userId': userId, 'content': content};
  }
}
