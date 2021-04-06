class Objectif{
  String? id;
  String? nom;

  Objectif({this.id, this.nom});

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
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nom': nom,
    };
  }
}