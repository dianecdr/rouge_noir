import 'package:flutter/material.dart';

class InfoUserForm extends StatelessWidget {
  final userNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        controller: userNameController,
        decoration: InputDecoration(labelText: 'Nom Joueur 1'),
      ),
    );
  }
}
