import 'package:flutter/cupertino.dart';
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
  int _nbUsers = 1;
  List<TextEditingController> _infoUserControllers = [TextEditingController()];

  void _registerUsers(BuildContext ctx) {
    _infoUserControllers.map((ctrl) {
      users.add(User(ctrl.text));
    }).toList();

    // Display game screen
    Navigator.of(ctx).push(
      MaterialPageRoute(builder: (_) {
        return GameScreen(users);
      }),
    );
  }

  void _increaseNbUsers() {
    setState(() {
      if (_nbUsers < 8) {
        _nbUsers++;
        _infoUserControllers.add(TextEditingController());
      }
    });
  }

  void _decreaseNbUsers() {
    setState(() {
      if (_nbUsers > 1) {
        _nbUsers--;
        _infoUserControllers.removeLast();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Rouge ou noir ?'),
      ),
      body: Center(
        child: Container(
          width: 600,
          height: 700,
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(5),
                child: Text(
                  'Combien de joueurs ? (8 max.)',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    IconButton(
                      icon: Icon(Icons.remove),
                      color: Colors.redAccent,
                      onPressed: _decreaseNbUsers,
                    ),
                    Text(
                      _nbUsers.toString(),
                      style: TextStyle(fontSize: 16),
                    ),
                    IconButton(
                      icon: Icon(Icons.add),
                      color: Colors.lightGreen,
                      onPressed: _increaseNbUsers,
                    )
                  ],
                ),
              ),
              Expanded(
                child: ListView.builder(
                    padding: const EdgeInsets.all(5),
                    itemCount: _nbUsers,
                    itemBuilder: (ctx, index) {
                      return InfoUserForm(
                        _infoUserControllers[index],
                        index + 1,
                      );
                    }),
              ),
              RaisedButton(
                child: Text(
                  'Enregistrer',
                  style: TextStyle(
                      color: Theme.of(context).textTheme.button.color),
                ),
                onPressed: () => _registerUsers(context),
              )
            ],
          ),
        ),
      ),
    );
  }
}
