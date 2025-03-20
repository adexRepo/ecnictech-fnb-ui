// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'daily_sales.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DailySales _$DailySalesFromJson(Map<String, dynamic> json) => DailySales(
      totalSales: (json['totalSales'] as num).toDouble(),
      totalLoss: (json['totalLoss'] as num).toDouble(),
      totalFee: (json['totalFee'] as num).toDouble(),
      createdDate: json['createdDate'] as String,
      createdBy: json['createdBy'] as String,
    )..details = (json['details'] as List<dynamic>)
        .map((e) => DailySalesDetail.fromJson(e as Map<String, dynamic>))
        .toList();

Map<String, dynamic> _$DailySalesToJson(DailySales instance) =>
    <String, dynamic>{
      'totalSales': instance.totalSales,
      'totalLoss': instance.totalLoss,
      'totalFee': instance.totalFee,
      'createdDate': instance.createdDate,
      'createdBy': instance.createdBy,
      'details': instance.details,
    };
