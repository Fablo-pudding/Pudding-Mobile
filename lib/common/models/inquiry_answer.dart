class InquiryAnswer {
  final String reply;

  InquiryAnswer({required this.reply});

  Map<String, dynamic> toJson() {
    return {'reply': reply};
  }
}
