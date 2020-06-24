import 'package:cocktailsapp/models/cocktail_details.dart';
import 'package:cocktailsapp/provider/result.dart';
import 'package:cocktailsapp/repositories/cocktails_repository.dart';
import 'package:rxdart/rxdart.dart';

class CocktailDetailsBloc {
  final _repository = CocktailsRepository();
  final _cocktailDetailsFetcher = BehaviorSubject<CocktailDetails>();

  Stream<CocktailDetails> get cocktailDetails => _cocktailDetailsFetcher.stream;

  loadCocktailDetails(String id) async {
    Result result = await _repository.loadCocktailDetails(id);

    if (result is Success) {
      _cocktailDetailsFetcher.sink.add(result.value);
    } else if (result is Error) {
      _cocktailDetailsFetcher.addError(result.error);
    }
  }

  dispose() {
    _cocktailDetailsFetcher.close();
  }
}
