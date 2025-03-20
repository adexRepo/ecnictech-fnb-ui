import 'package:ecnictech_fnb_ui/features/home/model/daily_sales_detail.dart';
import 'package:json_annotation/json_annotation.dart';

part 'daily_sales.g.dart';

@JsonSerializable()
class DailySales {
  final double totalSales;
  final double totalLoss;
  final double totalFee;
  final String createdDate;
  final String createdBy;

  List<DailySalesDetail> details = [];

  DailySales(
      {required this.totalSales,
      required this.totalLoss,
      required this.totalFee,
      required this.createdDate,
      required this.createdBy});

  factory DailySales.fromJson(Map<String, dynamic> json) =>
      _$DailySalesFromJson(json);

  Map<String, dynamic> toJson() => _$DailySalesToJson(this);
}
