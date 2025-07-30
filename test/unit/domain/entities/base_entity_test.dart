import 'package:flutter_test/flutter_test.dart';
import 'package:panda/core/domain/entities/base_entity.dart';

class TestEntity extends BaseEntity {
  final String name;
  
  const TestEntity({required super.id, required this.name});
  
  List<Object?> get props => [id, name];
}

void main() {
  group('BaseEntity', () {
    test('should create entity with id', () {
      const entity = TestEntity(id: '1', name: 'Test');
      
      expect(entity.id, '1');
      expect(entity.name, 'Test');
    });
    
    test('should be equal when ids are equal', () {
      const entity1 = TestEntity(id: '1', name: 'Test1');
      const entity2 = TestEntity(id: '1', name: 'Test2');
      
      expect(entity1, equals(entity2));
    });
    
    test('should not be equal when ids are different', () {
      const entity1 = TestEntity(id: '1', name: 'Test');
      const entity2 = TestEntity(id: '2', name: 'Test');
      
      expect(entity1, isNot(equals(entity2)));
    });
    
    test('should have correct hashCode', () {
      const entity = TestEntity(id: '1', name: 'Test');
      
      expect(entity.hashCode, equals('1'.hashCode));
    });
  });
} 