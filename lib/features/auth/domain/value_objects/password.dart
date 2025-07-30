

import 'package:dartz/dartz.dart';
import 'package:panda/core/domain/failures/failures.dart';

import '../../../../core/domain/value_objects/value_object.dart';

class Password extends ValueObject<String> {
  const Password(super.value);
  
  static Either<ValidationFailure, Password> create(String password) {
    if (password.isEmpty) {
      return Left(ValidationFailure('Password cannot be empty'));
    }
    
    if (password.length < 8) {
      return Left(ValidationFailure('Password must be at least 8 characters'));
    }
    
    if (!_hasUpperCase(password)) {
      return Left(ValidationFailure('Password must contain at least one uppercase letter'));
    }
    
    if (!_hasLowerCase(password)) {
      return Left(ValidationFailure('Password must contain at least one lowercase letter'));
    }
    
    if (!_hasNumber(password)) {
      return Left(ValidationFailure('Password must contain at least one number'));
    }
    
    return Right(Password(password));
  }
  
  static bool _hasUpperCase(String password) {
    return password.contains(RegExp(r'[A-Z]'));
  }
  
  static bool _hasLowerCase(String password) {
    return password.contains(RegExp(r'[a-z]'));
  }
  
  static bool _hasNumber(String password) {
    return password.contains(RegExp(r'[0-9]'));
  }
} 