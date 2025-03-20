// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'daily_purchase.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DailyPurchase _$DailyPurchaseFromJson(Map<String, dynamic> json) =>
    DailyPurchase(
      totalItem: (json['totalItem'] as num).toInt(),
      totalPurcased: (json['totalPurcased'] as num).toDouble(),
      createdDate: json['createdDate'] as String,
      createdBy: json['createdBy'] as String,
    )..details = (json['details'] as List<dynamic>)
        .map((e) => DailyPurchaseDetail.fromJson(e as Map<String, dynamic>))
        .toList();

Map<String, dynamic> _$DailyPurchaseToJson(DailyPurchase instance) =>
    <String, dynamic>{
      'totalItem': instance.totalItem,
      'totalPurcased': instance.totalPurcased,
      'createdDate': instance.createdDate,
      'createdBy': instance.createdBy,
      'details': instance.details,
    };
