# Loyiha vazifalari (Project Tasks)

Quyida ilova uchun bajariladigan ishlar ro‘yxati. **bd (beads)** da muhimlik bo‘yicha issue’lar yaratilgan; har bir bo‘limga bd ID va prioritet yozilgan.

**bd buyruqlari:** `bd ready` — ishga tayyor ishlar | `bd show <id>` — batafsil | `bd update <id> --status=in_progress` — boshlash | `bd close <id>` — yopish.

---

## Muhimlik (Priority)

| Prioritet | Ma’no        | Issue’lar |
|-----------|--------------|-----------|
| **P1**    | Eng muhim    | Bottom nav, Login, Lokalizatsiya, Home |
| **P2**    | Keyingi qatlam | Info, News, Profile |
| **P4**    | Kelajak (backlog) | API, Cache, Testlar |

---

## 1. Lokalizatsiya (Localization) — **P1** · `flutter_weathermap-rt0`

- [ ] **1.1** 3 tilda qo‘llab-quvvatlash: **Rus**, **Ingliz**, **O‘zbek**.
- [ ] **1.2** Lokalizatsiya infrastrukturi: `flutter_localizations`, ARB (yoki boshqa) fayllar, `AppLocalizations` / delegate sozlash.
- [ ] **1.3** Til tanlash sahifasi: foydalanuvchi tilni tanlashi (RU / EN / UZ) va tanlangan til saqlanadi (masalan, SharedPreferences).
- [ ] **1.4** Ilova qolgan matnlarini barcha 3 tilda tarjima qilish va til o‘zgarishi bilan UI yangilanishi.

---

## 2. Login sahifasi (UI) — **P1** · `flutter_weathermap-e75`

- [ ] **2.1** Login sahifa UI: login (email/username) maydoni.
- [ ] **2.2** Parol maydoni (input).
- [ ] **2.3** “Kirish” tugmasi (sign in button).
- [ ] **2.4** Kerak bo‘lsa: “Parolni unutdim”, validatsiya xabarlari, loading holati (keyingi bosqichda mantiq qo‘shilishi mumkin).

---

## 3. Home sahifasi — **P1** · `flutter_weathermap-avw` (nav’dan keyin)

- [ ] **3.1** List ko‘rinishi: har bir element **card** ko‘rinishida.
- [ ] **3.2** Har bir card da: **title**, **subtitle**, **rasm** (image).
- [ ] **3.3** List scroll qilinar bo‘lishi va dizayn loyiha/UI qoidalariga mos bo‘lishi.

---

## 4. Bottom navigation bar — **P1** · `flutter_weathermap-rsa` (birinchi; Home/Info/News/Profile buni kutadi)

- [ ] **4.1** Pastki navigatsiya paneli: **4 ta tugma** — **Home**, **Info**, **New** (yoki News), **Profile**.
- [ ] **4.2** Tugmalar bosilganda mos sahifalarga o‘tish (Home, Info, News, Profile).
- [ ] **4.3** Tanlangan sahifa vizual ajratilishi (masalan, rang yoki ikonka o‘zgarishi).

---

## 5. Info sahifasi — **P2** · `flutter_weathermap-c36` (nav’dan keyin)

- [ ] **5.1** Vertikal list: har bir elementda **rasm**, **title**, **subtitle**.
- [ ] **5.2** List dizayni va scroll; kerak bo‘lsa card yoki list tile uslubi.

---

## 6. News sahifasi — **P2** · `flutter_weathermap-c7f` (nav’dan keyin)

- [ ] **6.1** Yangiliklar ro‘yxati: har bir yangilikda **katta rasm** va **pastida matn** (title/body).
- [ ] **6.2** Bitta yangilik ko‘rinishi (detail): katta rasm + to‘liq matn.
- [ ] **6.3** List va detail sahifalar navigatsiya bilan bog‘langan bo‘lishi.

---

## 7. Profile sahifasi — **P2** · `flutter_weathermap-lfd` (nav + lokalizatsiyadan keyin)

- [ ] **7.1** Foydalanuvchi bloki: **avatar** (rasm), **ism-sharif** (full name).
- [ ] **7.2** Sozlamalar ro‘yxati (settings list), masalan:
  - Dark mode (qorong‘u rejim) — toggle.
  - Tilni o‘zgartirish — til tanlash sahifasiga yo‘naltirish.
  - Bildirishnomalar (notifications) — yoqish/o‘chirish yoki sozlamalar.
