class RM{
  String? id;
  String? name;
  DateTime? date;
  double? value;
  String? pictureUrl;

  RM({this.id, this.name, this.date, this.value, this.pictureUrl,});

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RM && runtimeType == other.runtimeType && id == other.id;

  @override
  int get hashCode => id.hashCode;


  @override
  String toString() {
    return 'RM{id: $id, name: $name, date: $date, value: $value}';
  }

  factory RM.fromMap(dynamic map) {
    var temp;
    return RM(
      id: map['id']?.toString(),
      name: map['name']?.toString(),
      date: null == (temp = map['date'])
          ? null
          : (temp is DateTime ? temp : DateTime.fromMillisecondsSinceEpoch(temp.millisecondsSinceEpoch)),
      pictureUrl: map['pictureUrl']?.toString(),
      value: null == (temp = map['value'])
          ? null
          : (temp is num ? temp.toDouble() : double.tryParse(temp)),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'pictureUrl': pictureUrl,
      'date': date?.toString(),
      'value': value,
    };
  }
}
