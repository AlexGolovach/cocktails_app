import 'package:cocktailsapp/data/cocktails_api_provider.dart';
import 'package:cocktailsapp/data/result.dart';
import 'package:cocktailsapp/di/service_locator.dart';

class CocktailsRepository {
  final _api = locator<CocktailsApiProvider>();

  Future<Result> loadCocktailsByIngredient(String ingredient) =>
      _api.loadCocktailsByIngredient(ingredient);

  Future<Result> loadCocktailsByCategory(String category) =>
      _api.loadCocktailsByCategory(category);

  Future<Result> loadCocktailDetails(String id) => _api.loadCocktailDetails(id);
}
