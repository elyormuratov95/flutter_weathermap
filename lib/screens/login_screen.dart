import 'package:flutter/material.dart';

import '../core/constants/app_spacing.dart';
import '../l10n/generated/app_localizations.dart';

/// Login screen UI: login field, password field, sign-in button.
/// Follows UI_RULES: Scaffold, theme (colorScheme/textTheme), const, SRP.
class LoginScreen extends StatefulWidget {
  const LoginScreen({
    super.key,
    this.onOpenLanguageSelection,
  });

  /// Called when user taps to open the language selection screen.
  final void Function(BuildContext context)? onOpenLanguageSelection;

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _loginController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _loginController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _onSignIn() {
    if (_formKey.currentState?.validate() ?? false) {
      // TODO(flutter_weathermap-v7g): call auth service when API task is done
      final login = _loginController.text;
      final password = _passwordController.text;
      assert(login.isNotEmpty && password.isNotEmpty);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.loginScreenTitle),
        backgroundColor: colorScheme.surface,
        foregroundColor: colorScheme.onSurface,
        actions: [
          if (widget.onOpenLanguageSelection != null)
            TextButton(
              onPressed: () => widget.onOpenLanguageSelection!(context),
              child: Text(l10n.languageScreenTitle),
            ),
        ],
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: AppSpacing.paddingXLarge),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    l10n.loginScreenTitle,
                    style: textTheme.headlineSmall?.copyWith(
                      color: colorScheme.onSurface,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: AppSpacing.gapBeforeButton),
                  TextFormField(
                    controller: _loginController,
                    decoration: InputDecoration(
                      labelText: l10n.loginHint,
                      hintText: l10n.loginHint,
                      border: const OutlineInputBorder(),
                      filled: true,
                      fillColor: colorScheme.surfaceContainerHighest.withValues(alpha: 0.3),
                    ),
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return l10n.loginRequired;
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: AppSpacing.gapBetweenFields),
                  TextFormField(
                    controller: _passwordController,
                    decoration: InputDecoration(
                      labelText: l10n.passwordHint,
                      hintText: l10n.passwordHint,
                      border: const OutlineInputBorder(),
                      filled: true,
                      fillColor: colorScheme.surfaceContainerHighest.withValues(alpha: 0.3),
                    ),
                    obscureText: true,
                    textInputAction: TextInputAction.done,
                    onFieldSubmitted: (_) => _onSignIn(),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return l10n.passwordRequired;
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: AppSpacing.gapBeforeButton),
                  Semantics(
                    button: true,
                    label: l10n.signIn,
                    child: FilledButton(
                      onPressed: _onSignIn,
                      style: FilledButton.styleFrom(
                        backgroundColor: colorScheme.primary,
                        foregroundColor: colorScheme.onPrimary,
                        padding: const EdgeInsets.symmetric(vertical: AppSpacing.paddingMedium),
                      ),
                      child: Text(l10n.signIn),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
