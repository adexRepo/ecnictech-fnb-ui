import 'package:json_annotation/json_annotation.dart';

part 'daily_purchase_detail.g.dart';

@JsonSerializable()
class DailyPurchaseDetail {
  final String itemName;
  final String quantity;
  final String type;
  final double price;
  final double totalPrice;
  final String createdDate;
  final String createdBy;

  DailyPurchaseDetail(
      {required this.itemName,
      required this.quantity,
      required this.type,
      required this.price,
      required this.totalPrice,
      required this.createdDate,
      required this.createdBy});

  factory DailyPurchaseDetail.fromJson(Map<String, dynamic> json) =>
      _$DailyPurchaseDetailFromJson(json);

  Map<String, dynamic> toJson() => _$DailyPurchaseDetailToJson(this);
}
