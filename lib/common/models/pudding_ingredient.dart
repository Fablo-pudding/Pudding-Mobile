class PuddingIngredient {
  final int? milk;
  final int? sugar;
  final int? egg;

  PuddingIngredient({this.milk, this.sugar, this.egg});

  factory PuddingIngredient.fromJson(Map<String, dynamic> json) {
    return PuddingIngredient(
      milk: json['milk'],
      sugar: json['sugar'],
      egg: json['egg']
    );
  }
}