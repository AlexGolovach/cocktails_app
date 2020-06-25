import 'package:cocktailsapp/blocs/categories_bloc.dart';
import 'package:cocktailsapp/models/categories.dart';
import 'package:cocktailsapp/screens/cocktails_list_screen.dart';
import 'package:cocktailsapp/anim/slide_animation.dart';
import 'package:flutter/material.dart';

class CategoriesScreen extends StatefulWidget {
  @override
  createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  CategoriesBloc _bloc;

  @override
  void initState() {
    super.initState();

    _bloc = CategoriesBloc();
    _bloc.loadCategories();
  }

  @override
  void dispose() {
    _bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Categories")),
      body: StreamBuilder(
          stream: _bloc.categories,
          builder: (context, AsyncSnapshot<List<Category>> snapshot) {
            if (snapshot.hasData) {
              return _buildList(snapshot.data);
            } else if (snapshot.hasError) {
              return Center(child: Text(snapshot.error.toString()));
            }

            return Center(child: CircularProgressIndicator());
          }),
    );
  }

  Widget _buildList(List<Category> data) {
    return ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) {
          final _item = data[index];

          return GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    SlideAnimation(
                        enterPage: CocktailsListScreen(
                            ingredient: "", category: _item.strCategory),
                        exitPage: widget));
              },
              child: Card(
                  child: Padding(
                      padding: EdgeInsets.all(2.0),
                      child: ListTile(title: Text(_item.strCategory)))));
        });
  }
}
