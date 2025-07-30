# 🐼 Panda - Clean Architecture Flutter App

Bu loyiha Clean Architecture, Test-Driven Development (TDD) va Domain-Driven Design (DDD) patternlariga asoslangan Flutter ilovasi.

## 🏗️ Arxitektura Strukturasi

```
lib/
├── core/                           # Asosiy funksiyalar
│   ├── domain/                     # Domain layer
│   │   ├── entities/              # Domain entities
│   │   ├── value_objects/         # Value objects
│   │   ├── repositories/          # Repository interfaces
│   │   ├── usecases/              # Use case interfaces
│   │   └── failures/              # Error handling
│   ├── application/               # Application layer
│   │   └── services/              # Application services
│   ├── infrastructure/            # Infrastructure layer
│   │   ├── datasources/           # Data sources
│   │   ├── repositories/          # Repository implementations
│   │   └── services/              # Infrastructure services
│   ├── presentation/              # Presentation layer
│   │   ├── blocs/                 # State management
│   │   ├── widgets/               # Base widgets
│   │   └── utils/                 # Utilities
│   └── di/                        # Dependency injection
├── features/                      # Feature modules
│   └── auth/                      # Authentication feature
│       ├── domain/                # Domain layer
│       │   ├── entities/          # Domain entities
│       │   ├── value_objects/     # Value objects
│       │   ├── repositories/      # Repository interfaces
│       │   └── usecases/          # Use cases
│       ├── application/           # Application layer
│       │   └── blocs/             # State management
│       ├── infrastructure/        # Infrastructure layer
│       │   ├── datasources/       # Data sources
│       │   └── repositories/      # Repository implementations
│       └── presentation/          # Presentation layer
│           ├── blocs/             # Feature blocs
│           └── pages/             # UI pages
└── main.dart                      # Application entry point
```

## 📚 Layerlar

### 1. Domain Layer
- **Entities**: Business logic va domain rules
- **Value Objects**: Immutable objects with validation
- **Repositories**: Data access interfaces
- **Use Cases**: Business logic implementation
- **Failures**: Error handling

### 2. Application Layer
- **Services**: Application-level services
- **Use Cases**: Business logic orchestration

### 3. Infrastructure Layer
- **Data Sources**: External data access
- **Repository Implementations**: Data access implementation
- **Services**: Infrastructure services (Logger, Network)

### 4. Presentation Layer
- **Blocs**: State management
- **Widgets**: UI components
- **Pages**: Screen implementations

## 🧪 TDD (Test-Driven Development)

Har bir layer uchun testlar yaratilgan:

```
test/
├── unit/                          # Unit tests
│   ├── core/                      # Core tests
│   │   ├── domain/               # Domain tests
│   │   │   ├── entities/         # Entity tests
│   │   │   ├── value_objects/    # Value object tests
│   │   │   └── failures/         # Failure tests
│   │   ├── application/          # Application tests
│   │   └── infrastructure/       # Infrastructure tests
│   └── features/                 # Feature tests
│       └── auth/                 # Auth feature tests
│           ├── domain/           # Domain tests
│           │   ├── entities/     # User entity tests
│           │   └── usecases/     # Use case tests
│           └── application/      # Application tests
│               └── blocs/        # Bloc tests
├── widget/                        # Widget tests
└── integration/                   # Integration tests
```

## 🎯 DDD (Domain-Driven Design)

### Value Objects
- **Email**: Email validation va business rules
- **Password**: Password validation va security rules
- Immutable objects with validation logic
- Business rules enforcement

### Entities
- **User**: Identity-based user entity
- **BaseEntity**: Base entity with common functionality
- Business logic va domain rules

### Aggregates
- Consistency boundaries
- Transaction boundaries
- Domain invariants

## 🚀 Foydalanish

### 1. Yangi Feature Yaratish

```bash
# Feature strukturasi yaratish
mkdir -p lib/features/new_feature/{domain,application,infrastructure,presentation}
mkdir -p test/unit/features/new_feature/{domain,application}
```

### 2. Test Yozish (TDD)

```bash
# Unit test yaratish
mkdir -p test/unit/features/new_feature/domain/entities
mkdir -p test/unit/features/new_feature/domain/usecases
mkdir -p test/unit/features/new_feature/application/blocs
```

### 3. Dependency Injection

