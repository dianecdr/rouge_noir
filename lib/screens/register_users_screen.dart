import 'package:flutter/material.dart';
import 'package:rouge_noir/models/user.dart';
import 'package:rouge_noir/screens/game_screen.dart';
import 'package:rouge_noir/widget/info_user_form.dart';

class RegisterUsersScreen extends StatefulWidget {
  @override
  _RegisterUsersScreenState createState() => _RegisterUsersScreenState();
}

class _RegisterUsersScreenState extends State<RegisterUsersScreen> {
  List<User> users = [];
  int nbUsers = 1;
  List<TextEditingController> userNameControllers = [TextEditingController()];

  void registerUsers(BuildContext ctx) {
    users.add(User(name: userNameControllers[0].text));

    // Display game screen
    Navigator.of(ctx).push(
      MaterialPageRoute(builder: (_) {
        return GameScreen(users);
      }),
    );
  }

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Rouge ou noir ?'),
      ),
      body: Container(
        width: 600,
        child: Column(
          children: <Widget>[
            Text('Saisir info joueurs : '),
            Text('Combien de joueurs ?'),
            Container(
              margin: EdgeInsets.all(15),
              height: 100,
              child: Row(
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
              ),
            ),
            InfoUserForm(
              userNameController: userNameControllers[0],
            ),
            RaisedButton(
              child: Text('Enregistrer'),
              onPressed: () => registerUsers(context),
            )
          ],
        ),
      ),
    );
  }
}
