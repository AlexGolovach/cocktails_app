import 'package:json_annotation/json_annotation.dart';

part 'cocktail_details.g.dart';

@JsonSerializable()
class CocktailDetailsResponse {
  final List<CocktailDetails> drinks;

  CocktailDetailsResponse({this.drinks});

  factory CocktailDetailsResponse.fromJson(Map<String, dynamic> json) =>
      _$CocktailDetailsResponseFromJson(json);
}

@JsonSerializable()
class CocktailDetails {
  final String idDrink;
  final String strDrink;
  final String strDrinkAlternate;
  final String strDrinkES;
  final String strDrinkDE;
  final String strDrinkFR;

  @JsonKey(name: "strDrinkZH-HANS")
  final String strDrinkZH_HANS;

  @JsonKey(name: "strDrinkZH-HANT")
  final String strDrinkZH_HANT;

  final String strTags;
  final String strVideo;
  final String strCategory;
  final String strIBA;
  final String strAlcoholic;
  final String strGlass;
  final String strInstructions;
  final String strInstructionsES;
  final String strInstructionsDE;
  final String strInstructionsFR;

  @JsonKey(name: "strInstructionsZH-HANS")
  final String strInstructionsZH_HANS;

  @JsonKey(name: "strInstructionsZH-HANT")
  final String strInstructionsZH_HANT;

  final String strDrinkThumb;
  final String strIngredient1;
  final String strIngredient2;
  final String strIngredient3;
  final String strIngredient4;
  final String strIngredient5;
  final String strIngredient6;
  final String strIngredient7;
  final String strIngredient8;
  final String strIngredient9;
  final String strIngredient10;
  final String strIngredient11;
  final String strIngredient12;
  final String strIngredient13;
  final String strIngredient14;
  final String strIngredient15;
  final String strMeasure1;
  final String strMeasure2;
  final String strMeasure3;
  final String strMeasure4;
  final String strMeasure5;
  final String strMeasure6;
  final String strMeasure7;
  final String strMeasure8;
  final String strMeasure9;
  final String strMeasure10;
  final String strMeasure11;
  final String strMeasure12;
  final String strMeasure13;
  final String strMeasure14;
  final String strMeasure15;
  final String strCreativeCommonsConfirmed;
  final String dateModified;

  CocktailDetails(
      {this.idDrink,
      this.strDrink,
      this.strDrinkAlternate,
      this.strDrinkES,
      this.strDrinkDE,
      this.strDrinkFR,
      this.strDrinkZH_HANS,
      this.strDrinkZH_HANT,
      this.strTags,
      this.strVideo,
      this.strCategory,
      this.strIBA,
      this.strAlcoholic,
      this.strGlass,
      this.strInstructions,
      this.strInstructionsES,
      this.strInstructionsDE,
      this.strInstructionsFR,
      this.strInstructionsZH_HANS,
      this.strInstructionsZH_HANT,
      this.strDrinkThumb,
      this.strIngredient1,
      this.strIngredient2,
      this.strIngredient3,
      this.strIngredient4,
      this.strIngredient5,
      this.strIngredient6,
      this.strIngredient7,
      this.strIngredient8,
      this.strIngredient9,
      this.strIngredient10,
      this.strIngredient11,
      this.strIngredient12,
      this.strIngredient13,
      this.strIngredient14,
      this.strIngredient15,
      this.strMeasure1,
      this.strMeasure2,
      this.strMeasure3,
      this.strMeasure4,
      this.strMeasure5,
      this.strMeasure6,
      this.strMeasure7,
      this.strMeasure8,
      this.strMeasure9,
      this.strMeasure10,
      this.strMeasure11,
      this.strMeasure12,
      this.strMeasure13,
      this.strMeasure14,
      this.strMeasure15,
      this.strCreativeCommonsConfirmed,
      this.dateModified});

  factory CocktailDetails.fromJson(Map<String, dynamic> json) =>
      _$CocktailDetailsFromJson(json);

  String getIngredients() {
    final list = [
      _makeIngredient(strIngredient1, strMeasure1),
      _makeIngredient(strIngredient2, strMeasure2),
      _makeIngredient(strIngredient3, strMeasure3),
      _makeIngredient(strIngredient4, strMeasure4),
      _makeIngredient(strIngredient5, strMeasure5),
      _makeIngredient(strIngredient6, strMeasure6),
      _makeIngredient(strIngredient7, strMeasure7),
      _makeIngredient(strIngredient8, strMeasure8),
      _makeIngredient(strIngredient9, strMeasure9),
      _makeIngredient(strIngredient10, strMeasure10),
      _makeIngredient(strIngredient11, strMeasure11),
      _makeIngredient(strIngredient12, strMeasure12),
      _makeIngredient(strIngredient13, strMeasure13),
      _makeIngredient(strIngredient14, strMeasure14),
      _makeIngredient(strIngredient15, strMeasure15)
    ];

    return list.where((i) => i != null && i.isNotEmpty).join(", ");
  }

  String _makeIngredient(String ingredient, String measure) {
    if (measure == null || measure.isEmpty) {
      return ingredient;
    } else {
      return "$ingredient - $measure";
    }
  }
}
