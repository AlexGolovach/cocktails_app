import 'dart:convert';

import 'package:cocktailsapp/api/api.dart';
import 'package:cocktailsapp/models/categories.dart';
import 'package:cocktailsapp/models/cocktail_details.dart';
import 'package:cocktailsapp/models/cocktails.dart';
import 'package:cocktailsapp/models/ingredients.dart';
import 'package:cocktailsapp/data/result.dart';
import 'package:http/http.dart' show Client;

class CocktailsApiProvider {
  final Client _client = Client();

  Future<Result> loadIngredients() async {
    final response = await _client.get(Api.getIngredientsList());

    if (response.statusCode == 200) {
      return Result<List<Ingredient>>.success(
          Ingredients.fromJson(jsonDecode(response.body)).drinks);
    } else {
      return Result<String>.error('Failed to load ingredients');
    }
  }

  Future<Result> loadCategories() async {
    final response = await _client.get(Api.getCategoriesList());

    if (response.statusCode == 200) {
      return Result<List<Category>>.success(
          Categories.fromJson(jsonDecode(response.body)).drinks);
    } else {
      return Result<String>.error('Failed to load categories');
    }
  }

  Future<Result> loadCocktailsByIngredient(String ingredient) async {
    final response =
        await _client.get(Api.getCocktailsListByIngredient(ingredient));

    if (response.statusCode == 200) {
      return Result<List<Cocktail>>.success(
          Cocktails.fromJson(jsonDecode(response.body)).drinks);
    } else {
      return Result<String>.error('Failed to load cocktails');
    }
  }

  Future<Result> loadCocktailsByCategory(String category) async {
    final response =
        await _client.get(Api.getCocktailsListByCategory(category));

    if (response.statusCode == 200) {
      return Result<List<Cocktail>>.success(
          Cocktails.fromJson(jsonDecode(response.body)).drinks);
    } else {
      Result<String>.error('Failed to load cocktails');
    }
  }

  Future<Result> loadCocktailDetails(String id) async {
    final response = await _client.get(Api.getCocktailDetails(id));

    if (response.statusCode == 200) {
      return Result<CocktailDetails>.success(
          CocktailDetailsResponse.fromJson(jsonDecode(response.body))
              .drinks
              .first);
    } else {
      return Result<String>.error('Failed to load cocktail details');
    }
  }
}
