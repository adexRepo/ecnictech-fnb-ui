import 'package:dartz/dartz.dart';
import 'package:ecnictech_fnb_ui/app/initialize_container.dart';
import 'package:ecnictech_fnb_ui/common/service/api_response.dart';
import 'package:ecnictech_fnb_ui/core/error/exceptions.dart';
import 'package:ecnictech_fnb_ui/core/error/failures.dart';
import 'package:ecnictech_fnb_ui/features/auth/datasource/authentication_remote_datasource.dart';
import 'package:hive/hive.dart';
import 'package:ecnictech_fnb_ui/features/auth/models/user_credential.dart';

abstract class AuthenticationRepository {
  Future<Either<Failure, UserCredential>> logIn(
      String username, String password);
  Future<Either<Failure, Unit>> logOut();
}

class AuthenticationRepositoryImpl implements AuthenticationRepository {
  final AuthenticationRemoteDataSource authenticationRemoteDataSource;

  AuthenticationRepositoryImpl({required this.authenticationRemoteDataSource});

  @override
  Future<Either<Failure, UserCredential>> logIn(
      String username, String password) async {
    try {
      final ApiResponse<UserCredential> apiResponseUserCredential =
          await authenticationRemoteDataSource.logIn(username, password);

      if (apiResponseUserCredential.response == null) {
        return const Left(ServerFailure('User not found'));
      }

      locator<Box>()
          .put('userMap', apiResponseUserCredential.response!.toJson());

      return Right(apiResponseUserCredential.response!);
    } on ServerException catch (e) {
      if (e.message.contains('timeout')) {
        return Left(TimeoutFailure(e.toString()));
      } else {
        return Left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, Unit>> logOut() {
    throw UnimplementedError();
  }
}
