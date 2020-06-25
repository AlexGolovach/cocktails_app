import 'package:cocktailsapp/di/service_locator.dart';
import 'package:cocktailsapp/data/cocktails_api_provider.dart';
import 'package:cocktailsapp/data/result.dart';

class IngredientsRepository {
  final _api = locator<CocktailsApiProvider>();

  Future<Result> loadIngredients() => _api.loadIngredients();
}
