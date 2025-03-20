// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'daily_sales_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DailySalesDetail _$DailySalesDetailFromJson(Map<String, dynamic> json) =>
    DailySalesDetail(
      product: json['product'] as String,
      quantity: (json['quantity'] as num).toInt(),
      price: (json['price'] as num).toDouble(),
      totalPrice: (json['totalPrice'] as num).toDouble(),
      status: json['status'] as String,
      createdDate: json['createdDate'] as String,
      createdBy: json['createdBy'] as String,
    );

Map<String, dynamic> _$DailySalesDetailToJson(DailySalesDetail instance) =>
    <String, dynamic>{
      'product': instance.product,
      'quantity': instance.quantity,
      'price': instance.price,
      'totalPrice': instance.totalPrice,
      'status': instance.status,
      'createdDate': instance.createdDate,
      'createdBy': instance.createdBy,
    };
