# Task: flutter_weathermap-e75 — Login sahifasi UI

**Status:** Bajarildi (in progress → close when verified).

**Maqsad:** Login sahifasi UI: login (email/username) maydoni, parol maydoni, "Kirish" tugmasi.

---

## Qilingan o'zgarishlar

### 1. Yangi fayllar

| Fayl | Vazifa |
|------|--------|
| `lib/core/constants/app_spacing.dart` | Layout uchun spacing konstantalari (UI_RULES: magic number yo'q). |
| `lib/l10n/app_strings.dart` | Foydalanuvchiga ko'rinadigan matnlar placeholder (UI_RULES: hardcoded string yo'q). Keyinchalik task `flutter_weathermap-rt0` da `AppLocalizations` bilan almashtiriladi. |
| `lib/screens/login_screen.dart` | Login ekrani: Scaffold, AppBar, login maydoni, parol maydoni, Kirish tugmasi, validatsiya, Semantics. |

### 2. O'zgartirilgan fayllar

| Fayl | O'zgarish |
|------|-----------|
| `lib/main.dart` | `MyApp` saqlab qolindi; theme `useMaterial3: true`, `home: LoginScreen()`. Demo `MyHomePage` olib tashlandi. |

---

## Qoidalarga muvofiqlik

- **PROJECT_RULES:** `lib/` ostida `screens/`, `core/constants/`, `l10n/`; Dart nomlash konvensiyasi.
- **SOLID:** LoginScreen faqat UI (SRP); biznes mantiqi keyin inject qilinadi (DIP).
- **UI_RULES:**
  - Theme: `Theme.of(context).colorScheme`, `textTheme`; qattiq rang yo'q.
  - Scaffold, AppBar, SafeArea, SingleChildScrollView.
  - Spacing: `AppSpacing` konstantalari.
  - Matnlar: `AppStrings` orqali (l10n placeholder).
  - Const qayerda mumkin bo'lsa ishlatilgan.
  - Semantics: Kirish tugmasi uchun `Semantics(button: true, label: ...)`.
  - Validatsiya: bo'sh login/parol uchun xabar ko'rsatiladi.

---

## Keyingi qadamlar (boshqa task'lar)

- **flutter_weathermap-rt0:** `AppStrings` ni `AppLocalizations` (RU/EN/UZ) bilan almashtirish.
- **flutter_weathermap-v7g:** Login mantiqi (API auth) ulash; `_onSignIn` da service chaqiruv.

---

## Tekshirish

- `flutter analyze` — xatosiz.
- `flutter run` — Login sahifasi ko‘rinadi, login/parol kiritish va "Sign in" bosish ishlaydi (validatsiya ishlaydi).
