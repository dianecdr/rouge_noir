import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:rouge_noir/models/playcard.dart';

Future<String> _loadPlaycardAsset() async {
  return await rootBundle.loadString('assets/data/playcards_en.json');
}

Future<List<Playcard>> loadPlaycards() async {
  List<Playcard> playcards;
  String jsonCards = await _loadPlaycardAsset();
  final List data = json.decode(jsonCards);
  playcards = data
      .map<Playcard>((jsonCards) => Playcard.fromJson(jsonCards))
      .toList();
  return playcards;
}




