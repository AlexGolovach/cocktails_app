import 'package:cocktailsapp/screens/categories_screen.dart';
import 'package:cocktailsapp/screens/ingredients_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: <Widget>[IngredientsScreen(), CategoriesScreen()],
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (value) {
            if (mounted) {
              setState(() {
                _currentIndex = value;
              });
            }
          },
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.assignment), title: Text("Ingredients")),
            BottomNavigationBarItem(
                icon: Icon(Icons.category), title: Text("Categories"))
          ]),
    );
  }
}
