class CompositionCorporelle {
  String? id;
  double? poids;//15
  double? masseGraisse;//5
  double? masseHydrique;//10
  double? masseMusculaire;//10
  double? masseOsseuse;//10
  double? imc;//5
  DateTime? date;

  CompositionCorporelle(
      {this.id,
        this.poids,
        this.masseGraisse,
        this.masseHydrique,
        this.masseMusculaire,
        this.masseOsseuse,
        this.imc,
        this.date});

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is CompositionCorporelle && runtimeType == other.runtimeType && id == other.id;

  @override
  int get hashCode => id.hashCode;

  factory CompositionCorporelle.fromMap(dynamic map) {
    var temp;
    return CompositionCorporelle(
      id: map['id']?.toString(),
      poids: null == (temp = map['poids'])
          ? null
          : (temp is num ? temp.toDouble() : double.tryParse(temp)),
      masseGraisse: null == (temp = map['masseGraisse'])
          ? null
          : (temp is num ? temp.toDouble() : double.tryParse(temp)),
      masseHydrique: null == (temp = map['masseHydrique'])
          ? null
          : (temp is num ? temp.toDouble() : double.tryParse(temp)),
      masseMusculaire: null == (temp = map['masseMusculaire'])
          ? null
          : (temp is num ? temp.toDouble() : double.tryParse(temp)),
      masseOsseuse: null == (temp = map['masseOsseuse'])
          ? null
          : (temp is num ? temp.toDouble() : double.tryParse(temp)),
      imc: null == (temp = map['imc'])
          ? null
          : (temp is num ? temp.toDouble() : double.tryParse(temp)),

      date: null == (temp = map['date'])
          ? null
          : (temp is DateTime
          ? temp
          : DateTime.fromMillisecondsSinceEpoch(
          temp.millisecondsSinceEpoch)),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'poids': poids,
      'masseGraisse': masseGraisse,
      'masseHydrique': masseHydrique,
      'masseMusculaire': masseMusculaire,
      'masseOsseuse': masseOsseuse,
      'imc': imc,
      'date': date
    };
  }

  @override
  String toString() {
    return 'CompositionCorporelle{id: $id,poids: $poids,masseGraisse: $masseGraisse,masseHydrique: $masseHydrique,masseMusculaire: $masseMusculaire,masseOsseuse: $masseOsseuse,imc: $imc ,date: $date}';
  }
}
