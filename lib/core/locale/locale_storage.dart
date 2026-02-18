import 'dart:ui';

import 'package:shared_preferences/shared_preferences.dart';

/// Persists and loads the selected app locale (language code).
/// Used so that the chosen language is kept across restarts.
class LocaleStorage {
  LocaleStorage(this._prefs);

  final SharedPreferences _prefs;
  static const String _keyLocale = 'app_locale';

  /// Supported language codes: en, ru, uz.
  static const List<String> supportedLanguageCodes = ['en', 'ru', 'uz'];

  /// Loads saved locale; returns null if none saved (use platform default).
  Locale? loadLocale() {
    final code = _prefs.getString(_keyLocale);
    if (code == null || !supportedLanguageCodes.contains(code)) {
      return null;
    }
    return Locale(code);
  }

  /// Saves the locale and returns true on success.
  Future<bool> saveLocale(Locale locale) async {
    return _prefs.setString(_keyLocale, locale.languageCode);
  }
}
