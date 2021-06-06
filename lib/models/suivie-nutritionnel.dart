
class SuivieNutritionnel{
  String? id;
  DateTime? date;
  int? apport;//250
  int? glucide;//100
  int? lipide;//100
  int? proteine;//100

  SuivieNutritionnel(
      {this.id,this.date, this.apport, this.glucide, this.lipide, this.proteine});

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SuivieNutritionnel &&
          runtimeType == other.runtimeType &&
          id == other.id;

  @override
  int get hashCode => id.hashCode;

  factory SuivieNutritionnel.fromMap(dynamic map) {
    var temp;
    return SuivieNutritionnel(
      id: map['id']?.toString(),
      date: null == (temp = map['date'])
          ? null
          : (temp is DateTime ? temp : DateTime.fromMillisecondsSinceEpoch(temp.millisecondsSinceEpoch)),
      apport: null == (temp = map['apport'])
          ? null
          : (temp is num ? temp.toInt() : int.tryParse(temp)),
      glucide: null == (temp = map['glucide'])
          ? null
          : (temp is num ? temp.toInt() : int.tryParse(temp)),
      lipide: null == (temp = map['lipide'])
          ? null
          : (temp is num ? temp.toInt() : int.tryParse(temp)),
      proteine: null == (temp = map['proteine'])
          ? null
          : (temp is num ? temp.toInt() : int.tryParse(temp)),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'apport': apport,
      'glucide': glucide,
      'lipide': lipide,
      'proteine': proteine,
      'date': date
    };
  }

  @override
  String toString() {
    return 'SuivieNutritionnel{id: $id, date: $date, apport: $apport, glucide: $glucide, lipide: $lipide, proteine: $proteine}';
  }
}
