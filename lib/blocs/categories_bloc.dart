import 'package:cocktailsapp/models/categories.dart';
import 'package:cocktailsapp/data/result.dart';
import 'package:cocktailsapp/repositories/categories_repository.dart';
import 'package:rxdart/rxdart.dart';

class CategoriesBloc {
  final _repository = CategoriesRepository();
  final _categoriesFetcher = BehaviorSubject<List<Category>>();

  Stream<List<Category>> get categories => _categoriesFetcher.stream;

  loadCategories() async {
    Result result = await _repository.loadCategories();

    if (result is Success) {
      _categoriesFetcher.sink.add(result.value);
    } else if (result is Error) {
      _categoriesFetcher.addError(result.error);
    }
  }

  dispose() {
    _categoriesFetcher.close();
  }
}
