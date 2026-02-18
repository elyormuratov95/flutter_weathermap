# Task: flutter_weathermap-rt0 — Lokalizatsiya (3 til + til tanlash)

**Status:** Bajarildi (close when verified).

**Maqsad:** 3 tilda qo‘llab-quvvatlash (Rus, Ingliz, O‘zbek), til tanlash sahifasi, tanlangan til saqlash, ilova matnlarini l10n orqali ko‘rsatish.

---

## Qilingan o'zgarishlar

### 1. Yangi fayllar

| Fayl | Vazifa |
|------|--------|
| `l10n.yaml` | Flutter l10n generatsiya sozlamalari (arb-dir, template, output-dir). |
| `lib/l10n/app_en.arb` | Ingliz matnlar (login, parol, til tanlash va boshqalar). |
| `lib/l10n/app_ru.arb` | Rus matnlar. |
| `lib/l10n/app_uz.arb` | O‘zbek matnlar. |
| `lib/l10n/generated/app_localizations.dart` | AppLocalizations delegate va abstract klass. |
| `lib/l10n/generated/app_localizations_en.dart` | EN implementatsiya. |
| `lib/l10n/generated/app_localizations_ru.dart` | RU implementatsiya. |
| `lib/l10n/generated/app_localizations_uz.dart` | UZ implementatsiya. |
| `lib/core/locale/locale_storage.dart` | Tanlangan tilni SharedPreferences orqali saqlash/o‘qish. |
| `lib/screens/language_selection_screen.dart` | Til tanlash sahifasi: EN, RU, UZ ro‘yxati, saqlash va orqaga. |

### 2. O'zgartirilgan fayllar

| Fayl | O'zgarish |
|------|-----------|
| `pubspec.yaml` | `flutter_localizations`, `intl`, `shared_preferences` qo‘shildi; `flutter.generate: true`. |
| `lib/main.dart` | `main()` async: SharedPreferences, LocaleStorage, saved locale. MyApp StatefulWidget: _locale state, localizationsDelegates, supportedLocales (en, ru, uz), LanguageSelectionScreen ga ochish callback. |
| `lib/screens/login_screen.dart` | AppStrings o‘rniga AppLocalizations.of(context); AppBar da “Til” tugmasi (til tanlash sahifasiga). |

### 3. O‘chirilgan fayllar

| Fayl | Sabab |
|------|--------|
| `lib/l10n/app_strings.dart` | AppLocalizations bilan almashtirildi. |

---

## Qoidalarga muvofiqlik

- **PROJECT_RULES:** `lib/l10n/`, `lib/core/locale/`, `lib/screens/`; dependency’lar pubspec’da.
- **SOLID:** LocaleStorage — bitta mas’uliyat (til saqlash); screen faqat UI; delegate orqali l10n inject.
- **UI_RULES:** Til tanlash sahifasi Scaffold, theme, AppSpacing; barcha matnlar l10n orqali (hardcoded yo‘q).

---

## Til kodi va saqlash

- **Qo‘llab-quvvatlanadigan tillar:** `en`, `ru`, `uz`.
- **Saqlash:** `LocaleStorage` — SharedPreferences kaliti `app_locale`; qiymat `en` / `ru` / `uz`.
- **Ilova ishga tushganda:** Saqlangan til bor bo‘lsa, `MaterialApp.locale` shu tilga o‘rnatiladi; yo‘q bo‘lsa tizim tilidan foydalaniladi.

---

## Keyingi qadamlar

- Yangi ekranlar/qatorlar qo‘shilganda matnlar `lib/l10n/app_*.arb` ga qo‘shiladi; kerak bo‘lsa `flutter gen-l10n` qayta ishlatiladi (yoki generated fayllar qo‘lda yangilanishi mumkin).
- Profile sahifasida “Tilni o‘zgartirish” (task flutter_weathermap-lfd) shu LanguageSelectionScreen ga yo‘naltiriladi.

---

## Tekshirish

- `flutter run` — Login sahifasida “Til” tugmasi, til tanlash sahifasida EN/RU/UZ, tanlash va saqlash.
- Til o‘zgartirilgach butun ilova (Login va til sahifasi) yangilangan tilda ko‘rinadi.
- Ilovani qayta ishga tushirganda oxirgi tanlangan til qoladi.
