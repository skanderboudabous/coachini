class Adherant {
  String? email;
  String? id;
  String? firstName;
  String? lastName;
  DateTime? birthday;
  bool? isAdmin;
  String? sexe;
  String? phone;
  List<dynamic>? exercices;
  List<dynamic>? objectifs;
  List<dynamic>? mesures;
  List<dynamic>? rms;

  String? fullName() {
    return firstName! + " " + lastName!;
  }

  Adherant(
      {this.email,
      this.id,
      this.firstName,
      this.lastName,
      this.birthday,
      this.sexe,
      this.phone,
      this.exercices,
      this.objectifs,
      this.mesures,
      this.rms,
      this.isAdmin});

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Adherant && runtimeType == other.runtimeType && id == other.id;

  @override
  int get hashCode => id.hashCode;

  factory Adherant.fromMap(dynamic map) {
    var temp;
    return Adherant(
      email: map['email']?.toString(),
      id: map['id']?.toString(),
      isAdmin: map['isAdmin'],
      firstName: map['firstName']?.toString(),
      lastName: map['lastName']?.toString(),
      birthday: null == (temp = map['birthday'])
          ? null
          : (temp is DateTime ? temp : DateTime.tryParse(temp)),
      sexe: map['sexe']?.toString(),
      phone: map['phone']?.toString(),
      exercices: null == (temp = map['exercices'])
          ? []
          : (temp is List ? temp.map((map) => map).toList() : []),
      objectifs: null == (temp = map['objectifs'])
          ? []
          : (temp is List ? temp.map((map) => map).toList() : []),
      mesures: null == (temp = map['mesures'])
          ? []
          : (temp is List ? temp.map((map) => map).toList() : []),
      rms: null == (temp = map['rms'])
          ? []
          : (temp is List ? temp.map((map) => map).toList() : []),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'id': id,
      'firstName': firstName,
      'lastName': lastName,
      'birthday': birthday?.toString(),
      'sexe': sexe,
      'phone': phone,
      'exercices': exercices,
      'objectifs': objectifs,
      'mesures': mesures,
      'rms': rms,
    };
  }
}
