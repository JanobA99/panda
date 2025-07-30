import 'package:flutter_test/flutter_test.dart';
import 'package:panda/core/domain/failures/failures.dart';

void main() {
  group('Failure', () {
    test('should create failure with message', () {
      const failure = ServerFailure('Server error');
      
      expect(failure.message, 'Server error');
    });
    
    test('should return correct string representation', () {
      const failure = ServerFailure('Server error');
      
      expect(failure.toString(), 'Server error');
    });
  });
  
  group('ServerFailure', () {
    test('should create server failure', () {
      const failure = ServerFailure('Server error');
      
      expect(failure, isA<Failure>());
      expect(failure.message, 'Server error');
    });
  });
  
  group('CacheFailure', () {
    test('should create cache failure', () {
      const failure = CacheFailure('Cache error');
      
      expect(failure, isA<Failure>());
      expect(failure.message, 'Cache error');
    });
  });
  
  group('NetworkFailure', () {
    test('should create network failure', () {
      const failure = NetworkFailure('Network error');
      
      expect(failure, isA<Failure>());
      expect(failure.message, 'Network error');
    });
  });
  
  group('ValidationFailure', () {
    test('should create validation failure', () {
      const failure = ValidationFailure('Validation error');
      
      expect(failure, isA<Failure>());
      expect(failure.message, 'Validation error');
    });
  });
} 