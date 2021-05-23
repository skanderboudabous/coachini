class TypeMorphologie{
  String? id;
  String? nom;
  DateTime? date;


  TypeMorphologie({this.id, this.nom,this.date});

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TypeMorphologie && runtimeType == other.runtimeType && id == other.id;

  @override
  int get hashCode => id.hashCode;

  factory TypeMorphologie.fromMap(dynamic map) {
    var temp;
    return TypeMorphologie(
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
