import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rouge_noir/widget/playcard_list.dart';

import 'model/playcard.dart';

void main() {
  runApp(new MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: new ThemeData(
      primaryColor: Colors.red,
      primaryColorDark: Colors.brown,
      accentColor: Colors.yellowAccent,
    ),
    home: new MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  MyAppState createState() => new MyAppState();
}

class MyAppState extends State<MyApp> {
  //Future<List<Playcard>> futurePlaycards;
  List<Playcard> deck;
  List<Playcard> userCards = [];

  void initDeck() {
    loadPlaycards().then((e) {
      deck = e;
    }).catchError((err) {
      print(err);
    });
  }

  Future<String> _loadPlaycardAsset() async {
    return await rootBundle.loadString('assets/data/playcards_en.json');
  }

  Future<List<Playcard>> loadPlaycards() async {
    List<Playcard> playcards;
    String jsonCards = await _loadPlaycardAsset();
    final List data = json.decode(jsonCards);
    playcards = data
        .map<Playcard>((jsonCards) => Playcard.fromJson(jsonCards))
        .toList();
    return playcards;
  }

  @override
  void initState() {
    super.initState();
    //futurePlaycard = loadPlaycards();
    initDeck();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(
          "Load local JSON file",
          style: new TextStyle(color: Colors.white),
        ),
      ),
      body: new Center(
          child: PlaycardList(deck),

          /*child: FutureBuilder(
          future: futurePlaycards,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return PlaycardList(deck);
            }
            if (snapshot.hasError) {
              return Text('Error in fetch data');
            }
            return Container();
          },
        )*/
      ),
    );
  }
}
