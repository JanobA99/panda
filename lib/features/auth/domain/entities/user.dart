
import '../../../../core/domain/entities/base_entity.dart';
import '../value_objects/email.dart';
import '../value_objects/password.dart';

class User extends BaseEntity {
  final String name;
  final Email email;
  final Password password;
  final DateTime createdAt;
  final DateTime? updatedAt;
  
  const User({
    required super.id,
    required this.name,
    required this.email,
    required this.password,
    required this.createdAt,
    this.updatedAt,
  });
  
  User copyWith({
    String? id,
    String? name,
    Email? email,
    Password? password,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return User(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
  
  List<Object?> get props => [id, name, email, password, createdAt, updatedAt];
} 