- [ ] **7.3** Kerak bo‘lsa: Chiqish, Shaxsiy ma’lumotlar va boshqa bandlar (kelajakda kengaytirish).

---

## 8. Kelajakdagi qilinadigan ishlar (Future tasks) — **P4**

| bd ID | Vazifa |
|-------|--------|
| `flutter_weathermap-v7g` | Backend/API |
| `flutter_weathermap-1ax` | Cache/offline |
| `flutter_weathermap-c2f` | Test va sifat |

- [ ] **8.1** **Backend/API ulash**: Login autentifikatsiya, Home/Info/News ma’lumotlarini serverdan olish, xatolik va offline rejimni qayta ishlash.
- [ ] **8.2** **Ma’lumotlarni saqlash**: Cache (masalan, Hive/SharedPreferences), offline rejimda list va yangiliklarni ko‘rsatish.
- [ ] **8.3** **Sifat va test**: Unit/widget testlar (login, list, profile), lint va acessibility tekshiruvlari; kerak bo‘lsa CI/CD.

---

## Qisqacha indeks

| # | Bo‘lim            | bd ID | P   | Asosiy natija |
|---|-------------------|-------|-----|----------------|
| 1 | Lokalizatsiya     | `flutter_weathermap-rt0` | P1 | 3 til (RU, EN, UZ), til tanlash sahifasi |
| 2 | Login             | `flutter_weathermap-e75` | P1 | Login, parol, kirish tugmasi UI |
| 3 | Home              | `flutter_weathermap-avw` | P1 | Card list (title, subtitle, rasm) |
| 4 | Bottom nav        | `flutter_weathermap-rsa` | P1 | 4 tugma: Home, Info, News, Profile |
| 5 | Info              | `flutter_weathermap-c36` | P2 | Vertikal list (rasm, title, subtitle) |
| 6 | News              | `flutter_weathermap-c7f` | P2 | Katta rasm + pastida matn |
| 7 | Profile           | `flutter_weathermap-lfd` | P2 | Avatar, ism-sharif, sozlamalar |
| 8 | Kelajak           | `v7g`, `1ax`, `c2f` | P4 | API, cache/offline, testlar |

---

## Bog‘liqliklar (bd)

- **Bottom nav** (`rsa`) bajarilgach: Home, Info, News, Profile ochiladi.
- **Lokalizatsiya** (`rt0`) bajarilgach: Profile’dagi “til o‘zgartirish” ishlashi mumkin.

**Ishni boshlash:** `bd ready` → bloklanmagan P1 ishlar (Login, Bottom nav, Lokalizatsiya). Nav yopilgach `bd ready` da Home, Info, News chiqadi.

---

## Dependency chains (3 ta zanjir)

Bajarish tartibi va bloklash uchun quyidagi zanjirlar qo‘llanadi:

| # | Zanjir | Tartib (chapdan o‘ngga: birinchi → keyingi) |
|---|--------|--------------------------------------------|
| **1** | Kelajak (backend) | **API** (`v7g`) → **Cache** (`1ax`) → **Testlar** (`c2f`) |
| **2** | Ekranlar | **Bottom nav** (`rsa`) → **Home** (`avw`) → **Info** (`c36`) |
| **3** | Profile va test | **Bottom nav** (`rsa`) → **Profile** (`lfd`) → **Testlar** (`c2f`) |

- **Zanjir 1:** API bajarilgach Cache, Cache bajarilgach Testlar ochiladi.
- **Zanjir 2:** Nav bajarilgach Home, Home bajarilgach Info ochiladi.
- **Zanjir 3:** Nav bajarilgach Profile, Profile bajarilgach Testlar (profile/test qismi) ochiladi.

`c2f` (Testlar) ikkita blokerdan keyin ready bo‘ladi: `1ax` (Cache) va `lfd` (Profile). `bd blocked` — barcha bloklangan ishlarni ko‘rsatadi.

---

*Vazifalar bajarilganda `[ ]` → `[x]` va `bd close <id>` ishlatiladi.*
