class Mesure{
  String? id;
  DateTime? date;
  double? poid;
  double? taille;
  double? IMC;
  int? FC;
  double? masseMuscle;
  double? masseGraisse;
  double? stresse;
  double? oxygene;
  double? tourTaille;
  double? tourHancher;
  double? VMA;
  double? LMD;
  int? cordination;
  double? vitesseDmg;
  double? vitesseMax;
  double? fiveJumpTest;
  double? squatJump;
  double? agilite;


  Mesure(
  {
    this.id,
    this.date,
    this.poid,
    this.taille,
    this.IMC,
    this.FC,
    this.masseMuscle,
    this.masseGraisse,
    this.stresse,
    this.oxygene,
    this.tourTaille,
    this.tourHancher,
    this.VMA,
    this.LMD,
    this.cordination,
    this.vitesseDmg,
    this.vitesseMax,
    this.fiveJumpTest,
    this.squatJump,
    this.agilite
});

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Mesure && runtimeType == other.runtimeType && id == other.id;

  @override
  int get hashCode => id.hashCode;

  @override
  String toString() {
    return 'Mesure{id: $id, date: $date, poid: $poid, taille: $taille, IMC: $IMC, FC: $FC, masseMuscle: $masseMuscle, masseGraisse: $masseGraisse, stresse: $stresse, oxygene: $oxygene, tourTaille: $tourTaille, tourHancher: $tourHancher, VMA: $VMA, LMD: $LMD, cordination: $cordination, vitesseDmg: $vitesseDmg, vitesseMax: $vitesseMax, fiveJumpTest: $fiveJumpTest, squatJump: $squatJump, agilite: $agilite}';
  }

  Mesure copyWith({
    String? id,
    DateTime? date,
    double? poid,
    double? taille,
    double? IMC,
    int? FC,
    double? masseMuscle,
    double? masseGraisse,
    double? stresse,
    double? oxygene,
    double? tourTaille,
    double? tourHancher,
    double? VMA,
    double? LMD,
    int? cordination,
    double? vitesseDmg,
    double? vitesseMax,
    double? fiveJumpTest,
    double? squatJump,
    double? agilite,
  }) {
    return Mesure(
      id: id ?? this.id,
      date: date ?? this.date,
      poid: poid ?? this.poid,
      taille: taille ?? this.taille,
      IMC: IMC ?? this.IMC,
      FC: FC ?? this.FC,
      masseMuscle: masseMuscle ?? this.masseMuscle,
      masseGraisse: masseGraisse ?? this.masseGraisse,
      stresse: stresse ?? this.stresse,
      oxygene: oxygene ?? this.oxygene,
      tourTaille: tourTaille ?? this.tourTaille,
      tourHancher: tourHancher ?? this.tourHancher,
      VMA: VMA ?? this.VMA,
      LMD: LMD ?? this.LMD,
      cordination: cordination ?? this.cordination,
      vitesseDmg: vitesseDmg ?? this.vitesseDmg,
      vitesseMax: vitesseMax ?? this.vitesseMax,
      fiveJumpTest: fiveJumpTest ?? this.fiveJumpTest,
      squatJump: squatJump ?? this.squatJump,
      agilite: agilite ?? this.agilite,
    );
  }

  factory Mesure.fromMap(dynamic map) {
    var temp;
    return Mesure(
      id: map['id']?.toString(),
      date: null == (temp = map['date'])
          ? null
          : (temp is DateTime ? temp : DateTime.tryParse(temp)),
      poid: null == (temp = map['poid'])
          ? null
          : (temp is num ? temp.toDouble() : double.tryParse(temp)),
      taille: null == (temp = map['taille'])
          ? null
          : (temp is num ? temp.toDouble() : double.tryParse(temp)),
      IMC: null == (temp = map['IMC'])
          ? null
          : (temp is num ? temp.toDouble() : double.tryParse(temp)),
      FC: null == (temp = map['FC'])
          ? null
          : (temp is num ? temp.toInt() : int.tryParse(temp)),
      masseMuscle: null == (temp = map['masseMuscle'])
          ? null
          : (temp is num ? temp.toDouble() : double.tryParse(temp)),
      masseGraisse: null == (temp = map['masseGraisse'])
          ? null
          : (temp is num ? temp.toDouble() : double.tryParse(temp)),
      stresse: null == (temp = map['stresse'])
          ? null
          : (temp is num ? temp.toDouble() : double.tryParse(temp)),
      oxygene: null == (temp = map['oxygene'])
          ? null
          : (temp is num ? temp.toDouble() : double.tryParse(temp)),
      tourTaille: null == (temp = map['tourTaille'])
          ? null
          : (temp is num ? temp.toDouble() : double.tryParse(temp)),
      tourHancher: null == (temp = map['tourHancher'])
          ? null
          : (temp is num ? temp.toDouble() : double.tryParse(temp)),
      VMA: null == (temp = map['VMA'])
          ? null
          : (temp is num ? temp.toDouble() : double.tryParse(temp)),
      LMD: null == (temp = map['LMD'])
          ? null
          : (temp is num ? temp.toDouble() : double.tryParse(temp)),
      cordination: null == (temp = map['cordination'])
          ? null
          : (temp is num ? temp.toInt() : int.tryParse(temp)),
      vitesseDmg: null == (temp = map['vitesseDmg'])
          ? null
          : (temp is num ? temp.toDouble() : double.tryParse(temp)),
      vitesseMax: null == (temp = map['vitesseMax'])
          ? null
          : (temp is num ? temp.toDouble() : double.tryParse(temp)),
      fiveJumpTest: null == (temp = map['fiveJumpTest'])
          ? null
          : (temp is num ? temp.toDouble() : double.tryParse(temp)),
      squatJump: null == (temp = map['squatJump'])
          ? null
          : (temp is num ? temp.toDouble() : double.tryParse(temp)),
      agilite: null == (temp = map['agilite'])
          ? null
          : (temp is num ? temp.toDouble() : double.tryParse(temp)),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'date': date?.toString(),
      'poid': poid,
      'taille': taille,
      'IMC': IMC,
      'FC': FC,
      'masseMuscle': masseMuscle,
      'masseGraisse': masseGraisse,
      'stresse': stresse,
      'oxygene': oxygene,
      'tourTaille': tourTaille,
      'tourHancher': tourHancher,
      'VMA': VMA,
      'LMD': LMD,
      'cordination': cordination,
      'vitesseDmg': vitesseDmg,
      'vitesseMax': vitesseMax,
      'fiveJumpTest': fiveJumpTest,
      'squatJump': squatJump,
      'agilite': agilite,
    };
  }
}