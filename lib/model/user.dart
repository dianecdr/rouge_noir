import 'package:rouge_noir/model/playcard.dart';

class User {
  String id;
  String name;
  List<Playcard> cards = [];

  User({String name}) {
    this.name = name;
    this.id = name+'2020';
  }

  void resetUserCards(User user){
    user.cards = [];
  }
}
