import 'dart:convert';
import 'package:explore_flutter/Cocktail.dart';
import 'package:http/http.dart' as http;

Future<Drinks> searchCocktails(String name) async {
  final response = await http.get(Uri.parse(
      'https://www.thecocktaildb.com/api/json/v1/1/search.php?s=$name'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return Drinks.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}
