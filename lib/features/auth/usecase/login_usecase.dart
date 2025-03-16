import 'package:dartz/dartz.dart';
import 'package:ecnictech_fnb_ui/core/error/failures.dart';
import 'package:ecnictech_fnb_ui/features/auth/models/user_credential.dart';
import 'package:ecnictech_fnb_ui/features/auth/repository/authentication_repository.dart';

class LogInUseCase {
  final AuthenticationRepository repository;

  LogInUseCase(this.repository);

  Future<Either<Failure, UserCredential>> call(
      String username, String password) async {
    return await repository.logIn(username, password);
  }
}
