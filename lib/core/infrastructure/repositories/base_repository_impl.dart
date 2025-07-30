import '../../domain/entities/base_entity.dart';
import '../../domain/repositories/base_repository.dart';
import '../datasources/base_datasource.dart';

abstract class BaseRepositoryImpl<T extends BaseEntity> implements BaseRepository<T> {
  final BaseDataSource<T> remoteDataSource;
  final BaseDataSource<T> localDataSource;
  
  const BaseRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
  });
  
  @override
  Future<List<T>> getAll() async {
    try {
      final remoteData = await remoteDataSource.getAll();
      await localDataSource.create(remoteData.first);
      return remoteData;
    } catch (e) {
      return await localDataSource.getAll();
    }
  }
  
  @override
  Future<T?> getById(String id) async {
    try {
      return await remoteDataSource.getById(id);
    } catch (e) {
      return await localDataSource.getById(id);
    }
  }
  
  @override
  Future<T> create(T entity) async {
    final createdEntity = await remoteDataSource.create(entity);
    await localDataSource.create(createdEntity);
    return createdEntity;
  }
  
  @override
  Future<T> update(T entity) async {
    final updatedEntity = await remoteDataSource.update(entity);
    await localDataSource.update(updatedEntity);
    return updatedEntity;
  }
  
  @override
  Future<bool> delete(String id) async {
    final remoteDeleted = await remoteDataSource.delete(id);
    await localDataSource.delete(id);
    return remoteDeleted;
  }
} 