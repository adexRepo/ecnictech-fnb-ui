import 'package:dartz/dartz.dart';
import 'package:ecnictech_fnb_ui/core/error/failures.dart';
import 'package:ecnictech_fnb_ui/features/auth/repository/authentication_repository.dart';

class LogOutUseCase {
  final AuthenticationRepository repository;

  LogOutUseCase(this.repository);

  Future<Either<Failure, Unit>> call() async {
    return await repository.logOut();
  }
}
