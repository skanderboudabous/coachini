class RegimeAlimentaire{
  String? id;
  String? texte;
  DateTime? date;


  RegimeAlimentaire({this.id, this.texte,this.date});

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is RegimeAlimentaire && runtimeType == other.runtimeType && id == other.id;

  @override
  int get hashCode => id.hashCode;

  factory RegimeAlimentaire.fromMap(dynamic map) {
    var temp;
    return RegimeAlimentaire(
      id: map['id']?.toString(),
      texte: map['texte']?.toString(),
      date: null == (temp = map['date'])
          ? null
          : (temp is DateTime ? temp : DateTime.tryParse(temp)),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'texte': texte,
      'date':date?.toString(),
    };
  }

}
