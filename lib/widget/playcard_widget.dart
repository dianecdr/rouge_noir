import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:rouge_noir/model/playcard.dart';

class PlaycardWidget extends StatelessWidget {
  final Playcard card;

  PlaycardWidget({this.card});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 50,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
      ),
      child: card != null
          ? Column(
              children: <Widget>[
                SuitWidget(card.suit),
                Text(card.value),
              ],
            )
          : Text("0 carte"),
    );
  }
}

class SuitWidget extends StatelessWidget {
  final String suitText;

  Icon get suitIcon {
    switch (suitText) {
      case 'hearts':
        {
          return Icon(
            MdiIcons.cardsHeart,
            color: Colors.red,
          );
        }
        break;
      case 'diamonds':
        {
          return Icon(
            MdiIcons.cardsDiamond,
            color: Colors.red,
          );
        }
        break;
      case 'spades':
        {
          return Icon(MdiIcons.cardsSpade);
        }
        break;
      case 'clubs':
        {
          return Icon(MdiIcons.cardsClub);
        }
        break;
      default:
        {
          return Icon(Icons.not_interested);
        }
        break;
    }
  }

  SuitWidget(this.suitText);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: suitIcon,
    );
  }
}
