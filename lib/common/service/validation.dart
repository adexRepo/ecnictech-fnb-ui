import 'package:flutter/foundation.dart';
import 'package:ecnictech_fnb_ui/common/service/api_response.dart';

class Validation {
  static bool isEmailValid(String email) {
    return RegExp(r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$')
        .hasMatch(email);
  }

  static bool isPasswordValid(String password) {
    return RegExp(r'^(?=.{6,})').hasMatch(password);
  }

  static void printLog(dynamic data) {
    if (kDebugMode) {
      print("[Custom Log]");
      print(data);
    }
  }

  static bool isError(ApiResponse<dynamic> apiResponse) {
    if (apiResponse.errorResponse != null) {
      printLog(apiResponse.errorResponse!.description);
      return true;
    }

    return false;
  }
}
