class Muscle{
    String? id;
    String? name;

    Muscle({this.id, this.name});


    @override
  String toString() {
    return 'Muscle{id: $id, name: $name}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Muscle && runtimeType == other.runtimeType && id == other.id;

  @override
  int get hashCode => id.hashCode;

    factory Muscle.fromMap(dynamic map) {
    var temp;
    return Muscle(
      id: map['id']?.toString(),
      name: map['name']?.toString(),
    );
  }

    Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
    };
  }
}