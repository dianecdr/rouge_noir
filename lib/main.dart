import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rouge_noir/widget/playcard_list.dart';

import 'model/playcard.dart';
import 'model/user.dart';
import 'services/playcard_service.dart';

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
    home: new MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  MyAppState createState() => new MyAppState();
}

class MyAppState extends State<MyApp> {
  int userIndex = 0;
  List<Playcard> deck = [];
  List<Playcard> _userCards = [];
  Playcard pickedCard;
  List<User> users = [
    User(name: 'Maxime'),
    User(name: 'Diane'),
  ];

  User userPlaying;

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
    userPlaying = users[userIndex];
  }

  void _pickCard(User user) {
    setState(() {
      if (userIndex == users.length - 1) {
        userIndex = 0;
      } else {
        userIndex++;
      }

      if (deck != null && user.cards.length < 4) {
        pickedCard = (deck.toList()..shuffle()).first;
        user.cards.add(pickedCard);
        deck.remove(pickedCard);
        userPlaying = users[userIndex];
      } else {
        pickedCard = null;
      }
    });
  }

  void _resetGame() {
    setState(() {
      initDeck();
      for (var user in users) {
        user.cards = [];
      }
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
            Text(
              '[TO DO] ROUND NUMBER',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            Text(
              'Joueur actuel : ' + userPlaying.name,
              style: TextStyle(
                fontSize: 18,
                color: Colors.teal,
              ),
            ),
            FlatButton(
              child: Text(
                'Piocher',
                style: TextStyle(
                  color: Theme.of(context).textTheme.button.color,
                ),
              ),
              color: Theme.of(context).primaryColor,
              onPressed: () => _pickCard(userPlaying),
            ),
            FlatButton(
              child: Text(
                'Reset',
                style: TextStyle(
                  color: Theme.of(context).textTheme.button.color,
                ),
              ),
              color: Theme.of(context).accentColor,
              onPressed: _resetGame,
            ),
            Container(
              height: 300,
              child: ListView.builder(
                  itemCount: users.length,
                  itemBuilder: (BuildContext ctx, int index) {
                    return new Column(children: [
                      Text(
                        users[index].name,
                        style: Theme.of(context).textTheme.subtitle,
                      ),
                      PlaycardList(users[index].cards),
                    ]);
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
