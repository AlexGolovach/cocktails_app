// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ingredients.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Ingredients _$IngredientsFromJson(Map<String, dynamic> json) {
  return Ingredients(
    drinks: (json['drinks'] as List)
        ?.map((e) =>
            e == null ? null : Ingredient.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$IngredientsToJson(Ingredients instance) =>
    <String, dynamic>{
      'drinks': instance.drinks,
    };

Ingredient _$IngredientFromJson(Map<String, dynamic> json) {
  return Ingredient(
    strIngredient: json['strIngredient1'] as String,
  );
}

Map<String, dynamic> _$IngredientToJson(Ingredient instance) =>
    <String, dynamic>{
      'strIngredient1': instance.strIngredient,
    };
