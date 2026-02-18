# UI qoidalari (UI / UX Rules)

Flutter loyihasida interfeys va foydalanuvchi tajribasi uchun qo‘llanadigan qoidalar.

---

## 1. Umumiy UI tamoyillari

- **Material Design 3** (yoki loyiha qaroriga ko‘ra belgilangan design system) asosiy ko‘rinish uchun ishlatiladi.
- **Theme**: Ranglar, matn stillari va komponentlar `ThemeData` orqali markazlashgan; qattiq kodlangan ranglar (`Colors.blue` va h.k.) o‘rniga `Theme.of(context).colorScheme` va `textTheme` ishlatiladi.
- **Responsivlik**: Turli ekran o‘lchamlari (telefon, planshet) hisobga olinadi; `LayoutBuilder`, `MediaQuery`, yoki responsive wrapper’lar kerak bo‘lsa qo‘llanadi.
- **Accessibility**: Semantik label’lar (`Semantics`), contrast, va kerak bo‘lsa kattalashtiriladigan matn (`textScaleFactor`).

---

## 2. Widget tuzilishi va nomlash

- **Bir vazifa**: Har bir widget bitta ko‘rinish yoki bitta mantiqiy blokni ifodalaydi; murakkab ekranlar kichik widget’larga bo‘linadi.
- **Nomlash**:  
  - Screen: `*Screen` (masalan, `WeatherScreen`, `SettingsScreen`).  
  - Qayta ishlatiladigan UI qismi: `*Widget` yoki mazmuni bo‘yicha (`WeatherCard`, `CitySearchBar`).  
  - Private widget: `_*` (masalan, `_WeatherBody`).
- **Const**: Imkon qadar `const` constructor’lar ishlatiladi (perfomans va rebuild’lar uchun).

---

## 3. Layout va komponentlar

- **Scaffold**: Har bir to‘liq ekran odatda bitta `Scaffold` bilan; `AppBar`, `body`, `bottomNavigationBar` bir xil tartibda.
- **Spacing**: `SizedBox`, `Padding`, `EdgeInsets` — raqamlari theme yoki loyiha konstantalari orqali boshqariladi (magic number’lar kamayadi).
- **Listlar**: Uzun ro‘yxatlar uchun `ListView.builder` (lazy) ishlatiladi; keraksiz widget yaratilmasligi uchun.
- **O‘lchov**: Muqobil: `Expanded`/`Flexible` va `FractionallySizedBox`; qattiq o‘lchamlar faqat zarur joyda.

---

## 4. State va reaktivlik

- **State joyi**: State faqat kerakli eng past darajada saqlanadi; bir nechta widget’ga kerak bo‘lsa — yuqoriga (parent yoki state management) ko‘tariladi.
- **State management**: Loyiha tanlagan yondashuv (Provider, Riverpod, Bloc, setState va h.k.) bo‘yicha barcha yangi ekranlar yagona uslubda yoziladi.
- **Loading va xato**: Har bir tashqi ma’lumot (API) uchun loading va error holatlari ko‘rsatiladi; bo‘sh ekran o‘rniga progress yoki xabar.

---

## 5. Matn va lokalizatsiya

- **Hardcoded matn**: UI’da to‘g‘ridan-to‘g‘ri string yozilmasligi kerak; barcha foydalanuvchiga ko‘rinadigan matnlar `AppLocalizations` (yoki loyihadagi i18n yechimi) orqali keladi.
- **Font**: Matn o‘lchamlari `ThemeData.textTheme` dan; maxsus kerak bo‘lsa theme’da kengaytiriladi.

---

## 6. Ranglar va tema

- **Ranglar**:  
  - `colorScheme.primary`, `colorScheme.surface`, `colorScheme.error` va boshqa semantic ranglar ishlatiladi.  
  - Dark/Light theme ikkalasi ham qo‘llab-quvvatlansa, ikkala rejimda ham contrast va o‘qiluvchanlik tekshiriladi.
- **Asset’lar**: Rasmlar va ikonkalar `assets/` da; theme yoki loyiha konstantalari orqali yo‘l boshqariladi.

---

## 7. Animatsiya va harakat

- **Qisqa va ma’qul**: Animatsiyalar qisqa (200–400 ms) va foydalanuvchi harakatiga javob beradigan bo‘ladi.
- **Implicit vs explicit**: Oddiy o‘tishlar uchun `AnimatedContainer`, `AnimatedOpacity`; murakkab uchun `AnimationController` va `Tween`.

---

## 8. Test va konsistentlik

- **Widget testlar**: Muhim UI komponentlari uchun widget test yoziladi; key widget’lar nomi va mavjudligi tekshiriladi.
- **Golden test**: Loyiha qaroriga ko‘ra, kritik ekranlar uchun golden test qo‘shilishi mumkin.
- **Linter**: `flutter_lints` va loyiha `analysis_options.yaml` qoidalariga rioya qilinadi.

---

## 9. Qisqacha checklist (yangi ekran/widget)

- [ ] Theme ranglari va `textTheme` ishlatilgan
- [ ] Const qayerda mumkin bo‘lsa qo‘llangan
- [ ] Loading va error holatlari ko‘rsatiladi
- [ ] Foydalanuvchiga ko‘rinadigan matnlar lokalizatsiyadan
- [ ] Widget kichik va bitta vazifaga ega (SRP)
- [ ] Semantics / accessibility kerak bo‘lsa qo‘shilgan
- [ ] Responsive yoki minimal o‘lchamlar hisobga olingan

---

[← SOLID qoidalari](SOLID_RULES.md) | [Loyiha qoidalari](PROJECT_RULES.md)
