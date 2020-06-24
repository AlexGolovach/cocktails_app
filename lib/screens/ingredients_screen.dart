import 'package:cocktailsapp/models/ingredients.dart';
import 'package:cocktailsapp/screens/cocktails_list_screen.dart';
import 'package:cocktailsapp/utils/slide_animation.dart';
import '../blocs/ingredients_bloc.dart';
import 'package:flutter/material.dart';

class IngredientsScreen extends StatefulWidget {
  @override
  createState() => _IngredientsScreenState();
}

class _IngredientsScreenState extends State<IngredientsScreen> {
  IngredientsBloc _bloc;

  @override
  void initState() {
    super.initState();

    _bloc = IngredientsBloc();
    _bloc.loadIngredients();
  }

  @override
  void dispose() {
    _bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Ingredients")),
        body: StreamBuilder(
            stream: _bloc.ingredients,
            builder: (context, AsyncSnapshot<List<Ingredient>> snapshot) {
              if (snapshot.hasData) {
                return _buildList(snapshot);
              } else if (snapshot.hasError) {
                return Center(child: Text(snapshot.error.toString()));
              }

              return Center(child: CircularProgressIndicator());
            }));
  }

  Widget _buildList(AsyncSnapshot<List<Ingredient>> snapshot) {
    return ListView.builder(
        itemCount: snapshot.data.length,
        itemBuilder: (context, index) {
          final _item = snapshot.data[index];

          return GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    SlideAnimation(
                        enterPage: CocktailsListScreen(
                            ingredient: _item.strIngredient, category: ""),
                        exitPage: widget));
              },
              child: Card(
                  child: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: ListTile(title: Text(_item.strIngredient)))));
        });
  }
}
