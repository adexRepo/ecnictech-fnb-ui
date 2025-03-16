import 'package:ecnictech_fnb_ui/common/service/api_response.dart';
import 'package:ecnictech_fnb_ui/common/service/secure_http_request.dart';
import 'package:ecnictech_fnb_ui/constant/data_user.dart';
import 'package:ecnictech_fnb_ui/core/error/exceptions.dart';
import 'package:ecnictech_fnb_ui/features/auth/models/user_credential.dart';

abstract class AuthenticationRemoteDataSource {
  Future<ApiResponse<UserCredential>> logIn(String username, String password);

  Future<void> logOut();
}

class AuthenticationRemoteDataSourceImpl
    implements AuthenticationRemoteDataSource {
  AuthenticationRemoteDataSourceImpl({required this.secureHttpRequest});

  final SecureHttpRequest secureHttpRequest;

  @override
  Future<ApiResponse<UserCredential>> logIn(
      String username, String password) async {
    for (var element in DataUsers.dataUser) {
      if (element.userInfo!.username == username &&
          element.userInfo!.password == password) {
        return ApiResponse<UserCredential>(response: element);
      }
    }

    throw ServerException("User not found");

    // const String endpoint = "/api/v1/users/auth/login";
    // Uri uri = Uri.parse(endpoint).replace(
    //   queryParameters: {
    //     'username': username,
    //     'password': password,
    //   },
    // );

    // final baseUrl = dotenv.env['BASE_URL_SVC']!;

    // try {
    //   final Map<String, dynamic> response = await secureHttpRequest
    //       .secureHttpRequest(baseUrl + uri.toString(), HttpMethod.get);

    //   if (kDebugMode) {
    //     print("Response: $response");
    //   }

    //   ApiResponse<UserCredential> apiResponse =
    //       ApiResponse<UserCredential>.fromJson(response,
    //           (json) => UserCredential.fromJson(json as Map<String, dynamic>));

    //   if (Validation.isError(apiResponse)) {
    //     throw ServerException(apiResponse.errorResponse!.description);
    //   }
    //   return apiResponse;
    // } catch (e) {
    //   if (kDebugMode) {
    //     print("Error: $e");
    //   }

    //   throw Exception('Failed to login: $e');
    // }
  }

  @override
  Future<void> logOut() {
    throw UnimplementedError();
  }
}
