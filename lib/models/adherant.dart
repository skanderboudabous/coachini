import 'dart:convert';

class Adherant {
  String? email;
  String? id;
  String? firstName;
  String? lastName;
  DateTime? birthday;
  String? sexe;

  String? phone;

  String? fullName() {
    return firstName! + " " + lastName!;
  }

  Adherant({
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.birthday,
    required this.sexe,
    this.id,
    this.phone,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Adherant &&
          runtimeType == other.runtimeType &&
          id == other.id;

  @override
  int get hashCode => id.hashCode;

  @override
  String toString() {
    return 'Adherant{email: $email, userId: $id, firstName: $firstName, lastName: $lastName, birthday: $birthday, sexe: $sexe, phone: $phone}';
  }

  Adherant copyWith({
    String? email,
    String? userId,
    String? firstName,
    String? lastName,
    DateTime? birthday,
    String? sexe,
    String? phone,
  }) {
    return Adherant(
      email: email ?? this.email,
      id: userId ?? this.id,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      birthday: birthday ?? this.birthday,
      sexe: sexe ?? this.sexe,
      phone: phone ?? this.phone,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'userId': id,
      'firstName': firstName,
      'lastName': lastName,
      'birthday': birthday?.toString(),
      'sexe': sexe,
      'phone': phone,
    };
  }

  factory Adherant.fromMap(dynamic map) {
    var temp;
    return Adherant(
      email: map['email']?.toString(),
      id: map['userId']?.toString(),
      firstName: map['firstName']?.toString(),
      lastName: map['lastName']?.toString(),
      birthday: null == (temp = map['birthday'])
          ? null
          : (temp is DateTime ? temp : DateTime.tryParse(temp)),
      sexe: map['sexe']?.toString(),
      phone: map['phone']?.toString(),
    );
  }
}
