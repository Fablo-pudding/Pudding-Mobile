class TextInput {
  final String title;
  final String content;

  TextInput({required this.title, required this.content});

  factory TextInput.fromJson(Map<String, dynamic> json) {
    return TextInput(title: json['title'], content: json['content']);
  }

  Map<String, dynamic> toJson() {
    return {'title': title, 'content': content};
  }
}
