part of 'auth_bloc.dart';


abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object?> get props => [];
}

class AuthCheckRequested extends AuthEvent {}

class AuthLoginRequested extends AuthEvent {
  final bool rememberMe;

  const AuthLoginRequested(this.rememberMe);

  @override
  List<Object?> get props => [rememberMe];
}
class AuthLoginWithRequested extends AuthEvent {
  final bool rememberMe;

  const AuthLoginWithRequested(this.rememberMe);

  @override
  List<Object?> get props => [rememberMe];
}

class AuthLogoutRequested extends AuthEvent {}
