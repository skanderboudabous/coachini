class Mesure{
  String? id;
  DateTime? date;
  double? taille;//20
  double? tourTaille;//15
  double? tourHanche;//15
  double? VMA;//2
  double? LMD;//2
  int? cordination;//5
  double? vitesseDmg;//500
  double? vitesseMax;//3
  double? fiveJumpTest;//2
  double? squatJump;//10
  double? agilite;//2
  int? repMaxPompe;//20
  int? repMaxAbd;//70
  double? tempsLimiteGain;//2
  double? tempsLimiteGainSquat;//2
  double? souplesse;//4
  int? counterMvtJump;//10
  int? dropJump;//10
  double? vo2Max;//10
  int? test6MinMarche;//100

  Mesure(
  {
    this.id,
    this.date,
    this.taille,
    this.tourTaille,
    this.tourHanche,
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
      'tourTaille': tourTaille,
      'tourHanche': tourHanche,
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
      taille: null == (temp = map['taille'])
          ? null
          : (temp is num ? temp.toDouble() : double.tryParse(temp)),
      tourTaille: null == (temp = map['tourTaille'])
          ? null
          : (temp is num ? temp.toDouble() : double.tryParse(temp)),
      tourHanche: null == (temp = map['tourHanche'])
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
