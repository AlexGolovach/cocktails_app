import 'package:cocktailsapp/blocs/cocktails_list_bloc.dart';
import 'package:cocktailsapp/models/cocktails.dart';
import 'package:cocktailsapp/screens/cocktail_details_screen.dart';
import 'package:cocktailsapp/anim/slide_animation.dart';
import 'package:flutter/material.dart';

class CocktailsListScreen extends StatefulWidget {
  final String ingredient;
  final String category;

  CocktailsListScreen({this.ingredient, this.category});

  @override
  createState() => _CocktailsListScreenState();
}

class _CocktailsListScreenState extends State<CocktailsListScreen> {
  CocktailsListBloc _bloc;

  @override
  void initState() {
    super.initState();

    _bloc = CocktailsListBloc();

    if (widget.ingredient.isNotEmpty) {
      _bloc.loadCocktails(ingredient: widget.ingredient);
    } else if (widget.category.isNotEmpty) {
      _bloc.loadCocktails(category: widget.category);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Cocktails")),
      body: StreamBuilder(
          stream: _bloc.cocktails,
          builder: (context, AsyncSnapshot<List<Cocktail>> snapshot) {
            if (snapshot.hasData) {
              return _buildList(snapshot.data);
            } else if (snapshot.hasError) {
              return Center(child: Text(snapshot.error.toString()));
            }

            return Center(child: CircularProgressIndicator());
          }),
    );
  }

  Widget _buildList(List<Cocktail> data) {
    return ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) {
          final _item = data[index];

          return GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    SlideAnimation(
                        enterPage: CocktailDetailsScreen(id: _item.idDrink),
                        exitPage: widget));
              },
              child: Card(
                  child: Row(
                children: <Widget>[
                  Container(
                      padding: const EdgeInsets.all(2.0),
                      alignment: Alignment.topLeft,
                      height: 180.0,
                      width: 180.0,
                      child: FadeInImage.assetNetwork(
                          placeholder: "assets/cocktail_placeholder.png",
                          image: _item.strDrinkThumb)),
                  Expanded(
                      child: Container(
                          padding: const EdgeInsets.all(8.0),
                          alignment: Alignment.lerp(
                              Alignment.center, Alignment.centerRight, 0.0),
                          child: Text(_item.strDrink,
                              maxLines: 3, textAlign: TextAlign.center)))
                ],
              )));
        });
  }
}
