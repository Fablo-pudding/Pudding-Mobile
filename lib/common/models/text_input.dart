class TextInputRequest {
  final String title;
  final String content;

  TextInputRequest({required this.title, required this.content});

  Map<String, dynamic> toJson() {
    return {'title': title, 'content': content};
  }
}