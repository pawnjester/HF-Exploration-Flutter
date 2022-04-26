import 'dart:collection';

class Drinks {
  List<Cocktail> cocktails;

  Drinks({required this.cocktails});

  factory Drinks.fromJson(Map<String, dynamic> json) {
    var list = json['drinks'] as List;
    List<Cocktail> cocktailsList =
        list.map((i) => Cocktail.fromJson(i)).toList();
    return Drinks(cocktails: cocktailsList);
  }
}

class Cocktail {
  String imageUrl;
  String name;
  String category;

  Cocktail(
      {required this.imageUrl, required this.name, required this.category});

  factory Cocktail.fromJson(Map<String, dynamic> json) {
    return Cocktail(
      imageUrl: json['strDrinkThumb'],
      name: json['strDrink'],
      category: json['strCategory'],
    );
  }
}
