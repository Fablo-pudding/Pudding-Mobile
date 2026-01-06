class StorageMake {
  final int pudding1;
  final int milk;
  final int egg;
  final int sugar;

  StorageMake({
    required this.pudding1,
    required this.milk,
    required this.egg,
    required this.sugar
  });

  factory StorageMake.fromJson(Map<String, dynamic> json) {
    return StorageMake(
        pudding1: json['pudding1'],
        milk: json['milk'],
        egg: json['egg'],
        sugar: json['sugar']
    );
  }
}