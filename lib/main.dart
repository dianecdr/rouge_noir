import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rouge_noir/screens/homepage_screen.dart';
void main() {
  runApp(new MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: new ThemeData(
      primarySwatch: Colors.teal,
      primaryColorDark: Colors.brown,
      accentColor: Colors.amber,
      textTheme: ThemeData.light().textTheme.copyWith(
          button: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
          subtitle: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          )),
    ),
    home: new HomePageScreen(),
  ));
}
