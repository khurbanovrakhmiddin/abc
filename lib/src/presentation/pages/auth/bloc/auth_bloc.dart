import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../../domain/usecase/auth/check_login_status_usecase.dart';
import '../../../../domain/usecase/auth/log_out_usecase.dart';
import '../../../../domain/usecase/auth/login_usecase.dart';
import '../../../../domain/usecase/auth/login_with_usecase.dart';
import '../../../../domain/usecase/usecase.dart';

part 'auth_event.dart';

part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final LoginUseCase loginUseCase;
  final LogoutUseCase logoutUseCase;
  final CheckAuthStatusUseCase checkAuthUseCase;
  final LoginWithGoogleUseCase loginWithUseCase;

  AuthBloc({
    required this.loginUseCase,
    required this.checkAuthUseCase,
    required this.logoutUseCase,
    required this.loginWithUseCase,
  }) : super(const AuthState(isLoading: true)) {
    on<AuthCheckRequested>((event, emit) async {
      emit(state.copyWith(isLoading: true));

      final result = await checkAuthUseCase(NoParams());

      result.fold(
        (failure) =>
            emit(state.copyWith(isAuthenticated: false, isLoading: false)),
        (isAuthenticated) => emit(
          state.copyWith(isAuthenticated: isAuthenticated, isLoading: false),
        ),
      );
    });

    on<AuthLoginRequested>((event, emit) async {
      emit(state.copyWith(isLoading: true, errorMessage: null));

      final result = await loginUseCase(event.rememberMe);

      result.fold(
        (failure) => emit(
          state.copyWith(isLoading: false, errorMessage: failure.message),
        ),
        (success) =>
            emit(state.copyWith(isLoading: false, isAuthenticated: true)),
      );
    });

    on<AuthLoginWithRequested>((event, emit) async {
      emit(state.copyWith(isLoading: true, errorMessage: null));

      final result = await loginWithUseCase(event.rememberMe);

      result.fold(
        (failure) => emit(
          state.copyWith(
            isLoading: false,
            errorMessage: failure.message,
            isAuthenticated: false,
          ),
        ),
        (_) => emit(state.copyWith(isLoading: false, isAuthenticated: true)),
      );
    });

    on<AuthLogoutRequested>((event, emit) async {
      emit(state.copyWith(isLoading: true));

      final result = await logoutUseCase(NoParams());

      result.fold(
        (failure) => emit(
          state.copyWith(isLoading: false, errorMessage: failure.message),
        ),
        (_) => emit(state.copyWith(isAuthenticated: false, isLoading: false)),
      );
    });
  }
}
