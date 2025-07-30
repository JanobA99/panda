# Panda Button Components

Bu papka Panda ilovasi uchun yaratilgan qayta ishlatiluvchi button componentlarini o'z ichiga oladi.

## 🎯 Componentlar

### 1. PandaButton
Asosiy button componenti. 3 xil turda ishlatiladi:

```dart
// Primary button (dark gray background, white text)
PandaButton(
  text: 'Продолжить',
  type: PandaButtonType.primary,
  onPressed: () {
    // Handle button press
  },
)

// Secondary button (white background, dark gray border)
PandaButton(
  text: 'Указать местоположение',
  type: PandaButtonType.secondary,
  onPressed: () {
    // Handle button press
  },
)

// Outline button (white background, dark gray border)
PandaButton(
  text: 'Cancel',
  type: PandaButtonType.outline,
  onPressed: () {
    // Handle button press
  },
)
```

### 2. LanguageSelectionButton
Til tanlash uchun maxsus button:

```dart
LanguageSelectionButton(
  languageName: 'O\'zbekcha',
  isSelected: selectedLanguage == 'O\'zbekcha',
  onPressed: () {
    setState(() {
      selectedLanguage = 'O\'zbekcha';
    });
  },
)
```

### 3. RegionListItem
Hudud tanlash uchun list item:

```dart
RegionListItem(
  regionName: 'Ташкентская область',
  onTap: () {
    // Handle region selection
  },
)
```

### 4. PandaSearchBar
Qidiruv uchun search bar:

```dart
PandaSearchBar(
  controller: searchController,
  hintText: 'Поиск',
  onChanged: (value) {
    // Handle search
  },
)
```

### 5. PandaHeader
Sahifa headeri:

```dart
PandaHeader(
  title: 'Местоположение',
  onBackPressed: () {
    Navigator.pop(context);
  },
)
```

## 🎨 Dizayn

Barcha componentlar Panda ilovasining dizayn standartlariga mos keladi:

- **Primary Color**: `#2C2C2C` (Dark Gray)
- **Background**: `#FFFFFF` (White)
- **Border Radius**: 8px
- **Typography**: System font, 16px, 600 weight

## 📱 Foydalanish

### 1. Import qilish

```dart
import 'package:your_app/core/presentation/widgets/widgets.dart';
```

### 2. Onboarding Flow

```dart
// Language Selection
LanguageSelectionPage()

// Location Permission
LocationPermissionPage()

// Location Selection
LocationSelectionPage()

// Login
LoginPage()
```

### 3. Navigation

```dart
// Next screen
Navigator.pushNamed(context, '/location-permission');

// Back
Navigator.pop(context);
```

## 🔧 Customization

### Button Styles

```dart
PandaButton(
  text: 'Custom Button',
  type: PandaButtonType.primary,
  width: 200,
  height: 50,
  padding: EdgeInsets.symmetric(horizontal: 20),
  isLoading: true,
)
```

### Search Bar

```dart
PandaSearchBar(
  controller: controller,
  hintText: 'Custom hint',
  readOnly: false,
  onTap: () {
    // Handle tap
  },
)
```

## 🧪 Testing

Har bir component uchun test yozish mumkin:

```dart
testWidgets('PandaButton shows correct text', (WidgetTester tester) async {
  await tester.pumpWidget(
    MaterialApp(
      home: PandaButton(
        text: 'Test Button',
        onPressed: () {},
      ),
    ),
  );
  
  expect(find.text('Test Button'), findsOneWidget);
});
```

## 📋 Checklist

- [x] PandaButton - Asosiy button componenti
- [x] LanguageSelectionButton - Til tanlash buttoni
- [x] RegionListItem - Hudud tanlash itemi
- [x] PandaSearchBar - Qidiruv bar
- [x] PandaHeader - Sahifa headeri
- [x] Onboarding pages - 3 ta onboarding sahifasi
- [x] Navigation - Sahifalar orasida o'tish
- [x] Documentation - Foydalanish bo'yicha hujjatlar

## 🚀 Keyingi qadamlar

1. **State Management**: Bloc/Cubit qo'shish
2. **Localization**: Til fayllarini qo'shish
3. **Persistence**: Tanlangan til va hududni saqlash
4. **Testing**: Unit va widget testlarini yozish
5. **Animation**: Sahifalar orasida animatsiya 