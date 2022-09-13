// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Product _$ProductFromJson(Map<String, dynamic> json) => Product(
      json['id'] as int,
      json['title'] as String,
      (json['price'] as num).toDouble(),
      json['description'] as String,
      json['category'] as String,
      json['image'] as String,
      Rate.fromJson(json['rating'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'price': instance.price,
      'description': instance.description,
      'category': instance.category,
      'image': instance.image,
      'rating': instance.rating,
    };

Rate _$RateFromJson(Map<String, dynamic> json) => Rate(
      (json['rate'] as num).toDouble(),
      json['count'] as int,
    );

Map<String, dynamic> _$RateToJson(Rate instance) => <String, dynamic>{
      'rate': instance.rate,
      'count': instance.count,
    };
