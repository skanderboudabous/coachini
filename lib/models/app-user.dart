import 'dart:convert';

class AppUser {
  String? email;
  String? userId;
  String? firstName;
  String? lastName;
  String? phone;
  String? fullName(){return firstName!+" "+lastName!;}

  AppUser({
    required this.email,
    required this.firstName,
    required this.lastName,
    this.userId,
    this.phone,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          (other is AppUser &&
              runtimeType == other.runtimeType &&
              email == other.email &&
              userId == other.userId &&
              firstName == other.firstName &&
              lastName == other.lastName &&
              phone == other.phone);

  @override
  int get hashCode =>
      email.hashCode ^
      userId.hashCode ^
      firstName.hashCode ^
      lastName.hashCode ^
      phone.hashCode;

  @override
  String toString() {
    return 'AppUser{' +
        ' email: $email,' +
        ' userId: $userId,' +
        ' firstName: $firstName,' +
        ' lastName: $lastName,' +
        ' phone: $phone,' +
        '}';
  }

  AppUser copyWith({
     required String email,
    required String firstName,
    required String lastName,
    required String userId,
    String? phone,
  }) {
    return new AppUser(
      email: email,
      firstName: firstName,
      userId:userId,
      lastName: lastName,
      phone: phone
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'email': this.email,
      'firstName': this.firstName,
      'userId':this.userId,
      'lastName': this.lastName,
      'phone': this.phone,
    };
  }

  static fromMap(Map<String, dynamic>? map) {
    return new AppUser(
      email: map?['email'],
      firstName: map?['firstName'],
      lastName: map?['lastName'],
      userId:map?['userId'],
      phone: map?['phone'],
    );
  }

  String toJson() => json.encode(toMap());

  static AppUser fromJson(String source) => fromMap(json.decode(source));
}
