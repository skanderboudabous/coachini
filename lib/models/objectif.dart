class Objectif{
  String? id;
  String? nom;
  DateTime? date;


  Objectif({this.id, this.nom,this.date});

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Objectif && runtimeType == other.runtimeType && id == other.id;

  @override
  int get hashCode => id.hashCode;

  factory Objectif.fromMap(dynamic map) {
    var temp;
    return Objectif(
      id: map['id']?.toString(),
      nom: map['nom']?.toString(),
      date: null == (temp = map['date'])
          ? null
          : (temp is DateTime ? temp : DateTime.tryParse(temp)),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nom': nom,
      'date':date?.toString(),
    };
  }
}
