class PuddingOneUpgrade {
  final int pudding1;
  final int pudding2;

  PuddingOneUpgrade({required this.pudding1, required this.pudding2});

  factory PuddingOneUpgrade.fromJson(Map<String, dynamic> json) {
    return PuddingOneUpgrade(
      pudding1: json['pudding_1'] ?? 0,
      pudding2: json['pudding_2'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'pudding_1': pudding1,
      'pudding_2': pudding2,
    };
  }
}
