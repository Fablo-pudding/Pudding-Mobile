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
      milk: json['milk'],
      sugar: json['sugar'],
      egg: json['egg'],
      pudding1: json['pudding1'],
      pudding2: json['pudding2'],
      pudding3: json['pudding3'],
    );
  }
}
