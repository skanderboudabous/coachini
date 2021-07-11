class SuiviEntrainement{
  String? id;
  DateTime? date;
  int? duree_totale_seance;//10
  int? rythme_cardiaque_moy;//20
  double? vitesse_moyenne;//1.5
  int? nombre_pas;//1000
  int? distance_parcourue;//2
  int? nb_calorie_brule;//100
  double? allureMoy;//10
  int? cadenceMoy;//10
  int? longuerMoyPas;//20
  int? FC;//20
  int? FCmax;//20
  double? stresse;//10
  double? oxygene;//10
  int? RPE;//1


  SuiviEntrainement(
      {this.id,
        this.date,
        this.duree_totale_seance,
        this.rythme_cardiaque_moy,
        this.vitesse_moyenne,
        this.nombre_pas,
        this.distance_parcourue,
        this.nb_calorie_brule,
        this.allureMoy,
        this.cadenceMoy,
        this.longuerMoyPas,
        this.FC,
        this.FCmax,
        this.stresse,
        this.oxygene,
        this.RPE,});

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is SuiviEntrainement &&
              runtimeType == other.runtimeType &&
              id == other.id;

  @override
  int get hashCode => id.hashCode;

  factory SuiviEntrainement.fromMap(dynamic map) {
    var temp;
    return SuiviEntrainement(
      id: map['id']?.toString(),
      date: null == (temp = map['date'])
          ? null
          : (temp is DateTime ? temp :  DateTime.fromMillisecondsSinceEpoch(temp.millisecondsSinceEpoch)),
      duree_totale_seance: null == (temp = map['duree_totale_seance'])
          ? null
          : (temp is num ? temp.toInt() : int.tryParse(temp)),
      rythme_cardiaque_moy: null == (temp = map['rythme_cardiaque_moy'])
          ? null
          : (temp is num ? temp.toInt() : int.tryParse(temp)),
      vitesse_moyenne: null == (temp = map['vitesse_moyenne'])
          ? null
          : (temp is num ? temp.toDouble() : double.tryParse(temp)),
      nombre_pas: null == (temp = map['nombre_pas'])
          ? null
          : (temp is num ? temp.toInt() : int.tryParse(temp)),
      distance_parcourue: null == (temp = map['distance_parcourue'])
          ? null
          : (temp is num ? temp.toInt() : int.tryParse(temp)),
      nb_calorie_brule: null == (temp = map['nb_calorie_brule'])
          ? null
          : (temp is num ? temp.toInt() : int.tryParse(temp)),
        allureMoy: null == (temp = map['allureMoy'])
            ? null
            : (temp is num ? temp.toDouble() : double.tryParse(temp)),
      cadenceMoy: null == (temp = map['cadenceMoy'])
          ? null
          : (temp is num ? temp.toInt() : int.tryParse(temp)),
      longuerMoyPas: null == (temp = map['longuerMoyPas'])
          ? null
          : (temp is num ? temp.toInt() : int.tryParse(temp)),
      FC: null == (temp = map['FC'])
          ? null
          : (temp is num ? temp.toInt() : int.tryParse(temp)),
      FCmax: null == (temp = map['FCmax'])
          ? null
          : (temp is num ? temp.toInt() : int.tryParse(temp)),
      stresse: null == (temp = map['stresse'])
          ? null
          : (temp is num ? temp.toDouble() : double.tryParse(temp)),
      oxygene: null == (temp = map['oxygene'])
          ? null
          : (temp is num ? temp.toDouble() : double.tryParse(temp)),

      RPE: null == (temp = map['RPE'])
          ? null
          : (temp is num ? temp.toInt() : int.tryParse(temp)),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'duree_totale_seance': duree_totale_seance,
      'rythme_cardiaque_moy': rythme_cardiaque_moy,
      'vitesse_moyenne': vitesse_moyenne,
      'nombre_pas': nombre_pas,
      'date': date,
      'distance_parcourue': distance_parcourue,
      'nb_calorie_brule': nb_calorie_brule,
      'allureMoy': allureMoy,
      'cadenceMoy':cadenceMoy,
      'longuerMoyPas':longuerMoyPas,
      'FC': FC,
      'FCmax': FCmax,
      'stresse': stresse,
      'oxygene': oxygene,
      'RPE' : RPE,
    };
  }


}
