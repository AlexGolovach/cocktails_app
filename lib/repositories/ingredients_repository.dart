import 'package:cocktailsapp/provider/cocktails_api_provider.dart';
import 'package:cocktailsapp/provider/result.dart';

class IngredientsRepository {
  final _api = CocktailsApiProvider();

  Future<Result> loadIngredients() => _api.loadIngredients();
}
