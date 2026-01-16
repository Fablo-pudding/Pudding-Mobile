class PuddingTwoUpgrade {
  final int pudding2;
  final int pudding3;

  PuddingTwoUpgrade({required this.pudding2, required this.pudding3});

  factory PuddingTwoUpgrade.fromJson(Map<String, dynamic> json) {
    return PuddingTwoUpgrade(
      pudding2: json['pudding_2'] ?? 0,
      pudding3: json['pudding_3'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'pudding_2': pudding2,
      'pudding_3': pudding3,
    };
  }
}
