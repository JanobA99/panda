import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:dartz/dartz.dart';
import 'package:panda/features/auth/domain/entities/user.dart';
import 'package:panda/features/auth/domain/repositories/auth_repository.dart';
import 'package:panda/features/auth/domain/usecases/login_usecase.dart';
import 'package:panda/features/auth/domain/value_objects/email.dart';
import 'package:panda/features/auth/domain/value_objects/password.dart';

@GenerateMocks([AuthRepository])
import 'login_usecase_test.mocks.dart';

void main() {
  late LoginUseCase useCase;
  late MockAuthRepository mockRepository;
  
  setUp(() {
    mockRepository = MockAuthRepository();
    useCase = LoginUseCase(mockRepository);
  });
  
  const testEmail = 'test@example.com';
  const testPassword = 'TestPass123';
  const testParams = LoginParams(email: testEmail, password: testPassword);
  
  group('LoginUseCase', () {
    test('should return user when login is successful', () async {
      // arrange
      final testUser = User(
        id: '1',
        name: 'Test User',
        email: Email('test@example.com'),
        password: Password('TestPass123'),
        createdAt: DateTime(2023, 1, 1),
      );
      
      when(mockRepository.login(testEmail, testPassword))
          .thenAnswer((_) async => testUser);
      
      // act
      final result = await useCase(testParams);
      
      // assert
      expect(result, Right(testUser));
      verify(mockRepository.login(testEmail, testPassword));
      verifyNoMoreInteractions(mockRepository);
    });
    
    test('should return ValidationFailure when login returns null', () async {
      // arrange
      when(mockRepository.login(testEmail, testPassword))
          .thenAnswer((_) async => null);
      
      // act
      final result = await useCase(testParams);
      
      // assert
      expect(result.isLeft(), true);
      expect(result.fold(
        (failure) => failure.message,
        (user) => '',
      ), 'Invalid email or password');
      verify(mockRepository.login(testEmail, testPassword));
      verifyNoMoreInteractions(mockRepository);
    });
    
    test('should return ServerFailure when repository throws exception', () async {
      // arrange
      when(mockRepository.login(testEmail, testPassword))
          .thenThrow(Exception('Server error'));
      
      // act
      final result = await useCase(testParams);
      
      // assert
      expect(result.isLeft(), true);
      expect(result.fold(
        (failure) => failure.message,
        (user) => '',
      ), 'Login failed: Exception: Server error');
      verify(mockRepository.login(testEmail, testPassword));
      verifyNoMoreInteractions(mockRepository);
    });
  });
} 