import 'package:json_annotation/json_annotation.dart';

part 'categories.g.dart';

@JsonSerializable()
class Categories {
  final List<Category> drinks;

  Categories({this.drinks});

  factory Categories.fromJson(Map<String, dynamic> json) => _$CategoriesFromJson(json);
}

@JsonSerializable()
class Category {
  final String strCategory;

  Category({this.strCategory});

  factory Category.fromJson(Map<String, dynamic> json) => _$CategoryFromJson(json);
}
