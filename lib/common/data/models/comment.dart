class Comment {
  final int userId;
  final String content;

  Comment({required this.userId, required this.content});

  Map<String, dynamic> toJson() {
    return {'userId': userId, 'content': content};
  }
}
