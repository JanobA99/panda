# Regions Feature

Bu feature hududlar (regions) bilan ishlash uchun yaratilgan. API dan ma'lumotlarni olib, tilga qarab dinamik ravishda o'zgartiradi.

## 🏗️ Arxitektura

### Domain Layer
- **Region Entity**: Hudud ma'lumotlari
- **RegionRepository**: Repository interface
- **Use Cases**: Business logic

### Infrastructure Layer
- **RegionRemoteDataSource**: API dan ma'lumotlarni olish
- **RegionRepositoryImpl**: Repository implementation

### Application Layer
- **RegionsBloc**: State management

## 📊 Region Entity

```dart
class Region extends Equatable {
  final String id;
  final String name;
  final String nameEn;    // English name
  final String nameRu;    // Russian name
  final String nameUz;    // Uzbek name
  final String code;      // Region code
  final bool isActive;    // Active status
}
```

### Tilga qarab nom olish

```dart
String getNameByLanguage(String languageCode) {
  switch (languageCode) {
    case 'en': return nameEn;
    case 'ru': return nameRu;
    case 'uz': return nameUz;
    default: return nameEn;
  }
}
```

## 🌍 Tilga qarab o'zgarish

### 1. Hudud nomlari
- **English**: "Tashkent Region"
- **Russian**: "Ташкентская область"
- **Uzbek**: "Toshkent viloyati"

### 2. Dinamik o'zgarish
```dart
// Hudud nomini tanlangan tilga qarab olish
final regionName = region.getNameByLanguage(languageService.getLanguageCode());
```

## 🔄 API Simulation

### Fake Data
Hududlar API dan kelganday ko'rsatiladi:

```dart
// Simulate API delay
await Future.delayed(const Duration(milliseconds: 500));

// Return fake data as if from API
return [
  const Region(
    id: '1',
    name: 'Andijan Region',
    nameEn: 'Andijan Region',
    nameRu: 'Андижанская область',
    nameUz: 'Andijon viloyati',
    code: 'AN',
  ),
  // ... more regions
];
```

### Hududlar ro'yxati
1. **Andijan Region** - Andijon viloyati
2. **Bukhara Region** - Buxoro viloyati
3. **Jizzakh Region** - Jizzax viloyati
4. **Karakalpakstan** - Qoraqalpog'iston
5. **Navoiy Region** - Navoiy viloyati
6. **Samarkand Region** - Samarqand viloyati
7. **Tashkent Region** - Toshkent viloyati
8. **Namangan Region** - Namangan viloyati
9. **Fergana Region** - Farg'ona viloyati
10. **Khorezm Region** - Xorazm viloyati
11. **Surkhandarya Region** - Surxondaryo viloyati
12. **Syrdarya Region** - Sirdaryo viloyati

## 🔍 Qidiruv funksiyasi

### Qidiruv logikasi
```dart
return regions.where((region) {
  final searchQuery = query.toLowerCase();
  return region.nameEn.toLowerCase().contains(searchQuery) ||
         region.nameRu.toLowerCase().contains(searchQuery) ||
         region.nameUz.toLowerCase().contains(searchQuery) ||
         region.code.toLowerCase().contains(searchQuery);
}).toList();
```

### Qidiruv tillari
- **English**: "Tashkent" → "Tashkent Region"
- **Russian**: "Ташкент" → "Ташкентская область"
- **Uzbek**: "Toshkent" → "Toshkent viloyati"
- **Code**: "TO" → "Tashkent Region"

## 🎯 Bloc States

### States
- **RegionsInitial**: Boshlang'ich holat
- **RegionsLoading**: Yuklanish holati
- **RegionsLoaded**: Ma'lumotlar yuklandi
- **RegionsError**: Xatolik holati

### Events
- **LoadRegions**: Barcha hududlarni yuklash
- **SearchRegions**: Hududlarni qidirish
- **ClearSearch**: Qidiruvni tozalash

## 📱 UI Integration

### Location Selection Page
```dart
BlocBuilder<RegionsBloc, RegionsState>(
  builder: (context, state) {
    if (state is RegionsLoading) {
      return const CircularProgressIndicator();
    } else if (state is RegionsLoaded) {
      return ListView.builder(
        itemBuilder: (context, index) {
          final region = state.regions[index];
          return RegionListItem(
            regionName: region.getNameByLanguage(
              languageService.getLanguageCode(),
            ),
            onTap: () => context.go('/login'),
          );
        },
      );
    }
  },
)
```

## 🚀 Foydalanish

### 1. Bloc Provider
```dart
BlocProvider(
  create: (context) => RegionsBloc(
    getRegionsUseCase: GetRegionsUseCase(repository),
    searchRegionsUseCase: SearchRegionsUseCase(repository),
  )..add(LoadRegions()),
  child: LocationSelectionPage(),
)
```

### 2. Qidiruv
```dart
// Qidiruv so'zi o'zgarganda
context.read<RegionsBloc>().add(SearchRegions(query));
```

### 3. Til o'zgarishi
```dart
// Til o'zgarganda hudud nomlari avtomatik o'zgaradi
final regionName = region.getNameByLanguage(languageService.getLanguageCode());
```

## 🎨 Features

- ✅ **Multi-language Support**: 3 tilda hudud nomlari
- ✅ **Dynamic Language Change**: Til o'zgarganda avtomatik o'zgarish
- ✅ **Search Functionality**: Barcha tillarda qidiruv
- ✅ **API Simulation**: Haqiqiy API dan kelganday
- ✅ **Loading States**: Yuklanish holatlari
- ✅ **Error Handling**: Xatoliklar bilan ishlash
- ✅ **Clean Architecture**: Toza arxitektura

## 🔧 Keyingi qadamlar

1. **Real API Integration**: Haqiqiy API ga ulanish
2. **Caching**: Hududlarni cache qilish
3. **Offline Support**: Offline rejimda ishlash
4. **Pagination**: Katta ro'yxatlar uchun
5. **Favorites**: Sevimli hududlar 