import 'package:cocktailsapp/provider/cocktails_api_provider.dart';
import 'package:cocktailsapp/provider/result.dart';

class CocktailsRepository {
  final _api = CocktailsApiProvider();

  Future<Result> loadCocktailsByIngredient(String ingredient) =>
      _api.loadCocktailsByIngredient(ingredient);

  Future<Result> loadCocktailsByCategory(String category) =>
      _api.loadCocktailsByCategory(category);

  Future<Result> loadCocktailDetails(String id) =>
      _api.loadCocktailDetails(id);
}
