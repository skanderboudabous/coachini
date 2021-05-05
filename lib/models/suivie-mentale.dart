class SuivieMentale{
  String? id;
  DateTime? date;
  int? bien_etre ;
  int? positivite ;
  int? negativite ;
  int? depression ;
  int? anxiete ;
  int? stress ;
  int? niveau_fatigue ;

  SuivieMentale({this.id, this.date, this.bien_etre, this.positivite, this.negativite, this.depression, this.anxiete, this.stress, this.niveau_fatigue});

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is SuivieMentale && runtimeType == other.runtimeType && id == other.id;

  @override
  int get hashCode => id.hashCode;


  @override
  String toString() {
    return 'SuivieMentale{id: $id, date: $date,bien_etre: $bien_etre,positivite: $positivite,negativite: $negativite,depression: $depression,anxiete: $anxiete,stress: $stress,niveau_fatigue: $niveau_fatigue }';
  }

  factory SuivieMentale.fromMap(dynamic map) {
    var temp;
    return SuivieMentale(
      id: map['id']?.toString(),
      date: null == (temp = map['date'])
          ? null
          : (temp is DateTime ? temp : DateTime.tryParse(temp)),
      bien_etre: null == (temp = map['bien_etre'])
          ? null
          : (temp is num ? temp.toInt() : int.tryParse(temp)),
      positivite: null == (temp = map['positivite'])
          ? null
          : (temp is num ? temp.toInt() : int.tryParse(temp)),
      negativite: null == (temp = map['negativite'])
          ? null
          : (temp is num ? temp.toInt() : int.tryParse(temp)),
      depression: null == (temp = map['depression'])
          ? null
          : (temp is num ? temp.toInt() : int.tryParse(temp)),
      anxiete: null == (temp = map['anxiete'])
          ? null
          : (temp is num ? temp.toInt() : int.tryParse(temp)),
      stress: null == (temp = map['stress'])
          ? null
          : (temp is num ? temp.toInt() : int.tryParse(temp)),
      niveau_fatigue: null == (temp = map['niveau_fatigue'])
          ? null
          : (temp is num ? temp.toInt() : int.tryParse(temp)),

    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'date': date,
      'bien_etre': bien_etre,
      'positivite': positivite,
      'negativite': negativite,
      'depression': depression,
      'anxiete': anxiete,
      'stress': stress,
      'niveau_fatigue': niveau_fatigue
    };
  }
}
