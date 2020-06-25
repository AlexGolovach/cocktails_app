import 'package:cocktailsapp/models/cocktails.dart';
import 'package:cocktailsapp/data/result.dart';
import 'package:cocktailsapp/repositories/cocktails_repository.dart';
import 'package:rxdart/rxdart.dart';

class CocktailsListBloc {
  final _repository = CocktailsRepository();
  final _cocktailsFetcher = BehaviorSubject<List<Cocktail>>();

  Stream<List<Cocktail>> get cocktails => _cocktailsFetcher.stream;

  loadCocktails({String ingredient = "", String category = ""}) async {
    Result result;

    if (ingredient.isNotEmpty) {
      result = await _repository.loadCocktailsByIngredient(ingredient);
      _loadCocktails(result);
    } else if (category.isNotEmpty) {
      result = await _repository.loadCocktailsByCategory(category);
      _loadCocktails(result);
    }
  }

  _loadCocktails(Result result) {
    if (result is Success) {
      _cocktailsFetcher.sink.add(result.value);
    } else if (result is Error) {
      _cocktailsFetcher.addError(result.error);
    }
  }

  dispose() {
    _cocktailsFetcher.close();
  }
}
