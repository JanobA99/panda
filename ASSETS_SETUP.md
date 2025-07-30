# Assets va Fontlar Sozlash

Bu hujjat Panda ilovasida assets va fontlarni qanday sozlash va ishlatish haqida ma'lumot beradi.

## 📁 Assets Folderni YAMLga Qo'shish

### pubspec.yaml Faylida O'zgarishlar

```yaml
flutter:
  assets:
    - assets/images/
    - assets/fonts/
```

Bu qatorlar assets papkalarini ilovaga qo'shadi va ularni ishlatish imkonini beradi.

## 🎨 Gilroy Fontlarini Sozlash

### Font Konfiguratsiyasi

```yaml
fonts:
  - family: Gilroy
    fonts:
      - asset: assets/fonts/Gilroy-Thin.ttf
        weight: 100
      - asset: assets/fonts/Gilroy-UltraLight.ttf
        weight: 200
      - asset: assets/fonts/Gilroy-Light.ttf
        weight: 300
      - asset: assets/fonts/Gilroy-Regular.ttf
        weight: 400
      - asset: assets/fonts/Gilroy-Medium.ttf
        weight: 500
      - asset: assets/fonts/Gilroy-SemiBold.ttf
        weight: 600
      - asset: assets/fonts/Gilroy-Bold.ttf
        weight: 700
      - asset: assets/fonts/Gilroy-ExtraBold.ttf
        weight: 800
      - asset: assets/fonts/Gilroy-Black.ttf
        weight: 900
      - asset: assets/fonts/Gilroy-Heavy.ttf
        weight: 900
```

### Font Ishlatish

```dart
// Theme orqali butun appda
theme: AppTheme.lightTheme,

// Yoki alohida widgetda
Text(
  'Hello World',
  style: TextStyle(
    fontFamily: 'Gilroy',
    fontWeight: FontWeight.w600,
  ),
)
```

## 🖼️ Images Class Yaratish

### AppImages Class

```dart
/// AppImages class provides centralized access to all image assets in the app
class AppImages {
  // Private constructor to prevent instantiation
  AppImages._();

  // Base path for images
  static const String _basePath = 'assets/images/';

  // Image assets
  static const String geo = '${_basePath}geo.png';
  static const String panda = '${_basePath}panda.png';

  // Method to get all images (useful for asset preloading)
  static List<String> get allImages => [
        geo,
        panda,
      ];
}
```

### Images Ishlatish

```dart
// Import qilish
import 'package:your_app/core/presentation/utils/app_images.dart';

// Widgetda ishlatish
Image.asset(
  AppImages.panda,
  width: 120.w,
  height: 120.h,
)

Image.asset(
  AppImages.geo,
  width: 50.w,
  height: 50.h,
)
```

## 🎨 Theme Konfiguratsiyasi

### AppTheme Class

```dart
class AppTheme {
  static const String fontFamily = 'Gilroy';
  
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      fontFamily: fontFamily,
      // ... boshqa theme sozlamalari
    );
  }
}
```

### Theme Ishlatish

```dart
// main.dart faylida
MaterialApp.router(
  theme: AppTheme.lightTheme,
  // ... boshqa sozlamalar
)
```

## 📱 Foydalanish Misollari

### 1. Language Selection Page

```dart
// Panda logotipini ko'rsatish
Image.asset(
  AppImages.panda,
  width: 120.w,
  height: 120.h,
)
```

### 2. Geo Icon Ishlatish

```dart
// Geo ikonini ko'rsatish
Image.asset(
  AppImages.geo,
  width: 24.w,
  height: 24.h,
)
```

### 3. Font Ishlatish

```dart
// Gilroy font bilan text
Text(
  'Panda App',
  style: Theme.of(context).textTheme.headlineLarge,
)
```

## 🔧 O'zgarishlar

### 1. Yangi Image Qo'shish

```dart
// app_images.dart faylida
static const String newImage = '${_basePath}new_image.png';

// allImages listiga qo'shish
static List<String> get allImages => [
      geo,
      panda,
      newImage, // Yangi image
    ];
```

### 2. Yangi Font Qo'shish

```yaml
# pubspec.yaml faylida
fonts:
  - family: Gilroy
    fonts:
      # ... mavjud fontlar
      - asset: assets/fonts/Gilroy-Custom.ttf
        weight: 500
```

## 📋 Fayllar Ro'yxati

### Yangi Yaratilgan Fayllar

1. `lib/core/presentation/utils/app_images.dart` - Images class
2. `lib/core/presentation/utils/app_theme.dart` - Theme configuration
3. `lib/core/presentation/widgets/image_demo_widget.dart` - Demo widget

### O'zgartirilgan Fayllar

1. `pubspec.yaml` - Assets va fonts qo'shildi
2. `lib/main.dart` - Theme sozlandi
3. `lib/core/presentation/utils/constants.dart` - Export qo'shildi
4. `lib/features/onboarding/presentation/pages/language_selection_page.dart` - Panda image ishlatildi

## ✅ Natija

- ✅ Assets folder YAMLga qo'shildi
- ✅ Gilroy fontlar butun appda ishlatiladi
- ✅ Images uchun alohida class yaratildi
- ✅ Theme konfiguratsiyasi qo'shildi
- ✅ Demo widget yaratildi 