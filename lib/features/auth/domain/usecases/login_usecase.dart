import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:panda/core/domain/usecases/base_usecase.dart';
import '../../../../core/domain/failures/failures.dart';
import '../entities/user.dart';
import '../repositories/auth_repository.dart';

class LoginParams {
  final String email;
  final String password;
  
  const LoginParams({required this.email, required this.password});
}

@injectable
class LoginUseCase implements UseCase<User, LoginParams> {
  final AuthRepository repository;
  
  const LoginUseCase(this.repository);
  
  @override
  Future<Either<Failure, User>> call(LoginParams params) async {
    try {
      final user = await repository.login(params.email, params.password);
      if (user != null) {
        return Right(user);
      } else {
        return Left(ValidationFailure('Invalid email or password'));
      }
    } catch (e) {
      return Left(ServerFailure('Login failed: ${e.toString()}'));
    }
  }
} 