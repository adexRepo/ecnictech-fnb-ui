part of 'authentication_bloc.dart';

abstract class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();

  @override
  List<Object> get props => [];
}

class AuthInit extends AuthenticationEvent {}

class LogIn extends AuthenticationEvent {
  final String username;
  final String password;

  const LogIn({required this.username, required this.password});
}

class LogOut extends AuthenticationEvent {}
