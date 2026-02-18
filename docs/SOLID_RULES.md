# SOLID qoidalari (SOLID Principles)

Loyihadagi barcha Dart/Flutter kodi quyidagi SOLID tamoyillariga muvofiq yozilishi kerak.

---

## S — Single Responsibility Principle (SRP)

**Har bir klass/funksiya faqat bitta mas’uliyatga ega bo‘ladi.**

- **Widget**: Faqat UI render; murakkab biznes mantiqi widget ichida yozilmasligi kerak.
- **Service/Repository**: Ma’lumot olish, saqlash yoki tashqi API bilan muloqot — bitta turdagi vazifa.
- **Model**: Faqat ma’lumot strukturasi (field’lar, fromJson/toJson); hisoblash yoki tarmoq so‘rovlari boshqa joyda.

**Misol (noto‘g‘ri):**  
Widget ichida API so‘rov va JSON parse qilish — SRP buziladi.

**Misol (to‘g‘ri):**  
`WeatherRepository` — faqat ma’lumot olish; `WeatherScreen` — faqat UI va foydalanuvchi harakati.

---

## O — Open/Closed Principle (OCP)

**Modullar kengaytirish uchun ochiq, o‘zgartirish uchun yopiq bo‘lishi kerak.**

- Yangi xatti-harakat yoki ko‘rinish qo‘shishda mavjud kodni minimal o‘zgartirish.
- **Abstract class / interface** (Dart’da `abstract class` va `implements`) orqali strategiyalar va xizmatlar almashtiriladi.
- Theme, locale, API provider kabi narsalar interface orqali inject qilinadi; yangi implementatsiya qo‘shilganda mavjud kod o‘zgarmaydi.

**Misol:**  
`WeatherDataSource` abstract class; `RemoteWeatherDataSource` va `LocalWeatherDataSource` implementatsiyalari. Yangi manba qo‘shishda faqat yangi klass va DI sozlamasi.

---

## L — Liskov Substitution Principle (LSP)

**Bazaviy tip o‘rniga uning ost-tipi qo‘yilsa, dastur xatti-harakati buzilmasligi kerak.**

- `extends` yoki `implements` qilingan klasslar bazaviy kontraktni buzmasligi kerak (qaytish tiplari, exception’lar, pre/post shartlar).
- Flutter’da: agar `WeatherRepository` interface bo‘lsa, uning barcha implementatsiyalari bir xil metod imzosiga ega bo‘lishi va kutilgan natijani berishi kerak.

**Misol:**  
`CacheWeatherRepository` `WeatherRepository` ni implement qilsa, `getWeather(city)` har doim bir xil turdagi obyekt (yoki exception) qaytarishi kerak; chaqiruvchi uchun farqi bo‘lmasligi kerak.

---

## I — Interface Segregation Principle (ISP)

**Katta, “semir” interfeyslar o‘rniga kichik va maqsadli interfeyslar.**

- Bir nechta alohida interfeys yaxshiroq: masalan, `WeatherFetcher`, `WeatherCache`, `LocationProvider` — bitta ulkan `WeatherService` o‘rniga.
- Client (widget, presenter) faqat o‘zi ishlatadigan metodlarni ko‘radi; ortiqcha metodlar majburiy emas.

**Misol:**  
Ob-havo ekrani faqat “ob-havo olish” kerak bo‘lsa, `WeatherFetcher` yetadi; cache’ni to‘ldirish yoki tozalash alohida interface orqali boshqa joyda ishlatiladi.

---

## D — Dependency Inversion Principle (DIP)

**Yuqori darajadagi modullar past darajadagi modullarga bog‘liq bo‘lmasligi kerak; ikkalasi abstraksiyaga (interface) bog‘langan bo‘lishi kerak.**

- Widget’lar va screen’lar to‘g‘ridan-to‘g‘ri `http` yoki konkret repository klassiga bog‘lanmasligi kerak.
- **Constructor orqali inject qilish**: repository, data source, theme — hammasi abstract type (interface) sifatida beriladi.
- Testda mock/fake implementatsiyalarni osongina almashtirish mumkin bo‘lishi kerak.

**Misol:**  
`WeatherScreen(repository: WeatherRepository)` — `WeatherRepository` abstract class/interface. `main.dart` yoki DI container’da `RemoteWeatherRepository` yoki test uchun `FakeWeatherRepository` beriladi.

---

## Flutter loyihasida qisqacha qo‘llash

| Tamoyil | Qo‘llash |
|--------|----------|
| **SRP** | Screen — UI; Repository — ma’lumot; Model — ma’lumot strukturasi; Service — bitta tashqi xizmat. |
| **OCP** | Theme, data source, locale — interface orqali; yangi variantlar yangi klass qo‘shish orqali. |
| **LSP** | Har qanday `WeatherRepository` implementatsiyasi bir xil kontraktga rioya qiladi. |
| **ISP** | Kichik interface’lar: `WeatherFetcher`, `WeatherCache`, `LocationProvider`. |
| **DIP** | Barcha screen/widget’lar faqat abstract repository/service’larga bog‘langan; implementatsiya `main` yoki DI’da. |

---

[← Loyiha qoidalari](PROJECT_RULES.md) | [UI qoidalari →](UI_RULES.md)
