
class Adherant {
  String? email;
  String? id;
  String? firstName;
  String? lastName;
  DateTime? birthday;
  bool? isSubscribed;
  bool? isAdmin;
  String? sexe;
  String? phone;
  String? pictureUrl;
  List<dynamic>? suiviMentale=[];

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
      this.isAdmin,
      this.isSubscribed,
      this.pictureUrl,
        this.suiviMentale
});

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Adherant && runtimeType == other.runtimeType && id == other.id;

  @override
  int get hashCode => id.hashCode;

  factory Adherant.fromMap(Map<String,dynamic>? map) {
    var temp;
    return Adherant(
      email: map!['email']?.toString(),
      id: map['id']?.toString(),
      isAdmin: map['isAdmin'],
      isSubscribed: map['isSubscribed'],
      pictureUrl: map['pictureUrl'],
      firstName: map['firstName']?.toString(),
      lastName: map['lastName']?.toString(),
      birthday: null == (temp = map['birthday'])
          ? null
          : (temp is DateTime ? temp : DateTime.fromMillisecondsSinceEpoch(temp.millisecondsSinceEpoch)),
      sexe: map['sexe']?.toString(),
      phone: map['phone']?.toString(),
        suiviMentale: map.containsKey("suiviMentale")? map['suiviMentale'] : null
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'id': id,
      'firstName': firstName,
      'lastName': lastName,
      'birthday': birthday,
      'sexe': sexe,
      'pictureUrl': pictureUrl,
      'phone': phone,
      'isAdmin': isAdmin,
      'isSubscribed':isSubscribed,
      'suiviMentale':suiviMentale??null
    };
  }
}
