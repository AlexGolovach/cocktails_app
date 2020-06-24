import 'package:json_annotation/json_annotation.dart';

part 'cocktails.g.dart';

@JsonSerializable()
class Cocktails {
  final List<Cocktail> drinks;

  Cocktails({this.drinks});

  factory Cocktails.fromJson(Map<String, dynamic> json) =>
      _$CocktailsFromJson(json);
}

@JsonSerializable()
class Cocktail {
  final String idDrink;
  final String strDrink;
  final String strDrinkThumb;

  Cocktail({this.idDrink, this.strDrink, this.strDrinkThumb});

  factory Cocktail.fromJson(Map<String, dynamic> json) =>
      _$CocktailFromJson(json);
}
