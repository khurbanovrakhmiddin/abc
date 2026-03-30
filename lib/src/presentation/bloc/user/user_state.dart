part of 'user_bloc.dart';

sealed class UserState extends Equatable {
  const UserState();

  @override
  List<Object?> get props => [];
}

class UserInitial extends UserState {}

class UserError extends UserState {
  final String msg;

  const UserError(this.msg);
}

class UserLoading extends UserState {}

class UserLoaded extends UserState {
  final UserEntity user;

  const UserLoaded(this.user);

  @override
  List<Object?> get props => [user];
}
