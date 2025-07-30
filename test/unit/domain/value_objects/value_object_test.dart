import 'package:flutter_test/flutter_test.dart';
import 'package:panda/core/domain/value_objects/value_object.dart';

class TestValueObject extends ValueObject<String> {
  const TestValueObject(super.value);
}

void main() {
  group('ValueObject', () {
    test('should create value object with value', () {
      const valueObject = TestValueObject('test');
      
      expect(valueObject.value, 'test');
    });
    
    test('should be equal when values are equal', () {
      const valueObject1 = TestValueObject('test');
      const valueObject2 = TestValueObject('test');
      
      expect(valueObject1, equals(valueObject2));
    });
    
    test('should not be equal when values are different', () {
      const valueObject1 = TestValueObject('test1');
      const valueObject2 = TestValueObject('test2');
      
      expect(valueObject1, isNot(equals(valueObject2)));
    });
    
    test('should have correct hashCode', () {
      const valueObject = TestValueObject('test');
      
      expect(valueObject.hashCode, equals('test'.hashCode));
    });
    
    test('should return correct string representation', () {
      const valueObject = TestValueObject('test');
      
      expect(valueObject.toString(), 'test');
    });
  });
} 