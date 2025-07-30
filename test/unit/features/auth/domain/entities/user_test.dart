import 'package:flutter_test/flutter_test.dart';
import 'package:panda/features/auth/domain/entities/user.dart';
import 'package:panda/features/auth/domain/value_objects/email.dart';
import 'package:panda/features/auth/domain/value_objects/password.dart';

void main() {
  group('User', () {
    setUp(() {
      // Setup code if needed in the future
    });
    
    test('should create user with all required fields', () {
      final user = User(
        id: '1',
        name: 'Test User',
        email: Email('test@example.com'),
        password: Password('TestPass123'),
        createdAt: DateTime(2023, 1, 1),
      );
      
      expect(user.id, '1');
      expect(user.name, 'Test User');
      expect(user.email.value, 'test@example.com');
      expect(user.password.value, 'TestPass123');
      expect(user.createdAt, DateTime(2023, 1, 1));
      expect(user.updatedAt, null);
    });
    
    test('should create user with updatedAt field', () {

      final user = User(
        id: '1',
        name: 'Test User',
        email: Email('test@example.com'),
        password: Password('TestPass123'),
        createdAt: DateTime(2023, 1, 1),
        updatedAt: DateTime(2023, 1, 2),
      );
      
      expect(user.updatedAt, DateTime(2023, 1, 2));
    });
    
    test('should copy user with new values', () {
      final originalUser = User(
        id: '1',
        name: 'Original Name',
        email: Email('original@example.com'),
        password: Password('OriginalPass123'),
        createdAt: DateTime(2023, 1, 1),
      );
      
      final copiedUser = originalUser.copyWith(
        name: 'New Name',
        email: Email('new@example.com'),
      );
      
      expect(copiedUser.id, '1');
      expect(copiedUser.name, 'New Name');
      expect(copiedUser.email.value, 'new@example.com');
      expect(copiedUser.password.value, 'OriginalPass123');
      expect(copiedUser.createdAt, DateTime(2023, 1, 1));
    });
    
    test('should be equal when all properties are equal', () {
      final user1 = User(
        id: '1',
        name: 'Test User',
        email: Email('test@example.com'),
        password: Password('TestPass123'),
        createdAt: DateTime(2023, 1, 1),
      );
      
      final user2 = User(
        id: '1',
        name: 'Test User',
        email: Email('test@example.com'),
        password: Password('TestPass123'),
        createdAt: DateTime(2023, 1, 1),
      );
      
      expect(user1, equals(user2));
    });
    
    test('should not be equal when properties are different', () {
      final user1 = User(
        id: '1',
        name: 'Test User',
        email: Email('test@example.com'),
        password: Password('TestPass123'),
        createdAt: DateTime(2023, 1, 1),
      );
      
      final user2 = User(
        id: '2',
        name: 'Test User',
        email: Email('test@example.com'),
        password: Password('TestPass123'),
        createdAt: DateTime(2023, 1, 1),
      );
      
      expect(user1, isNot(equals(user2)));
    });
  });
} 