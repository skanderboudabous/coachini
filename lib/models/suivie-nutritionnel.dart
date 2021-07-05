
class SuivieNutritionnel{
  String? id;
  DateTime? date;
  int? qteCalRec;
  int? metabolisme;
  int? depEnergy;
  int? glucide;
  int? lipide;
  int? proteine;

  SuivieNutritionnel(
      {this.id,this.date, this.qteCalRec,this.metabolisme,this.depEnergy, this.glucide, this.lipide, this.proteine});

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
      qteCalRec: null == (temp = map['qteCalRec'])
          ? null
          : (temp is num ? temp.toInt() : int.tryParse(temp)),
      metabolisme: null == (temp = map['metabolisme'])
          ? null
          : (temp is num ? temp.toInt() : int.tryParse(temp)),
      depEnergy: null == (temp = map['depEnergy'])
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
      'qteCalRec': qteCalRec,
      'metabolisme': metabolisme,
      'depEnergy': depEnergy,
      'glucide': glucide,
      'lipide': lipide,
      'proteine': proteine,
      'date': date
    };
  }

  @override
  String toString() {
    return 'SuivieNutritionnel{id: $id, date: $date, qteCalRec: $qteCalRec,metabolisme: $metabolisme,depEnergy: $depEnergy, glucide: $glucide, lipide: $lipide, proteine: $proteine}';
  }
}
