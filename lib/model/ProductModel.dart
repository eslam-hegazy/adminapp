// To parse this JSON data, do
//
//     final productModel = productModelFromJson(jsonString);

import 'dart:convert';

ProductModel productModelFromJson(String str) =>
    ProductModel.fromJson(json.decode(str));

String productModelToJson(ProductModel data) => json.encode(data.toJson());

class ProductModel {
  ProductModel({
    this.name,
    this.price,
    this.description,
    this.phone,
    this.photo,
    this.location,
    this.dataTime,
  });

  String name;
  String price;
  String description;
  String phone;
  String photo;
  String location;
  String dataTime;

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        name: json["name"],
        price: json["price"],
        description: json["description"],
        phone: json["phone"],
        photo: json["photo"],
        location: json["location"],
        dataTime: json["dataTime"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "price": price,
        "description": description,
        "phone": phone,
        "photo": photo,
        "location": location,
        "dataTime": dataTime,
      };
}
