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
  
  String toJSON() => json.encode(toMap());
}
