import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../utils/l10n/app_localizations.dart';
import '../../../bloc/language/language_cubit.dart';
import '../../../bloc/theme/theme_cubit.dart';
import '../../auth/auth_page.dart';
import '../../auth/bloc/auth_bloc.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(title: Text(l10n.settings)),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 10),
        children: [
          BlocBuilder<ThemeCubit, ThemeMode>(
            builder: (context, mode) {
              return ListTile(
                leading: const Icon(Icons.dark_mode_outlined),
                title: Text(l10n.dark_mode),
                trailing: Switch(
                  value: mode == ThemeMode.dark,
                  activeColor: Colors.teal,
                  onChanged: (_) => context.read<ThemeCubit>().toggleTheme(),
                ),
              );
            },
          ),
          BlocBuilder<LanguageCubit, Locale>(
            builder: (context, locale) {
              return ListTile(
                leading: const Icon(Icons.language_outlined),
                title: Text(l10n.language),
                trailing: DropdownButton<String>(
                  value: locale.languageCode,
                  underline: const SizedBox(),
                  onChanged: (String? code) {
                    if (code != null) {
                      context.read<LanguageCubit>().changeLanguage(code);
                    }
                  },
                  items: const [
                    DropdownMenuItem(value: 'en', child: Text('English')),
                    DropdownMenuItem(value: 'ru', child: Text('Русский')),
                    DropdownMenuItem(value: 'uz', child: Text("O'zbekcha")),
                  ],
                ),
              );
            },
          ),
          const Divider(),
          BlocConsumer<AuthBloc, AuthState>(
            listener: (context, state) {
              if (!state.isAuthenticated) {
                Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => const AuthPage()),
                  (route) => false,
                );
              }
            },
            builder: (context, state) {
              return ListTile(
                leading: state.isLoading
                    ? const SizedBox(
                        width: 24,
                        height: 24,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          color: Colors.red,
                        ),
                      )
                    : const Icon(Icons.logout, color: Colors.red),
                title: Text(
                  l10n.logout,
                  style: const TextStyle(color: Colors.red),
                ),
                trailing: state.isLoading ? const SizedBox.shrink() : null,
                onTap: state.isLoading
                    ? null
                    : () {
                        context.read<AuthBloc>().add(AuthLogoutRequested());
                      },
              );
            },
          ),
        ],
      ),
    );
  }
}
