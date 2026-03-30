import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_ru.dart';
import 'app_localizations_uz.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('ru'),
    Locale('uz'),
  ];

  /// No description provided for @welcome_back.
  ///
  /// In ru, this message translates to:
  /// **'С возвращением'**
  String get welcome_back;

  /// No description provided for @sign_in_subtitle.
  ///
  /// In ru, this message translates to:
  /// **'Пожалуйста, введите свои данные для входа'**
  String get sign_in_subtitle;

  /// No description provided for @email_label.
  ///
  /// In ru, this message translates to:
  /// **'Электронная почта'**
  String get email_label;

  /// No description provided for @password_label.
  ///
  /// In ru, this message translates to:
  /// **'Пароль'**
  String get password_label;

  /// No description provided for @remember_me.
  ///
  /// In ru, this message translates to:
  /// **'Запомнить меня'**
  String get remember_me;

  /// No description provided for @sign_in_btn.
  ///
  /// In ru, this message translates to:
  /// **'Войти'**
  String get sign_in_btn;

  /// No description provided for @or.
  ///
  /// In ru, this message translates to:
  /// **'ИЛИ'**
  String get or;

  /// No description provided for @google_sign_in.
  ///
  /// In ru, this message translates to:
  /// **'Войти через Google'**
  String get google_sign_in;

  /// No description provided for @home.
  ///
  /// In ru, this message translates to:
  /// **'Главная'**
  String get home;

  /// No description provided for @settings.
  ///
  /// In ru, this message translates to:
  /// **'Настройки'**
  String get settings;

  /// No description provided for @user_info.
  ///
  /// In ru, this message translates to:
  /// **'Информация о пользователе'**
  String get user_info;

  /// No description provided for @my_businesses.
  ///
  /// In ru, this message translates to:
  /// **'Мои компании'**
  String get my_businesses;

  /// No description provided for @dark_mode.
  ///
  /// In ru, this message translates to:
  /// **'Темная тема'**
  String get dark_mode;

  /// No description provided for @language.
  ///
  /// In ru, this message translates to:
  /// **'Язык'**
  String get language;

  /// No description provided for @logout.
  ///
  /// In ru, this message translates to:
  /// **'Выйти'**
  String get logout;

  /// No description provided for @error_loading.
  ///
  /// In ru, this message translates to:
  /// **'Ошибка загрузки данных'**
  String get error_loading;

  /// No description provided for @it_services.
  ///
  /// In ru, this message translates to:
  /// **'IT Услуги'**
  String get it_services;

  /// No description provided for @logistics.
  ///
  /// In ru, this message translates to:
  /// **'Логистика'**
  String get logistics;

  /// No description provided for @email_error_empty.
  ///
  /// In ru, this message translates to:
  /// **'Пожалуйста, введите email'**
  String get email_error_empty;

  /// No description provided for @password_error_empty.
  ///
  /// In ru, this message translates to:
  /// **'Пожалуйста, введите пароль'**
  String get password_error_empty;

  /// No description provided for @password_error_short.
  ///
  /// In ru, this message translates to:
  /// **'Пароль слишком короткий (мин. 6 символов)'**
  String get password_error_short;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'ru', 'uz'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'ru':
      return AppLocalizationsRu();
    case 'uz':
      return AppLocalizationsUz();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
