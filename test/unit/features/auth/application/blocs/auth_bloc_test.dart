import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:panda/core/domain/failures/failures.dart';
import 'package:panda/features/auth/domain/entities/user.dart';
import 'package:panda/features/auth/domain/usecases/login_usecase.dart';
import 'package:panda/features/auth/application/blocs/auth_bloc.dart';
import 'package:panda/features/auth/domain/value_objects/email.dart';
import 'package:panda/features/auth/domain/value_objects/password.dart';

@GenerateMocks([LoginUseCase])
import 'auth_bloc_test.mocks.dart';

void main() {
  late AuthBloc authBloc;
  late MockLoginUseCase mockLoginUseCase;
  
  setUp(() {
    mockLoginUseCase = MockLoginUseCase();
    authBloc = AuthBloc(loginUseCase: mockLoginUseCase);
  });
  
  tearDown(() {
    authBloc.close();
  });
  
  group('AuthBloc', () {
    const testEmail = 'test@example.com';
    const testPassword = 'TestPass123';
    final testUser = User(
      id: '1',
      name: 'Test User',
      email: Email('test@example.com'),
      password: Password('TestPass123'),
      createdAt: DateTime(2023, 1, 1),
    );
    
    test('initial state should be AuthInitial', () {
      expect(authBloc.state, AuthInitial());
    });
    
    blocTest<AuthBloc, AuthState>(
      'emits [AuthLoading, AuthSuccess] when login is successful',
      build: () {
        when(mockLoginUseCase(any))
            .thenAnswer((_) async => Right(testUser));
        return authBloc;
      },
      act: (bloc) => bloc.add(LoginRequested(
        email: testEmail,
        password: testPassword,
      )),
      expect: () => [
        AuthLoading(),
        AuthSuccess(testUser),
      ],
      verify: (_) {
        verify(mockLoginUseCase(any)).called(1);
      },
    );
    
    blocTest<AuthBloc, AuthState>(
      'emits [AuthLoading, AuthFailure] when login fails',
      build: () {
        when(mockLoginUseCase(any))
            .thenAnswer((_) async => Left(ValidationFailure('Invalid credentials')));
        return authBloc;
      },
      act: (bloc) => bloc.add(LoginRequested(
        email: testEmail,
        password: testPassword,
      )),
      expect: () => [
        AuthLoading(),
        AuthFailure('Invalid credentials'),
      ],
      verify: (_) {
        verify(mockLoginUseCase(any)).called(1);
      },
    );
    
    blocTest<AuthBloc, AuthState>(
      'emits [AuthInitial] when logout is requested',
      build: () => authBloc,
      act: (bloc) => bloc.add(LogoutRequested()),
      expect: () => [AuthInitial()],
    );
  });
} 