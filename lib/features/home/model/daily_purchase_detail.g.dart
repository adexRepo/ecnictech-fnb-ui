// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'daily_purchase_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DailyPurchaseDetail _$DailyPurchaseDetailFromJson(Map<String, dynamic> json) =>
    DailyPurchaseDetail(
      itemName: json['itemName'] as String,
      quantity: json['quantity'] as String,
      type: json['type'] as String,
      price: (json['price'] as num).toDouble(),
      totalPrice: (json['totalPrice'] as num).toDouble(),
      createdDate: json['createdDate'] as String,
      createdBy: json['createdBy'] as String,
    );

Map<String, dynamic> _$DailyPurchaseDetailToJson(
        DailyPurchaseDetail instance) =>
    <String, dynamic>{
      'itemName': instance.itemName,
      'quantity': instance.quantity,
      'type': instance.type,
      'price': instance.price,
      'totalPrice': instance.totalPrice,
      'createdDate': instance.createdDate,
      'createdBy': instance.createdBy,
    };
