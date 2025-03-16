// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dkriuk_product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DkriukPrduct _$DkriukPrductFromJson(Map<String, dynamic> json) => DkriukPrduct(
      id: json['id'] as String,
      name: json['name'] as String,
      price: (json['price'] as num).toDouble(),
      description: json['description'] as String,
    );

Map<String, dynamic> _$DkriukPrductToJson(DkriukPrduct instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'price': instance.price,
      'description': instance.description,
    };
