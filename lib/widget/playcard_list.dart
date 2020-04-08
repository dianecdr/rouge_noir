import 'package:flutter/material.dart';
import 'package:rouge_noir/model/playcard.dart';
import 'package:rouge_noir/widget/playcard_widget.dart';

class PlaycardList extends StatelessWidget {
  final List<Playcard> _cards;

  PlaycardList(this._cards);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 50,
        width: 200,
        margin: EdgeInsets.all(10),
        child: (_cards != null && _cards.isNotEmpty)
            ? new ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: _cards.length,
                itemBuilder: (BuildContext ctx, int index) {
                  return new PlaycardWidget(card: _cards[index]);
                })
            // _cards.map((el) => PlaycardWidget(card: el)).toList())
            : Text(
                'Pas de carte',
                style: TextStyle(
                  color: Colors.blueGrey,
                ),
              ));
  }
}
