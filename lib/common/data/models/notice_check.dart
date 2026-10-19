class NoticeCheck {
  final int id;
  final String title;
  final String registerEmployeeNo;
  final DateTime createAt;
  final List content;

  NoticeCheck({
    required this.id,
    required this.title,
    required this.registerEmployeeNo,
    required this.createAt,
    required this.content,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'registerEmployeeNo': '관리자',
      'createAt': createAt.toLocal(),
    };
  }


  factory NoticeCheck.fromJson(Map<String, dynamic> json) {
    return NoticeCheck(
      id: json['id'] as int? ?? 0,
      title: json['title'] as String? ?? '제목없음',
      registerEmployeeNo: json['registerEmployeeNo'] as String? ?? '관리자',
      createAt: json['createAt'] != null
          ? DateTime.parse(json['createAt'].toString())
          : DateTime.now(),
      content: json['content'] as List? ?? [],
    );
  }
}
class NoticeCheckList {
  final List<NoticeCheck> check;

 NoticeCheckList({required this.check});

  factory NoticeCheckList.fromJson(List<dynamic> json) {
    return NoticeCheckList(
      check: json.map((i) => NoticeCheck.fromJson(i)).toList(),
    );
  }
}
