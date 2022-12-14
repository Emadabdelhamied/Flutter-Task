import 'dart:convert';

import '../../domain/entities/product_entity.dart';

List<ProductModel> productModelFromJson(String str) => List<ProductModel>.from(
    json.decode(str).map((x) => ProductModel.fromJson(x)));
String productModelToJson(List<ProductModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProductModel extends ProductEntity {
  ProductModel(
      {required super.id,
      required super.title,
      required super.price,
      required super.description,
      required super.image,
      required super.address});

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
      id: json["id"],
      title: json["title"],
      price: json["price"].toDouble(),
      description: json["description"],
      image: json["image"],
      address: json["address"]);
  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "price": price,
        "description": description,
        "address": address,
        "image": image,
      };
}
