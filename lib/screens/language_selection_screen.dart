import 'package:flutter/material.dart';

import '../core/constants/app_spacing.dart';
import '../core/locale/locale_storage.dart';
import '../l10n/generated/app_localizations.dart';

/// Screen where user selects app language (EN, RU, UZ).
/// Saves choice via [LocaleStorage] and notifies [onLocaleChanged].
class LanguageSelectionScreen extends StatelessWidget {
  const LanguageSelectionScreen({
    super.key,
    required this.localeStorage,
    required this.currentLocale,
    required this.onLocaleChanged,
  });

  final LocaleStorage localeStorage;
  final Locale? currentLocale;
  final ValueChanged<Locale> onLocaleChanged;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.languageScreenTitle),
        backgroundColor: colorScheme.surface,
        foregroundColor: colorScheme.onSurface,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.paddingMedium),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                l10n.selectLanguage,
                style: textTheme.titleMedium?.copyWith(
                  color: colorScheme.onSurface,
                ),
              ),
              const SizedBox(height: AppSpacing.gapBetweenFields),
              _LanguageTile(
                label: l10n.languageEn,
                locale: const Locale('en'),
                currentLocale: currentLocale,
                onTap: () => _selectLocale(context, const Locale('en')),
              ),
              _LanguageTile(
                label: l10n.languageRu,
                locale: const Locale('ru'),
                currentLocale: currentLocale,
                onTap: () => _selectLocale(context, const Locale('ru')),
              ),
              _LanguageTile(
                label: l10n.languageUz,
                locale: const Locale('uz'),
                currentLocale: currentLocale,
                onTap: () => _selectLocale(context, const Locale('uz')),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _selectLocale(BuildContext context, Locale locale) async {
    await localeStorage.saveLocale(locale);
    onLocaleChanged(locale);
    if (context.mounted) {
      Navigator.of(context).pop();
    }
  }
}

class _LanguageTile extends StatelessWidget {
  const _LanguageTile({
    required this.label,
    required this.locale,
    required this.currentLocale,
    required this.onTap,
  });

  final String label;
  final Locale locale;
  final Locale? currentLocale;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isSelected =
        currentLocale?.languageCode == locale.languageCode;

    return ListTile(
      title: Text(label),
      trailing: isSelected ? Icon(Icons.check, color: theme.colorScheme.primary) : null,
      onTap: onTap,
    );
  }
}
