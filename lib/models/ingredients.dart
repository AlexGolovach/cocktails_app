import 'package:json_annotation/json_annotation.dart';

part 'ingredients.g.dart';

@JsonSerializable()
class Ingredients {
  final List<Ingredient> drinks;

  Ingredients({this.drinks});

  factory Ingredients.fromJson(Map<String, dynamic> json) =>
      _$IngredientsFromJson(json);
}

@JsonSerializable()
class Ingredient {
  @JsonKey(name: "strIngredient1")
  final String strIngredient;

  Ingredient({this.strIngredient});

  factory Ingredient.fromJson(Map<String, dynamic> json) =>
      _$IngredientFromJson(json);
}
