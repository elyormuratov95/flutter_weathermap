# Loyiha qoidalari (Project Rules)

Bu hujjat **flutter_weathermap** loyihasining umumiy ishlash qoidalarini belgilaydi.

## 1. Umumiy tamoyillar

- **Kod sifati**: Har bir o'zgarish `flutter analyze` va `flutter test` dan o'tishi kerak.
- **Nomlash**: Dart convention — `lowerCamelCase` (o'zgaruvchilar, funksiyalar), `UpperCamelCase` (klasslar, tip va fayl nomlari).
- **Fayl tuzilishi**: `lib/` ostida mantiqiy papkalar — `screens/`, `widgets/`, `services/`, `models/`, `repositories/` va hokazo.
- **Til**: Kod va commit xabarlari ingliz tilida; foydalanuvchiga ko'rinadigan matnlar (i18n) loyiha tilida bo'lishi mumkin.

## 2. Versiyalash va ish jarayoni

- **Git**: Har bir feature/fix uchun aniq commit xabarlari. `bd` (beads) orqali issue’lar boshqariladi.
- **Session tugashi**: Ishlov tugagach majburiy `git pull --rebase`, `bd sync`, `git push` (batafsil — [AGENTS.md](../AGENTS.md)).

## 3. Dokumentatsiya

- Muhim qarorlar va arxitektura `docs/` da saqlanadi.
- SOLID qoidalari: [docs/SOLID_RULES.md](SOLID_RULES.md).
- UI qoidalari: [docs/UI_RULES.md](UI_RULES.md).

## 4. Xavfsizlik va maxfiylik

- API kalitlari va maxfiy ma’lumotlar kodda hardcode qilinmasligi kerak; muhit o‘zgaruvchilari yoki `--dart-define` / config fayllar (git’ga kiritilmagan) ishlatiladi.

## 5. Testlar

- Yangi mantiq uchun unit/widget testlar yoziladi.
- Kritik yo‘llar (masalan, ob-havo ma’lumotlarini olish) test qilinadi.

---

Keyingi: [SOLID qoidalari](SOLID_RULES.md) | [UI qoidalari](UI_RULES.md)
