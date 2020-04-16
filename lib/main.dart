import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rouge_noir/screens/homepage_screen.dart';
void main() {
  runApp(new MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: new ThemeData(
      primarySwatch: Colors.teal,
      primaryColorDark: Color.fromRGBO(0, 121, 107, 1),
      accentColor: Colors.amber,
      buttonColor: Colors.teal,
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
