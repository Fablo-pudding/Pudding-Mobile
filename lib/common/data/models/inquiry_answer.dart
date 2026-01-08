class InquiryAnswer {
  final String reply;

  InquiryAnswer({required this.reply});

  Map<String, dynamic> toJson() {
    return {'reply': reply};
  }

  factory InquiryAnswer.fromJson(Map<String, dynamic> json) {
    return InquiryAnswer(reply: json['reply']);
  }
}
