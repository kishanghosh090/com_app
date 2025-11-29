import 'dart:convert';

class User {
  final String id;
  final String fullName;
  final String email;
  final String state;
  final String city;
  final String locality;
  final String password;

  User({
    required this.id,
    required this.fullName,
    required this.email,
    required this.state,
    required this.city,
    required this.locality,
    required this.password,
  });

  // serialization : convert user object to a Map

  // MAP is a collection of key value pair
  // why : converitng to a map is an intermidiate state that makes it easier to to serialize the objct to formates like JSON for storage or transmission

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      "id": id,
      "fullName": fullName,
      "email": email,
      "state": state,
      "city": city,
      "locality": locality,
      "password": password,
    };
  }

  // serialization: convert map to a JSON String
  // this method directly encodes the data from the Map  into JSON String

  // json.encode function convert a Dart object (such as map or list) into a json string representation , making it suitable for comunitation between different system
  // encode
  String toJSON() => json.encode(toMap());

  // desirialization convert a Map to a User Object
  // purpose manipulation and use: Once a data is converted to a User Object it can be easily manipulated withen the application. For example we might want to displat the user's fullname , email, on the UI we want to save data locally

  // the factory constructor takes a Map(usually obtaind form a json object)
  // and convert it into a user object . if field is not present in the map,
  // ot default to an empty string

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['_id'] as String? ?? "",
      fullName: map['fullName'] as String? ?? "",
      email: map['email'] as String? ?? "",
      state: map['state'] as String? ?? "",
      city: map['city'] as String? ?? "",
      locality: map['locality'] as String? ?? "",
      password: map['password'] as String? ?? "",
    );
  }
}
