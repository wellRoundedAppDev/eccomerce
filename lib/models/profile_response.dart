// To parse this JSON data, do
//
//     final profileResponse = profileResponseFromJson(jsonString);

import 'dart:convert';

ProfileResponse profileResponseFromJson(String str) => ProfileResponse.fromJson(json.decode(str));

String profileResponseToJson(ProfileResponse data) => json.encode(data.toJson());

class ProfileResponse {
  ProfileResponse({
    required this.address,
    required this.id,
    required this.email,
    required this.username,
    required this.password,
    required this.name,
    required this.phone,
    required this.v,
  });

  Address address;
  int id;
  String email;
  String username;
  String password;
  Name name;
  String phone;
  int v;

  factory ProfileResponse.fromJson(Map<String, dynamic> json) => ProfileResponse(
    address: Address.fromJson(json["address"]),
    id: json["id"],
    email: json["email"],
    username: json["username"],
    password: json["password"],
    name: Name.fromJson(json["name"]),
    phone: json["phone"],
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "address": address.toJson(),
    "id": id,
    "email": email,
    "username": username,
    "password": password,
    "name": name.toJson(),
    "phone": phone,
    "__v": v,
  };
}

class Address {
  Address({
    required this.geolocation,
    required this.city,
    required this.street,
    required this.number,
    required this.zipcode,
  });

  Geolocation geolocation;
  String city;
  String street;
  int number;
  String zipcode;

  factory Address.fromJson(Map<String, dynamic> json) => Address(
    geolocation: Geolocation.fromJson(json["geolocation"]),
    city: json["city"],
    street: json["street"],
    number: json["number"],
    zipcode: json["zipcode"],
  );

  Map<String, dynamic> toJson() => {
    "geolocation": geolocation.toJson(),
    "city": city,
    "street": street,
    "number": number,
    "zipcode": zipcode,
  };
}

class Geolocation {
  Geolocation({
    required this.lat,
    required this.long,
  });

  String lat;
  String long;

  factory Geolocation.fromJson(Map<String, dynamic> json) => Geolocation(
    lat: json["lat"],
    long: json["long"],
  );

  Map<String, dynamic> toJson() => {
    "lat": lat,
    "long": long,
  };
}

class Name {
  Name({
    required this.firstname,
    required this.lastname,
  });

  String firstname;
  String lastname;

  factory Name.fromJson(Map<String, dynamic> json) => Name(
    firstname: json["firstname"],
    lastname: json["lastname"],
  );

  Map<String, dynamic> toJson() => {
    "firstname": firstname,
    "lastname": lastname,
  };
}
