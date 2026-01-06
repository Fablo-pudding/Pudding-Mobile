class PuddingOneUpgrade {
  final int pudding1;
  final int pudding2;

  PuddingOneUpgrade({required this.pudding1, required this.pudding2});

  factory PuddingOneUpgrade.fromJson(Map<String, dynamic> json) {
    return PuddingOneUpgrade(
      pudding1: json['pudding1'],
      pudding2: json['pudding2'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'pudding1': pudding1,
      'pudding2': pudding2,
    };
  }
}
