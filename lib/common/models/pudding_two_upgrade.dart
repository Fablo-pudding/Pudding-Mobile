class PuddingTwoUpgrade {
  final int pudding2;
  final int pudding3;

  PuddingTwoUpgrade({required this.pudding2, required this.pudding3});

  factory PuddingTwoUpgrade.fromJson(Map<String, dynamic> json) {
    return PuddingTwoUpgrade(
      pudding2: json['pudding2'],
      pudding3: json['pudding3'],
    );
  }
}
