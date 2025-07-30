import '../../../../core/domain/repositories/base_repository.dart';
import '../entities/user.dart';

abstract class AuthRepository extends BaseRepository<User> {
  Future<User?> login(String email, String password);
  Future<User?> register(String name, String email, String password);
  Future<void> logout();
  Future<User?> getCurrentUser();
  Future<bool> isLoggedIn();
} 