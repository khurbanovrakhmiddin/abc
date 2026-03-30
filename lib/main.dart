import 'package:abc/src/presentation/bloc/language/language_cubit.dart';
import 'package:abc/src/presentation/bloc/theme/theme_cubit.dart';
import 'package:abc/src/presentation/bloc/user/user_bloc.dart';
import 'package:abc/src/presentation/pages/auth/auth_page.dart';
import 'package:abc/src/presentation/pages/auth/bloc/auth_bloc.dart';
import 'package:abc/src/presentation/pages/main/main_page.dart';
import 'package:abc/utils/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:abc/src/di.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
class AppBlocObserver extends BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    debugPrint('${bloc.runtimeType} $change');
  }
}
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init();
  Bloc.observer = AppBlocObserver();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => sl<AuthBloc>()..add(AuthCheckRequested())),
        BlocProvider(create: (_) => sl<UserBloc>()),
        BlocProvider(create: (_) => sl<ThemeCubit>()),
        BlocProvider(create: (_) => sl<LanguageCubit>()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeMode>(
      builder: (context, themeMode) {
        return BlocBuilder<LanguageCubit, Locale>(
          builder: (context, locale) {
            return MaterialApp(
              theme: ThemeData.light(),
              debugShowCheckedModeBanner: false,
              localizationsDelegates: const [
                AppLocalizations.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              supportedLocales: const [
                Locale('en'),
                Locale('ru'),
                Locale('uz'),
              ],
              darkTheme: ThemeData.dark(),
              themeMode: themeMode,
              locale: locale,
              home: BlocBuilder<AuthBloc, AuthState>(
                builder: (context, state) {
                  return state.isAuthenticated
                      ? const MainPage()
                      : const AuthPage();
                },
              ),
            );
          },
        );
      },
    );
  }
}
