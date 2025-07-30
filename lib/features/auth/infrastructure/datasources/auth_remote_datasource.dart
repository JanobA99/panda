import 'package:injectable/injectable.dart';
import '../../../../core/infrastructure/datasources/base_datasource.dart';
import '../../domain/entities/user.dart';

abstract class AuthRemoteDataSource extends BaseDataSource<User> {
  Future<User?> login(String email, String password);
  Future<User?> register(String name, String email, String password);
  Future<void> logout();
}

@Injectable(as: AuthRemoteDataSource)
class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final String baseUrl;
  
  AuthRemoteDataSourceImpl({required this.baseUrl});
  
  @override
  Future<List<User>> getAll() async {
    // Implementation for getting all users
    throw UnimplementedError();
  }
  
  @override
  Future<User?> getById(String id) async {
    // Implementation for getting user by id
    throw UnimplementedError();
  }
  
  @override
  Future<User> create(User entity) async {
    // Implementation for creating user
    throw UnimplementedError();
  }
  
  @override
  Future<User> update(User entity) async {
    // Implementation for updating user
    throw UnimplementedError();
  }
  
  @override
  Future<bool> delete(String id) async {
    // Implementation for deleting user
    throw UnimplementedError();
  }
  
  @override
  Future<User?> login(String email, String password) async {
    // Implementation for login
    throw UnimplementedError();
  }
  
  @override
  Future<User?> register(String name, String email, String password) async {
    // Implementation for register
    throw UnimplementedError();
  }
  
  @override
  Future<void> logout() async {
    // Implementation for logout
    throw UnimplementedError();
  }
} 