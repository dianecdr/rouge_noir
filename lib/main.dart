import 'package:flutter/material.dart';
import 'package:rouge_noir/widget/playcard_list.dart';
import 'package:rouge_noir/widget/playcard_widget.dart';

import 'model/playcard.dart';
import 'model/user.dart';
import 'services/playcard_service.dart';

void main() {
  runApp(new MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: new ThemeData(
        primarySwatch: Colors.teal,
        primaryColorDark: Colors.brown,
        accentColor: Colors.tealAccent,
        textTheme: ThemeData.light().textTheme.copyWith(
                button: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ))),
    home: new MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  MyAppState createState() => new MyAppState();
}

class MyAppState extends State<MyApp> {
  List<Playcard> deck = [];
  List<Playcard> _userCards = [];
  Playcard pickedCard;
  User maxime = new User(name: 'Maxime');

  void initDeck() {
    loadPlaycards().then((e) {
      deck = e;
    }).catchError((err) {
      print(err);
    });
  }

  @override
  void initState() {
    super.initState();
    initDeck();
  }

  void _pickCard() {
    setState(() {
      if (deck != null && maxime.cards.length < 4) {
        pickedCard = (deck.toList()..shuffle()).first;
        maxime.cards.add(pickedCard);
        deck.remove(pickedCard);
      } else {
        pickedCard = null;
      }
    });
  }

  void _resetGame() {
    setState(() {
      initDeck();
      maxime.cards = [];
      pickedCard = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(
          'Rouge ou Noir ?',
          style: new TextStyle(color: Colors.white),
        ),
      ),
      body: new Center(
        child: Column(
          children: <Widget>[
            FlatButton(
              child: Text(
                'Piocher une carte',
                style: TextStyle(
                  color: Theme.of(context).textTheme.button.color,
                ),
              ),
              color: Theme.of(context).primaryColor,
              onPressed: _pickCard,
            ),
            FlatButton(
              child: Text(
                'Reset',
                style: TextStyle(
                  color: Theme.of(context).textTheme.button.color,
                ),
              ),
              color: Theme.of(context).primaryColor,
              onPressed: _resetGame,
            ),
            (_userCards.length < 4)
                ? PlaycardWidget(card: pickedCard)
                : Text("Vous avez déjà tiré 4 cartes"),
            Column(
              children: [
                Text('Cartes de ' + maxime.name + ' : '),
                PlaycardList(maxime.cards)
              ],
            )
          ],
        ),
      ),
    );
  }
}
