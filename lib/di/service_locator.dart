import 'package:cocktailsapp/data/cocktails_api_provider.dart';
import 'package:get_it/get_it.dart';

final GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => CocktailsApiProvider());
}
