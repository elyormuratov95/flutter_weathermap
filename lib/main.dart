import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/locale/locale_storage.dart';
import 'l10n/generated/app_localizations.dart';
import 'screens/language_selection_screen.dart';
import 'screens/login_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  final localeStorage = LocaleStorage(prefs);
  final savedLocale = localeStorage.loadLocale();
  runApp(MyApp(
    localeStorage: localeStorage,
    initialLocale: savedLocale,
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({
    super.key,
    required this.localeStorage,
    required this.initialLocale,
  });

  final LocaleStorage localeStorage;
  final Locale? initialLocale;

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late Locale? _locale;

  @override
  void initState() {
    super.initState();
    _locale = widget.initialLocale;
  }

  void _openLanguageSelection(BuildContext context) {
    Navigator.of(context).push<void>(
      MaterialPageRoute(
        builder: (_) => LanguageSelectionScreen(
          localeStorage: widget.localeStorage,
          currentLocale: _locale,
          onLocaleChanged: (locale) {
            setState(() => _locale = locale);
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Weathermap',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      locale: _locale,
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
      home: LoginScreen(onOpenLanguageSelection: _openLanguageSelection),
    );
  }
}
