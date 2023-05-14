class User {
  User({
    required this.age,
    required this.gender,
    required this.id,
    required this.nationality,
    required this.passport,
    required this.name,
  });

  num age;
  num passport;
  String id;
  String nationality;
  String gender;
  String name;

  factory User.fromJson(Map<String, dynamic> json) => User(
        age: json['age'],
        id: json['id'],
        passport: json['passport'],
        nationality: json['nationality'],
        gender: json['gender'],
        name: json['name'],
      );
}