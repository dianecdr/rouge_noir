import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'register_players_screen.dart';

class HomePageScreen extends StatelessWidget {
  void selectStartGame(BuildContext ctx) {
    Navigator.of(ctx).push(MaterialPageRoute(builder: (_) {
      return RegisterPlayersScreen();
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Rouge ou Noir ?'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Text(
              'Bienvenue dans le jeu Rouge ou Noir !',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            RaisedButton(
              child: Text('Commencer une partie'),
              color: Theme.of(context).textTheme.button.color,
              onPressed: () {
                selectStartGame(context);
              },
            )
          ],
        ),
      ),
    );
  }
}
