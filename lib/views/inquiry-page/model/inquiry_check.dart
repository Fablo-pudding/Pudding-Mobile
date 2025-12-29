class InquiryCheckResponse {
  final int id;
  final int userId;
  final String userName;
  final bool userProfileImageUrl;
  final String title;
  final String content;
  final DateTime createAt;
  final String reply;

  InquiryCheckResponse({
    required this.id,
    required this.userId,
    required this.userName,
    required this.userProfileImageUrl,
    required this.title,
    required this.content,
    required this.createAt,
    required this.reply,
  });

  factory InquiryCheckResponse.fromJson(Map<String, dynamic> json) {
    return InquiryCheckResponse(
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
