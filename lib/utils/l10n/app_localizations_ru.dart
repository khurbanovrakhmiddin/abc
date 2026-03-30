// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Russian (`ru`).
class AppLocalizationsRu extends AppLocalizations {
  AppLocalizationsRu([String locale = 'ru']) : super(locale);

  @override
  String get welcome_back => 'С возвращением';

  @override
  String get sign_in_subtitle => 'Пожалуйста, введите свои данные для входа';

  @override
  String get email_label => 'Электронная почта';

  @override
  String get password_label => 'Пароль';

  @override
  String get remember_me => 'Запомнить меня';

  @override
  String get sign_in_btn => 'Войти';

  @override
  String get or => 'ИЛИ';

  @override
  String get google_sign_in => 'Войти через Google';

  @override
  String get home => 'Главная';

  @override
  String get settings => 'Настройки';

  @override
  String get user_info => 'Информация о пользователе';

  @override
  String get my_businesses => 'Мои компании';

  @override
  String get dark_mode => 'Темная тема';

  @override
  String get language => 'Язык';

  @override
  String get logout => 'Выйти';

  @override
  String get error_loading => 'Ошибка загрузки данных';

  @override
  String get it_services => 'IT Услуги';

  @override
  String get logistics => 'Логистика';

  @override
  String get email_error_empty => 'Пожалуйста, введите email';

  @override
  String get password_error_empty => 'Пожалуйста, введите пароль';

  @override
  String get password_error_short =>
      'Пароль слишком короткий (мин. 6 символов)';
}
