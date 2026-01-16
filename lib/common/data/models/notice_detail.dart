class NoticeDetail {
  final int id;
  final String registerEmployeeNo;
  final String title;
  final String content;
  final DateTime createdAt;
  final String? profileImageUrl;

  NoticeDetail({
    required this.id,
    required this.registerEmployeeNo,
    required this.title,
    required this.content,
    required this.createdAt,
    this.profileImageUrl,
  });

  factory NoticeDetail.fromJson(Map<String, dynamic> json) {
    return NoticeDetail(
      id: json['id'] ?? 0,
      registerEmployeeNo: json['registerEmployeeNo'] ?? '운영자',
      title: json['title'] ?? '',
      content: json['content'] ?? '',
      createdAt: DateTime.parse(json['createdAt']).toLocal(),
      profileImageUrl: json['profileImageUrl'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'registerEmployeeNo': registerEmployeeNo,
      'title': title,
      'content': content,
      'createAt': createdAt,
      'profileImageUrl': profileImageUrl,
    };
  }
}
