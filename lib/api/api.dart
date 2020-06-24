class Api {
  static const String _url = "https://www.thecocktaildb.com/api/json/v1/1/";

  static String getIngredientsList() {
    return "${_url}list.php?i=list";
  }

  static String getCategoriesList() {
    return "${_url}list.php?c=list";
  }

  static String getCocktailsListByIngredient(String ingredient) {
    return "${_url}filter.php?i=$ingredient";
  }

  static String getCocktailsListByCategory(String category) {
    return "${_url}filter.php?c=$category";
  }

  static String getCocktailDetails(String id) {
    return "${_url}lookup.php?i=$id";
  }
}
