// To parse this JSON data, do
//
//     final userCartResponse = userCartResponseFromJson(jsonString);

import 'dart:convert';

List<UserCartResponse> userCartResponseFromJson(String str) => List<UserCartResponse>.from(json.decode(str).map((x) => UserCartResponse.fromJson(x)));

String userCartResponseToJson(List<UserCartResponse> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UserCartResponse {
  UserCartResponse({
    required this.id,
    required this.userId,
    required this.date,
    required this.products,
    required this.v,
  });

  int id;
  int userId;
  DateTime date;
  List<Product> products;
  int v;

  factory UserCartResponse.fromJson(Map<String, dynamic> json) => UserCartResponse(
    id: json["id"],
    userId: json["userId"],
    date: DateTime.parse(json["date"]),
    products: List<Product>.from(json["products"].map((x) => Product.fromJson(x))),
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "userId": userId,
    "date": date.toIso8601String(),
    "products": List<dynamic>.from(products.map((x) => x.toJson())),
    "__v": v,
  };
}

class Product {
  Product({
    required this.productId,
    required this.quantity,
  });

  int productId;
  int quantity;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    productId: json["productId"],
    quantity: json["quantity"],
  );

  Map<String, dynamic> toJson() => {
    "productId": productId,
    "quantity": quantity,
  };
}
