import 'package:cocktailsapp/screens/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(CocktailsApp());
}

class CocktailsApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Cocktails App',
      theme: ThemeData(brightness: Brightness.light, fontFamily: "Avenir"),
      darkTheme: ThemeData(brightness: Brightness.dark, fontFamily: "Avenir"),
      home: HomeScreen(),
    );
  }
}
