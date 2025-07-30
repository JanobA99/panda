
import 'package:injectable/injectable.dart';
import 'package:panda/core/infrastructure/repositories/base_repository_impl.dart';

import '../../domain/entities/user.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasources/auth_remote_datasource.dart';

@Injectable(as: AuthRepository)
class AuthRepositoryImpl extends BaseRepositoryImpl<User> implements AuthRepository {
  @override
  final AuthRemoteDataSource remoteDataSource;
  @override
  final AuthRemoteDataSource localDataSource;
  
  AuthRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
  }) : super(
          remoteDataSource: remoteDataSource,
          localDataSource: localDataSource,
        );
  
  @override
  Future<User?> login(String email, String password) async {
    try {
      return await remoteDataSource.login(email, password);
    } catch (e) {
      return await localDataSource.login(email, password);
    }
  }
  
  @override
  Future<User?> register(String name, String email, String password) async {
    try {
      return await remoteDataSource.register(name, email, password);
    } catch (e) {
      return await localDataSource.register(name, email, password);
    }
  }
  
  @override
  Future<void> logout() async {
    try {
      await remoteDataSource.logout();
    } catch (e) {
      await localDataSource.logout();
    }
  }
  
  @override
  Future<User?> getCurrentUser() async {
    // Implementation for getting current user
    throw UnimplementedError();
  }
  
  @override
  Future<bool> isLoggedIn() async {
    // Implementation for checking if user is logged in
    throw UnimplementedError();
  }
} 