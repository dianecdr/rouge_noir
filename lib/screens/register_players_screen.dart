import 'package:flutter/material.dart';
import 'package:rouge_noir/screens/game_screen.dart';

class RegisterPlayersScreen extends StatelessWidget {
  void selectRegisterPlayers(BuildContext ctx) {
    Navigator.of(ctx).push(
      MaterialPageRoute(builder: (_) {
        return GameScreen();
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Rouge ou noir ?'),
      ),
      body: Column(
        children: <Widget>[
          Container(
            child: Text('Entrer info des joueurs : '),
          ),
          RaisedButton(
            child: Text('Enregistrer'),
            onPressed: () => selectRegisterPlayers(context),
          )
        ],
      ),
    );
  }
}
