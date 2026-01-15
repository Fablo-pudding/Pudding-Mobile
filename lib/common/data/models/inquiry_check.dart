class InquiryCheck {
  final int id;
  final int userId;
  final String userName;
  final String? userProfileImageUrl;
  final String title;
  final String content;
  final DateTime createdAt;
  final String? reply;

  InquiryCheck({
    required this.id,
    required this.userId,
    required this.userName,
    this.userProfileImageUrl,
    required this.title,
    required this.content,
    required this.createdAt,
    this.reply,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'userName': userName,
      'userProfileImageUrl': userProfileImageUrl,
      'title': title,
      'content': content,
      'createdAt': createdAt,
      'reply': reply
    };
  }

  factory InquiryCheck.fromJson(Map<String, dynamic> json) {
    return InquiryCheck(
      id: json['id'] ?? 0,
      userId: json['userId'] ?? 0,
      userName: json['userName'] ?? '',
      userProfileImageUrl: json['userProfileImageUrl'],
      title: json['title'] ?? '',
      content: json['content'] ?? '',
      createdAt: json['createdAt'] != null ? DateTime.parse(json['createdAt']) : DateTime.now(),
      reply: json['reply'],
    );
  }
}
