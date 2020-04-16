import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'register_users_screen.dart';

class HomePageScreen extends StatelessWidget {
  void selectStartGame(BuildContext ctx) {
    Navigator.of(ctx).push(MaterialPageRoute(builder: (_) {
      return RegisterUsersScreen();
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
            Padding(
              padding: const EdgeInsets.all(10),
              child: Text(
                'Bienvenue dans le jeu\nRouge ou Noir !',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
            RaisedButton(
              child: Text(
                'Commencer une partie',
                style: TextStyle(
                    color: Theme.of(context).textTheme.button.color,
                    fontWeight: FontWeight.bold),
              ),
              color: Theme.of(context).primaryColor,
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
