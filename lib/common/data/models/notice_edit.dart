class NoticeEdit {
  final String title;
  final String content;

  NoticeEdit({
    required this.title,
    required this.content,
  });

  factory NoticeEdit.formJson(Map<String, dynamic> json) {
    return NoticeEdit(
      title: json['title'],
      content: json['content'],
    );
  }
  Map<String,dynamic> toJson(){
    return {
      'title' : title,
      'content' : content,
    };
  }
}
