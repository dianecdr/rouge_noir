import 'package:flutter/material.dart';
import 'package:rouge_noir/models/playcard.dart';
import 'package:rouge_noir/models/user.dart';
import 'package:rouge_noir/services/playcard_service.dart';
import 'package:rouge_noir/widget/playcard_list.dart';

class GameScreen extends StatefulWidget {
  final List<User> users;

  GameScreen(this.users);

  @override
  GameScreenState createState() => new GameScreenState();
}

class GameScreenState extends State<GameScreen> {
  static const NB_ROUNDS = 4;
  int userIndex = 0;
  List<Playcard> deck = [];
  Playcard pickedCard;
  List<User> usersTest = [
    User(name: 'Maxime'),
    User(name: 'Diane'),
  ];
  int roundIndex = 1;

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
    userPlaying = widget.users[userIndex];
  }

  void _pickCard(User user) {
    setState(() {
      if (userIndex == widget.users.length - 1) {
        userIndex = 0;
        if (roundIndex != NB_ROUNDS) {
          roundIndex++;
        }
      } else {
        userIndex++;
      }

      if (deck != null && user.cards.length < NB_ROUNDS) {
        print('inside pickCard actions');
        pickedCard = (deck.toList()..shuffle()).first;
        user.cards.add(pickedCard);
        deck.remove(pickedCard);
        userPlaying = widget.users[userIndex];
      } else {
        pickedCard = null;
      }
    });
  }

  void _resetGame() {
    setState(() {
      initDeck();
      for (var user in widget.users) {
        user.cards = [];
      }
      pickedCard = null;
      roundIndex = 1;
      userIndex = 0;
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
      body: new Container(
        width: 600,
        child: Column(
          children: <Widget>[
            Text(
              'ROUND ' + roundIndex.toString(),
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            widget.users.last.cards.length == NB_ROUNDS
                ? Text(
                    'FIN DE PARTIE',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.amber,
                    ),
                  )
                : Text(
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
            Expanded(
              child: ListView.builder(
                  itemCount: widget.users.length,
                  itemBuilder: (BuildContext ctx, int index) {
                    return new Column(children: [
                      Text(
                        widget.users[index].name,
                        style: Theme.of(context).textTheme.subtitle,
                      ),
                      PlaycardList(widget.users[index].cards),
                    ]);
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
