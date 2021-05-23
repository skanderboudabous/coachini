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
  int? repMaxPompe;
  int? repMaxAbd;
  double? tempsLimiteGain;
  double? tempsLimiteGainSquat;
  int? RPE;
  double? souplesse;
  int? counterMvtJump;
  int? dropJump;
  double? vo2Max;
  int? test6MinMarche;

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
    this.agilite,
    this.repMaxPompe,
    this.repMaxAbd,
    this.tempsLimiteGain,
    this.tempsLimiteGainSquat,
    this.RPE,
    this.souplesse,
    this.counterMvtJump,
    this.dropJump,
    this.vo2Max,
    this.test6MinMarche});

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Mesure && runtimeType == other.runtimeType && id == other.id;

  @override
  int get hashCode => id.hashCode;


  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'date': date,
      'taille': taille,
      'FC': FC,
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
      'repMaxPompe': repMaxPompe,
      'repMaxAbd': repMaxAbd,
      'tempsLimiteGain': tempsLimiteGain,
      'tempsLimiteGainSquat': tempsLimiteGainSquat,
      'RPE' : RPE,
      'souplesse': souplesse,
      'counterMvtJump':counterMvtJump,
      'dropJump':dropJump,
      'vo2Max':vo2Max,
      'test6MinMarche':test6MinMarche


    };
  }

  factory Mesure.fromMap(dynamic map) {
    var temp;
    return Mesure(
      id: map['id']?.toString(),
      date: null == (temp = map['date'])
          ? null
          : (temp is DateTime ? temp : DateTime.fromMillisecondsSinceEpoch(temp.millisecondsSinceEpoch)),
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
      repMaxPompe: null == (temp = map['repMaxPompe'])
          ? null
          : (temp is num ? temp.toInt() : int.tryParse(temp)),
      repMaxAbd: null == (temp = map['repMaxAbd'])
          ? null
          : (temp is num ? temp.toInt() : int.tryParse(temp)),
      tempsLimiteGain: null == (temp = map['tempsLimiteGain'])
          ? null
          : (temp is num ? temp.toDouble() : double.tryParse(temp)),
      tempsLimiteGainSquat: null == (temp = map['tempsLimiteGainSquat'])
          ? null
          : (temp is num ? temp.toDouble() : double.tryParse(temp)),
      RPE: null == (temp = map['RPE'])
          ? null
          : (temp is num ? temp.toInt() : int.tryParse(temp)),
      souplesse: null == (temp = map['souplesse'])
          ? null
          : (temp is num ? temp.toDouble() : double.tryParse(temp)),
      counterMvtJump: null == (temp = map['counterMvtJump'])
          ? null
          : (temp is num ? temp.toInt() : int.tryParse(temp)),
      dropJump: null == (temp = map['dropJump'])
          ? null
          : (temp is num ? temp.toInt() : int.tryParse(temp)),
      vo2Max: null == (temp = map['vo2Max'])
          ? null
          : (temp is num ? temp.toDouble() : double.tryParse(temp)),
      test6MinMarche: null == (temp = map['test6MinMarche'])
          ? null
          : (temp is num ? temp.toInt() : int.tryParse(temp)),

    );
  }
}