```dart
// Repository injection
final repository = AuthRepositoryImpl(
  remoteDataSource: AuthRemoteDataSourceImpl(),
  localDataSource: AuthLocalDataSourceImpl(),
);

// Use case injection
final loginUseCase = LoginUseCase(repository);

// Bloc injection
final authBloc = AuthBloc(loginUseCase: loginUseCase);
```

### 4. Value Object Yaratish

```dart
class Email extends ValueObject<String> {
  const Email(super.value);
  
  static Either<ValidationFailure, Email> create(String email) {
    if (email.isEmpty) {
      return Left(ValidationFailure('Email cannot be empty'));
    }
    
    if (!_isValidEmail(email)) {
      return Left(ValidationFailure('Invalid email format'));
    }
    
    return Right(Email(email));
  }
}
```

### 5. Use Case Yaratish

```dart
@injectable
class LoginUseCase implements UseCase<User, LoginParams> {
  final AuthRepository repository;
  
  const LoginUseCase(this.repository);
  
  @override
  Future<Either<Failure, User>> call(LoginParams params) async {
    try {
      final user = await repository.login(params.email, params.password);
      if (user != null) {
        return Right(user);
      } else {
        return Left(ValidationFailure('Invalid email or password'));
      }
    } catch (e) {
      return Left(ServerFailure('Login failed: ${e.toString()}'));
    }
  }
}
```

## 🔧 Asosiy Prinsiplar

1. **Dependency Inversion**: High-level modules don't depend on low-level modules
2. **Single Responsibility**: Har bir class bitta vazifaga ega
3. **Open/Closed**: Open for extension, closed for modification
4. **Testability**: Har bir component test qilish mumkin
5. **Separation of Concerns**: Har bir layer o'z vazifasiga ega
6. **SOLID Principles**: Clean code principles

## 📦 Paketlar

### Production Dependencies
- `dartz`: Functional programming (Either, Left, Right)
- `flutter_bloc`: State management
- `equatable`: Value equality
- `get_it`: Dependency injection
- `injectable`: Code generation for DI
- `dio`: HTTP client
- `connectivity_plus`: Network connectivity
- `shared_preferences`: Local storage
- `hive`: NoSQL database
- `logger`: Logging utility
- `intl`: Internationalization

### Development Dependencies
- `mockito`: Mocking for tests
- `build_runner`: Code generation
- `injectable_generator`: DI code generation
- `hive_generator`: Hive code generation
- `bloc_test`: Bloc testing
- `flutter_lints`: Code linting

## 🏃‍♂️ Ishga Tushirish

### 1. Dependencies o'rnatish
```bash
flutter pub get
```

### 2. Code generation
```bash
flutter packages pub run build_runner build --delete-conflicting-outputs
```

### 3. Testlarni ishga tushirish
```bash
# Barcha testlar
flutter test

# Unit testlar
flutter test test/unit/

# Widget testlar
flutter test test/widget/
```

### 4. Ilovani ishga tushirish
```bash
flutter run
```

## 📝 Test Yozish Qoidalari

### 1. Unit Tests
- Har bir class uchun alohida test file
- Arrange-Act-Assert pattern
- Mock dependencies

### 2. Bloc Tests
- State transitions test qilish
- Event handling test qilish
- Error handling test qilish

### 3. Widget Tests
- UI interactions test qilish
- Widget rendering test qilish

## 🎨 Code Style

- **Dart**: Effective Dart style guide
- **Flutter**: Flutter style guide
- **Clean Architecture**: Layer separation
- **TDD**: Test-first development
- **DDD**: Domain-driven design

## 🔍 Monitoring va Logging

- **Logger Service**: Centralized logging
- **Network Service**: Connectivity monitoring
- **Error Handling**: Comprehensive error management

## 📈 Performance

- **Lazy Loading**: Dependencies lazy loading
- **Memory Management**: Proper disposal
- **State Management**: Efficient state updates

## 🔒 Security

- **Value Objects**: Input validation
- **Repository Pattern**: Data access abstraction
- **Error Handling**: Secure error messages

## 🤝 Contributing

1. Feature branch yarating
2. Testlar yozing (TDD)
3. Code review o'tkazing
4. Merge qiling

## 📄 License

Bu loyiha MIT license ostida tarqatiladi.

---

**Eslatma**: Bu arxitektura katta va o'rta o'lchamdagi loyihalar uchun mo'ljallangan. Kichik loyihalar uchun soddalashtirilgan versiyasi ishlatilishi mumkin. 