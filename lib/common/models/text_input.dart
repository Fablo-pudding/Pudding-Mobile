class TextInput {
  final String title;
  final String content;

  TextInput({required this.title, required this.content});

  Map<String, dynamic> toJson() {
    return {'title': title, 'content': content};
  }
}