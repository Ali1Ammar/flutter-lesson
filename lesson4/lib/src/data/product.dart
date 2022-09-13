import 'package:json_annotation/json_annotation.dart';

part "product.g.dart";

@JsonSerializable()
class Product {
  final int id;
  final String title;
  final double price;
  // @JsonKey(name: "description")
  final String description;
  final String category;
  final String image;
  final Rate rating;
  Product(this.id, this.title, this.price, this.description, this.category,
      this.image, this.rating);

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);
  Map<String, dynamic> toJson() => _$ProductToJson(this);
}

@JsonSerializable()
class Rate {
  final double rate;
  final int count;
  Rate(this.rate, this.count);

  factory Rate.fromJson(Map<String, dynamic> json) => _$RateFromJson(json);
  Map<String, dynamic> toJson() => _$RateToJson(this);
}
