import 'package:ecnictech_fnb_ui/features/auth/usecase/login_usecase.dart';
import 'package:ecnictech_fnb_ui/features/auth/usecase/logout_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ecnictech_fnb_ui/features/auth/models/user_credential.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final LogInUseCase logInUseCase;
  final LogOutUseCase logOutUseCase;

  AuthenticationBloc({required this.logInUseCase, required this.logOutUseCase})
      : super(AuthInitialState()) {
    on<LogIn>((event, emit) async {
      final failureOrCredentials =
          await logInUseCase(event.username, event.password);
      emit(failureOrCredentials.fold((exception) {
        return const LoginFailed(message: "Login error");
      }, (credentials) => LoggedIn(userCredential: credentials)));
    });

    on<LogOut>((event, emit) async {
      final failureOrLogOut = await logOutUseCase();
      emit(failureOrLogOut.fold((exception) {
        return const LoginFailed(message: "Logout error");
      }, (credentials) => LoggedOut()));
    });

    on<AuthInit>((event, emit) async {
      // Do nothing
    });
  }
}
