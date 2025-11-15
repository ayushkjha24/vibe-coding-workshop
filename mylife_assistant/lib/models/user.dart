class User {
  int? id;
  String? name;
  String? email;

  User({this.id, this.name, this.email});

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'id': id,
      'name': name,
      'email': email,
    };
    return map;
  }

  User.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    name = map['name'];
    email = map['email'];
  }
}
