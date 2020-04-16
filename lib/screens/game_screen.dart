import 'package:flutter/material.dart';
import 'package:rouge_noir/models/playcard.dart';
import 'package:rouge_noir/models/user.dart';
import 'package:rouge_noir/services/playcard_service.dart';
import 'package:rouge_noir/widget/playcard_list.dart';

class GameScreen extends StatefulWidget {
  final List<User> _users;

  GameScreen(this._users);

  @override
  GameScreenState createState() => new GameScreenState();
}

class GameScreenState extends State<GameScreen> {
  static const _NB_ROUNDS = 4;
  int _userIndex = 0;
  List<Playcard> deck = [];
  Playcard _pickedCard;
  int _roundIndex = 1;

  User _userPlaying;

  void _initDeck() {
    loadPlaycards().then((e) {
      deck = e;
    }).catchError((err) {
      print(err);
    });
  }

  @override
  void initState() {
    super.initState();
    _initDeck();
    _userPlaying = widget._users[_userIndex];
  }

  void _pickCard(User user) {
    setState(() {
      if (_userIndex == widget._users.length - 1) {
        _userIndex = 0;
        if (_roundIndex != _NB_ROUNDS) {
          _roundIndex++;
        }
      } else {
        _userIndex++;
      }

      if (deck != null && user.cards.length < _NB_ROUNDS) {
        _pickedCard = (deck.toList()..shuffle()).first;
        user.cards.add(_pickedCard);
        deck.remove(_pickedCard);
        _userPlaying = widget._users[_userIndex];
      } else {
        _pickedCard = null;
      }
    });
  }

  void _resetGame() {
    setState(() {
      _initDeck();
      for (var user in widget._users) {
        user.cards = [];
      }
      _pickedCard = null;
      _roundIndex = 1;
      _userIndex = 0;
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
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'ROUND ' + _roundIndex.toString(),
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            widget._users.last.cards.length == _NB_ROUNDS
                ? Text(
                    'FIN DE PARTIE',
                    style: TextStyle(
                      fontSize: 18,
                      color: Theme.of(context).accentColor,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                : Text(
                    'Joueur actuel : ' + _userPlaying.name,
                    style: TextStyle(
                      fontSize: 18,
                      color: Theme.of(context).primaryColor,
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
              onPressed: () => _pickCard(_userPlaying),
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
                  itemCount: widget._users.length,
                  itemBuilder: (BuildContext ctx, int index) {
                    return new Column(children: [
                      Text(
                        widget._users[index].name,
                        style: Theme.of(context).textTheme.subtitle,
                      ),
                      PlaycardList(widget._users[index].cards),
                    ]);
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
