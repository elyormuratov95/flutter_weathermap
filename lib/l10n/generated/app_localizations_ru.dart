// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Russian (`ru`).
class AppLocalizationsRu extends AppLocalizations {
  AppLocalizationsRu([String locale = 'ru']) : super(locale);

  @override
  String get loginHint => 'Логин';

  @override
  String get passwordHint => 'Пароль';

  @override
  String get signIn => 'Войти';

  @override
  String get loginScreenTitle => 'Вход';

  @override
  String get loginRequired => 'Введите логин';

  @override
  String get passwordRequired => 'Введите пароль';

  @override
  String get selectLanguage => 'Выберите язык';

  @override
  String get languageEn => 'English';

  @override
  String get languageRu => 'Русский';

  @override
  String get languageUz => 'Oʻzbek';

  @override
  String get languageScreenTitle => 'Язык';
}
