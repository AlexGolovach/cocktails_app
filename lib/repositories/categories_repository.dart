import 'package:cocktailsapp/data/cocktails_api_provider.dart';
import 'package:cocktailsapp/data/result.dart';
import 'package:cocktailsapp/di/service_locator.dart';

class CategoriesRepository {
  final _api = locator<CocktailsApiProvider>();

  Future<Result> loadCategories() => _api.loadCategories();
}
