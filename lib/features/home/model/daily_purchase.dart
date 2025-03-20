import 'package:ecnictech_fnb_ui/features/home/model/daily_purchase_detail.dart';
import 'package:json_annotation/json_annotation.dart';

part 'daily_purchase.g.dart';

@JsonSerializable()
class DailyPurchase {
  final int totalItem;
  final double totalPurcased;
  final String createdDate;
  final String createdBy;

  List<DailyPurchaseDetail> details = [];

  DailyPurchase(
      {required this.totalItem,
      required this.totalPurcased,
      required this.createdDate,
      required this.createdBy});

  factory DailyPurchase.fromJson(Map<String, dynamic> json) =>
      _$DailyPurchaseFromJson(json);

  Map<String, dynamic> toJson() => _$DailyPurchaseToJson(this);
}
