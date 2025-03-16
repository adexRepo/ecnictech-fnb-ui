import 'package:json_annotation/json_annotation.dart';

part 'error_response.g.dart';

@JsonSerializable()
class ErrorResponse {
  final String code;
  final String description;
  final dynamic errorInfo;

  factory ErrorResponse.fromJson(Map<String, dynamic> json) =>
      _$ErrorResponseFromJson(json);

  ErrorResponse(
      {required this.code, required this.description, required this.errorInfo});

  Map<String, dynamic> toJson() => _$ErrorResponseToJson(this);
}
