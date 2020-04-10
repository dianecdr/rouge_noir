class Playcard {
  final String suit;
  final String value;

  Playcard({this.suit, this.value});

  factory Playcard.fromJson(Map<String, dynamic> json) {
    return new Playcard(
      suit: json['suit'],
      value: json['value'].toString(),
    );
  }
}
