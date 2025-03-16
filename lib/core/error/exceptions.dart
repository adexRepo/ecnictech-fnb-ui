import 'package:flutter/foundation.dart';

class ServerException implements Exception {
  final String message;
  ServerException(this.message) {
    if (kDebugMode) {
      print("ServerException: $message");
    }
  }
}
