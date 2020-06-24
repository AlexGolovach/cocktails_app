import 'package:cocktailsapp/provider/cocktails_api_provider.dart';
import 'package:cocktailsapp/provider/result.dart';

class CategoriesRepository {
  final _api = CocktailsApiProvider();

  Future<Result> loadCategories() => _api.loadCategories();
}