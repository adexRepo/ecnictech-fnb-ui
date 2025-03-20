import 'package:json_annotation/json_annotation.dart';

part 'daily_sales_detail.g.dart';

@JsonSerializable()
class DailySalesDetail {
  final String product;
  final int quantity;
  final double price;
  final double totalPrice;
  final String status;
  final String createdDate;
  final String createdBy;

  DailySalesDetail(
      {required this.product,
      required this.quantity,
      required this.price,
      required this.totalPrice,
      required this.status,
      required this.createdDate,
      required this.createdBy});
}
