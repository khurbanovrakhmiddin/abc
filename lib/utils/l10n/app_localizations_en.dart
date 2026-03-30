// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get welcome_back => 'Welcome Back';

  @override
  String get sign_in_subtitle => 'Please enter your details to sign in';

  @override
  String get email_label => 'Email Address';

  @override
  String get password_label => 'Password';

  @override
  String get remember_me => 'Remember Me';

  @override
  String get sign_in_btn => 'Sign In';

  @override
  String get or => 'OR';

  @override
  String get google_sign_in => 'Sign in with Google';

  @override
  String get home => 'Home';

  @override
  String get settings => 'Settings';

  @override
  String get user_info => 'User Information';

  @override
  String get my_businesses => 'My Businesses';

  @override
  String get dark_mode => 'Dark Mode';

  @override
  String get language => 'Language';

  @override
  String get logout => 'Logout';

  @override
  String get error_loading => 'Failed to load data';

  @override
  String get it_services => 'IT Services';

  @override
  String get logistics => 'Logistics';

  @override
  String get email_error_empty => 'Please enter email';

  @override
  String get password_error_empty => 'Please enter password';

  @override
  String get password_error_short => 'Password too short (min. 6 chars)';
}
