import 'package:json_annotation/json_annotation.dart';
import 'package:ecnictech_fnb_ui/core/error/error_response.dart';

part 'api_response.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class ApiResponse<T> {
  final String? status;
  final T? response;
  final List<T>? responseList;
  final ErrorResponse? errorResponse;

  ApiResponse({
    this.status,
    this.response,
    this.responseList = const [], // Default empty list
    this.errorResponse,
  });

  factory ApiResponse.fromJson(
          Map<String, dynamic> json, T Function(Object? json) fromJsonT) =>
      _$ApiResponseFromJson(json, fromJsonT);

  Map<String, dynamic> toJson(Object? Function(T value) toJsonT) =>
      _$ApiResponseToJson(this, toJsonT);
}
