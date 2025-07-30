import 'package:dartz/dartz.dart';

import '../../../../core/domain/failures/failures.dart';
import '../../../../core/domain/value_objects/value_object.dart';


class Email extends ValueObject<String> {
  const Email(super.value);
  
  static Either<ValidationFailure, Email> create(String email) {
    if (email.isEmpty) {
      return Left(ValidationFailure('Email cannot be empty'));
    }
    
    if (!_isValidEmail(email)) {
      return Left(ValidationFailure('Invalid email format'));
    }
    
    return Right(Email(email));
  }
  
  static bool _isValidEmail(String email) {
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return emailRegex.hasMatch(email);
  }
} 