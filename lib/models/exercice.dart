class Exercice {
  String? id;
  String? nom;
  String? ImageLink;
  int? nbSerie;
  int? nbRep;
  int? repo;
  bool? isDone;
  DateTime? dateLim;

  Exercice(
      {this.id,
      this.nom,
      this.ImageLink,
      this.nbSerie,
      this.nbRep,
      this.repo,
      this.isDone,
      this.dateLim});

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Exercice && runtimeType == other.runtimeType && id == other.id;

  @override
  int get hashCode => id.hashCode;

  factory Exercice.fromMap(dynamic map) {
    var temp;
    return Exercice(
      id: map['id']?.toString(),
      nom: map['nom']?.toString(),
      nbSerie: null == (temp = map['nbSerie'])
          ? null
          : (temp is num ? temp.toInt() : int.tryParse(temp)),
      nbRep: null == (temp = map['nbRep'])
          ? null
          : (temp is num ? temp.toInt() : int.tryParse(temp)),
      repo: null == (temp = map['repo'])
          ? null
          : (temp is num ? temp.toInt() : int.tryParse(temp)),
      isDone: map['isDone'],
      dateLim: null == (temp = map['dateLim'])
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
      'nom': nom,
      'ImageLink': ImageLink,
      'nbSerie': nbSerie,
      'nbRep': nbRep,
      'repo': repo,
      'isDone': isDone,
      'dateLim': dateLim
    };
  }

  @override
  String toString() {
    return 'Exercice{id: $id, nom: $nom,ImageLink: $ImageLink, nbSerie: $nbSerie, nbRep: $nbRep, repo: $repo,isDone :$isDone,dateLim: $dateLim}';
  }
}
