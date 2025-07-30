import '../entities/base_entity.dart';

abstract class BaseRepository<T extends BaseEntity> {
  Future<List<T>> getAll();
  Future<T?> getById(String id);
  Future<T> create(T entity);
  Future<T> update(T entity);
  Future<bool> delete(String id);
} 