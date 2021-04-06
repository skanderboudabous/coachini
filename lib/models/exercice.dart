import 'package:cloud_firestore/cloud_firestore.dart';

class Exercice{
  String? id;
  String? nom;
  int? nbSerie;
  int? nbRep;
  int? repo;
  DocumentReference? muscle;

  Exercice(
      {this.id, this.nom, this.nbSerie, this.nbRep, this.repo, this.muscle});

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
      muscle: map['muscle'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nom': nom,
      'nbSerie': nbSerie,
      'nbRep': nbRep,
      'repo': repo,
      'muscle': muscle,
    };
  }

  @override
  String toString() {
    return 'Exercice{id: $id, nom: $nom, nbSerie: $nbSerie, nbRep: $nbRep, repo: $repo, muscle: $muscle}';
  }
}