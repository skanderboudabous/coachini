class SuivieNutritionnel{
  String? id;
  int? apport;
  int? glucide;
  int? lipide;
  int? proteine;

  SuivieNutritionnel(
      {this.id, this.apport, this.glucide, this.lipide, this.proteine});

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
    };
  }
}