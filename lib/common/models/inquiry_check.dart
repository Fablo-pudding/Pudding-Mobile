class InquiryCheck {
  final int id;
  final int userId;
  final String userName;
  final String? userProfileImageUrl;
  final String title;
  final String content;
  final DateTime createAt;
  final String reply;

  InquiryCheck({
    required this.id,
    required this.userId,
    required this.userName,
    this.userProfileImageUrl,
    required this.title,
    required this.content,
    required this.createAt,
    required this.reply,
  });

  factory InquiryCheck.fromJson(Map<String, dynamic> json) {
    return InquiryCheck(
      id: json['id'],
      userId: json['userId'],
      userName: json['userName'],
      userProfileImageUrl: json['userProfileImageUrl'],
      title: json['title'],
      content: json['content'],
      createAt: DateTime.parse(
        json['createAt'],
      ),
      reply: json['reply'],
    );
  }
}
