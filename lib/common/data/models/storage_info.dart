class StorageInfo {
  final int milk;
  final int sugar;
  final int egg;
  final int pudding1;
  final int pudding2;
  final int pudding3;

  StorageInfo({
    required this.milk,
    required this.sugar,
    required this.egg,
    required this.pudding1,
    required this.pudding2,
    required this.pudding3,
  });

  factory StorageInfo.fromJson(Map<String, dynamic> json) {
    return StorageInfo(
      milk: json['milk'] ?? 0,
      sugar: json['sugar'] ?? 0,
      egg: json['egg'] ?? 0,
      pudding1: json['pudding_1'] ?? 0,
      pudding2: json['pudding_2'] ?? 0,
      pudding3: json['pudding_3'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'milk': milk,
      'sugar': sugar,
      'egg': egg,
      'pudding_1': pudding1,
      'pudding_2': pudding2,
      'pudding_3': pudding3,
    };
  }
}