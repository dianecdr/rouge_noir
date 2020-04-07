import 'package:flutter/material.dart';
import 'package:rouge_noir/model/playcard.dart';

class PlaycardWidget extends StatelessWidget {
  final Playcard card;

  PlaycardWidget({this.card});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
      ),
      child: Column(
        children: <Widget>[
          Text(card.suit),
          Text(card.value),
        ],
      ),
    );
  }
}
