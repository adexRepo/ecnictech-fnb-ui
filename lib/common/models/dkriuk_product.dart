import 'package:json_annotation/json_annotation.dart';

part 'dkriuk_product.g.dart';

@JsonSerializable()
class DkriukPrduct {
  final String id;
  final String name;
  final double price;
  final String description;

  DkriukPrduct(
      {required this.id,
      required this.name,
      required this.price,
      required this.description});

  factory DkriukPrduct.fromJson(Map<String, dynamic> json) =>
      _$DkriukPrductFromJson(json);

  Map<String, dynamic> toJson() => _$DkriukPrductToJson(this);
}
