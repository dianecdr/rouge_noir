import 'package:flutter/material.dart';

class InfoUserForm extends StatelessWidget {
  final TextEditingController _userNameController;
  final int _userNum;

  InfoUserForm(this._userNameController, this._userNum);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text('Joueur '+_userNum.toString()+' :', style: TextStyle(fontSize: 18),),
          SizedBox(
            width: 300,
            height: 50,
            child: TextField(
              controller: _userNameController,
              decoration: InputDecoration(hintText: 'Nom'),
            ),
          ),
        ],
      ),
    );
  }
}
