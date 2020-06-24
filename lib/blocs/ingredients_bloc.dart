import 'package:cocktailsapp/models/ingredients.dart';
import 'package:cocktailsapp/provider/result.dart';
import 'package:cocktailsapp/repositories/ingredients_repository.dart';
import 'package:rxdart/rxdart.dart';

class IngredientsBloc {
  final _repository = IngredientsRepository();
  final _ingredientsFetcher = BehaviorSubject<List<Ingredient>>();

  Stream<List<Ingredient>> get ingredients => _ingredientsFetcher.stream;

  loadIngredients() async {
    Result result = await _repository.loadIngredients();

    if (result is Success) {
      _ingredientsFetcher.sink.add(result.value);
    } else if (result is Error) {
      _ingredientsFetcher.addError(result.error);
    }
  }

  dispose() {
    _ingredientsFetcher.close();
  }
}
