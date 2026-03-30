import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'data/repository/auth_repository_impl.dart';
import 'data/repository/user_repository_impl.dart';
import 'data/request/local/local_storage.dart';
import 'domain/repository/auth_repository.dart';
import 'domain/repository/user_repository.dart';
import 'domain/usecase/auth/check_login_status_usecase.dart';
import 'domain/usecase/auth/log_out_usecase.dart';
import 'domain/usecase/auth/login_usecase.dart';
import 'domain/usecase/auth/login_with_usecase.dart';
import 'domain/usecase/profile/get_profile_usecase.dart';
import 'presentation/bloc/language/language_cubit.dart';
import 'presentation/bloc/theme/theme_cubit.dart';
import 'presentation/bloc/user/user_bloc.dart';
import 'presentation/pages/auth/bloc/auth_bloc.dart';

final GetIt sl = GetIt.instance;

Future<void> init() async {
  final prefs = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => StorageService(prefs));

  sl.registerLazySingleton<AuthRepository>(() => MockAuthRepository(sl()));
  sl.registerLazySingleton<UserRepository>(() => MockUserRepository());

  sl.registerLazySingleton(() => CheckAuthStatusUseCase(sl()));
  sl.registerLazySingleton(() => LoginUseCase(sl()));
  sl.registerLazySingleton(() => LoginWithGoogleUseCase(sl()));
  sl.registerLazySingleton(() => LogoutUseCase(sl()));
  sl.registerLazySingleton(() => GetUserProfileUseCase(sl()));

  sl.registerLazySingleton(() => LanguageCubit(sl()));
  sl.registerLazySingleton(() => ThemeCubit(sl()));

  sl.registerFactory(
        () => AuthBloc(
      checkAuthUseCase: sl(),
      loginUseCase: sl(),
      logoutUseCase: sl(),
      loginWithUseCase: sl(),
    ),
  );

  sl.registerFactory(() => UserBloc(sl()));
}