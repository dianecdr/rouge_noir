import 'package:flutter/material.dart';
import 'package:rouge_noir/screens/game_screen.dart';
import 'package:rouge_noir/widget/info_user_form.dart';

class RegisterPlayersScreen extends StatefulWidget {
  @override
  _RegisterPlayersScreenState createState() => _RegisterPlayersScreenState();
}

class _RegisterPlayersScreenState extends State<RegisterPlayersScreen> {
  void selectRegisterPlayers(BuildContext ctx) {
    Navigator.of(ctx).push(
      MaterialPageRoute(builder: (_) {
        return GameScreen();
      }),
    );
  }

  @override
  int nbUsers = 0;

  void increaseNbUsers() {
    setState(() {
      nbUsers++;
    });
  }

  void decreaseNbUsers() {
    setState(() {
      nbUsers--;
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Rouge ou noir ?'),
      ),
      body: Container(
        width: 400,
        child: Column(
          children: <Widget>[
            Container(
              child: Text('Saisir info joueurs : '),
            ),
            Container(
              margin: EdgeInsets.all(15),
              height: 100,
              child: Column(
                children: <Widget>[
                  Text('Combien de joueurs ?'),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      IconButton(
                        icon: Icon(Icons.remove),
                        color: Theme.of(context).buttonColor,
                        onPressed: decreaseNbUsers,
                      ),
                      Text(nbUsers.toString()),
                      IconButton(
                        icon: Icon(Icons.add),
                        color: Theme.of(context).buttonColor,
                        onPressed: increaseNbUsers,
                      )
                    ],
                  )
                ],
              ),
            ),
            InfoUserForm(),
            RaisedButton(
              child: Text('Enregistrer'),
              onPressed: () => selectRegisterPlayers(context),
            )
          ],
        ),
      ),
    );
  }
}
