import 'package:cocktailsapp/blocs/cocktail_details_bloc.dart';
import 'package:cocktailsapp/models/cocktail_details.dart';
import 'package:flutter/material.dart';

class CocktailDetailsScreen extends StatefulWidget {
  final String id;

  CocktailDetailsScreen({this.id});

  @override
  createState() => CocktailDetailsScreenState();
}

class CocktailDetailsScreenState extends State<CocktailDetailsScreen> {
  CocktailDetailsBloc _bloc;

  @override
  void initState() {
    super.initState();

    _bloc = CocktailDetailsBloc();
    _bloc.loadCocktailDetails(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Details")),
        body: StreamBuilder(
            stream: _bloc.cocktailDetails,
            builder: (context, AsyncSnapshot<CocktailDetails> snapshot) {
              if (snapshot.hasData) {
                return _buildDetailsWidget(snapshot.data);
              } else if (snapshot.hasError) {
                return Center(child: Text(snapshot.error.toString()));
              }

              return Center(child: CircularProgressIndicator());
            }));
  }

  Widget _buildDetailsWidget(CocktailDetails data) {
    return SingleChildScrollView(
        padding: const EdgeInsets.all(2.0),
        child: Column(children: <Widget>[
          FadeInImage.assetNetwork(
              placeholder: "assets/cocktail_placeholder.png",
              image: data.strDrinkThumb),
          Align(
              alignment: Alignment.topLeft,
              child: Padding(
                  padding: EdgeInsets.only(bottom: 2.0, top: 2.0),
                  child: Text("Cocktail: ${data.strDrink}",
                      textAlign: TextAlign.left))),
          Align(
              alignment: Alignment.topLeft,
              child: Padding(
                  padding: EdgeInsets.only(bottom: 2.0, top: 2.0),
                  child: Text("Category: ${data.strCategory}",
                      textAlign: TextAlign.left))),
          Align(
              alignment: Alignment.topLeft,
              child: Padding(
                  padding: EdgeInsets.only(bottom: 2.0, top: 2.0),
                  child: Text("Alcoholic: ${data.strAlcoholic}",
                      textAlign: TextAlign.left))),
          Align(
              alignment: Alignment.topLeft,
              child: Padding(
                  padding: EdgeInsets.only(bottom: 2.0, top: 2.0),
                  child: Text("Ingredients: ${data.getIngredients()}",
                      textAlign: TextAlign.left))),
          Align(
              alignment: Alignment.topLeft,
              child: Padding(
                  padding: EdgeInsets.only(bottom: 2.0, top: 2.0),
                  child: Text("Instruction: ${data.strInstructions}",
                      textAlign: TextAlign.left)))
        ]));
  }
}
