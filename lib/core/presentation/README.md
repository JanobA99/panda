# Panda App Core Features

Bu papka Panda ilovasining asosiy funksiyalarini o'z ichiga oladi.

## 🚀 Yangi Qo'shilgan Funksiyalar

### 1. Go Router Navigation
`go_router` paketi orqali navigation:

```dart
// Navigate to next screen
context.go('/location-permission');

// Go back
context.pop();

// Navigate with parameters
context.go('/profile/${userId}');
```

### 2. ScreenUtil Responsive Design
`flutter_screenutil` paketi orqali responsive dizayn:

```dart
// Responsive dimensions
SizedBox(
  width: 120.w,    // Width based on screen size
  height: 48.h,    // Height based on screen size
  child: Text(
    'Hello',
    style: TextStyle(fontSize: 16.sp), // Responsive font size
  ),
)
```

### 3. Localization (intl)
`flutter_localizations` va `intl` paketlari orqali ko'p tillilik:

```dart
// Get localized text
final l10n = AppLocalizations.of(context)!;
Text(l10n.continue);

// Language service
final languageService = Provider.of<LanguageService>(context);
languageService.setLanguage('uz');
```

## 📱 Responsive Design

### ScreenUtil Usage

```dart
// Dimensions
double width = 100.w;    // Responsive width
double height = 50.h;    // Responsive height
double radius = 8.r;     // Responsive radius

// Font sizes
TextStyle(
  fontSize: 16.sp,       // Responsive font size
  fontWeight: FontWeight.w600,
)

// Margins and padding
EdgeInsets.all(24.w);    // Responsive padding
SizedBox(height: 16.h);  // Responsive spacing
```

### Design Size Configuration

```dart
ScreenUtilInit(
  designSize: const Size(375, 812), // iPhone X design size
  minTextAdapt: true,
  splitScreenMode: true,
  builder: (context, child) {
    return MaterialApp.router(
      // App configuration
    );
  },
)
```

## 🌍 Localization

### Supported Languages
- **English** (`en`) - Default
- **Russian** (`ru`) - Primary
- **Uzbek** (`uz`) - Secondary

### Language Files
- `lib/core/presentation/l10n/app_en.arb` - English
- `lib/core/presentation/l10n/app_ru.arb` - Russian
- `lib/core/presentation/l10n/app_uz.arb` - Uzbek

### Usage Examples

```dart
// Get localized text
final l10n = AppLocalizations.of(context)!;

// Button text
PandaButton(
  text: l10n.continue,
  onPressed: () {},
)

// Region names
List<String> regions = [
  l10n.tashkentRegion,
  l10n.samarkandRegion,
  l10n.bukharaRegion,
];
```

### Language Service

```dart
// Get current language
final languageService = Provider.of<LanguageService>(context);
String currentLang = languageService.getLanguageCode();

// Change language
await languageService.setLanguage('uz');

// Check language
if (languageService.isUzbek()) {
  // Uzbek specific logic
}
```

## 🛣️ Navigation with Go Router

### Route Configuration

```dart
GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      name: 'language-selection',
      builder: (context, state) => const LanguageSelectionPage(),
    ),
    GoRoute(
      path: '/location-permission',
      name: 'location-permission',
      builder: (context, state) => const LocationPermissionPage(),
    ),
    // More routes...
  ],
)
```

### Navigation Methods

```dart
// Navigate to route
context.go('/location-permission');

// Navigate with name
context.goNamed('location-permission');

// Go back
context.pop();

// Replace current route
context.go('/login');
```

## 🔧 Setup Instructions

### 1. Dependencies Installation

```bash
flutter pub get
```

### 2. Code Generation

```bash
# Generate localization files
flutter packages pub run build_runner build --delete-conflicting-outputs

# Generate dependency injection
flutter packages pub run build_runner build
```

### 3. Run the App

```bash
flutter run
```

## 📋 Features Checklist

- [x] **Go Router Navigation** - Modern navigation system
- [x] **ScreenUtil Responsive Design** - Responsive UI components
- [x] **Localization (intl)** - Multi-language support
- [x] **Language Service** - Language management
- [x] **Responsive Buttons** - All buttons use ScreenUtil
- [x] **Localized Text** - All text uses localization
- [x] **Navigation Integration** - All navigation uses go_router

## 🎯 Benefits

### 1. **Responsive Design**
- Works on all screen sizes
- Consistent UI across devices
- Better user experience

### 2. **Multi-language Support**
- Support for 3 languages
- Easy to add more languages
- Persistent language selection

### 3. **Modern Navigation**
- Type-safe navigation
- Deep linking support
- Better performance

### 4. **Clean Architecture**
- Separation of concerns
- Testable components
- Maintainable code

## 🚀 Next Steps

1. **Add More Languages** - Support for more languages
2. **Deep Linking** - Configure deep linking for go_router
3. **Animations** - Add page transition animations
4. **Testing** - Write tests for new features
5. **Performance** - Optimize for better performance 