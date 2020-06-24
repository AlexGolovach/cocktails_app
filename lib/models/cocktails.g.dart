// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cocktails.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Cocktails _$CocktailsFromJson(Map<String, dynamic> json) {
  return Cocktails(
    drinks: (json['drinks'] as List)
        ?.map((e) =>
            e == null ? null : Cocktail.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$CocktailsToJson(Cocktails instance) => <String, dynamic>{
      'drinks': instance.drinks,
    };

Cocktail _$CocktailFromJson(Map<String, dynamic> json) {
  return Cocktail(
    idDrink: json['idDrink'] as String,
    strDrink: json['strDrink'] as String,
    strDrinkThumb: json['strDrinkThumb'] as String,
  );
}

Map<String, dynamic> _$CocktailToJson(Cocktail instance) => <String, dynamic>{
      'idDrink': instance.idDrink,
      'strDrink': instance.strDrink,
      'strDrinkThumb': instance.strDrinkThumb,
    };
