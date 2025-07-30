import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/presentation/blocs/base_bloc.dart';
import '../../domain/entities/user.dart';
import '../../domain/usecases/login_usecase.dart';

// Events
abstract class AuthEvent extends BaseEvent {}

class LoginRequested extends AuthEvent {
  final String email;
  final String password;
  
  LoginRequested({required this.email, required this.password});
  
  @override
  List<Object?> get props => [email, password];
}

class LogoutRequested extends AuthEvent {}

// States
abstract class AuthState extends BaseState {}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthSuccess extends AuthState {
  final User user;
  
  AuthSuccess(this.user);
  
  @override
  List<Object?> get props => [user];
}

class AuthFailure extends AuthState {
  final String message;
  
  AuthFailure(this.message);
  
  @override
  List<Object?> get props => [message];
}

// Bloc
class AuthBloc extends BaseBloc<AuthEvent, AuthState> {
  final LoginUseCase loginUseCase;
  
  AuthBloc({required this.loginUseCase}) : super(AuthInitial()) {
    on<LoginRequested>(_onLoginRequested);
    on<LogoutRequested>(_onLogoutRequested);
  }
  
  Future<void> _onLoginRequested(
    LoginRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());
    
    final result = await loginUseCase(LoginParams(
      email: event.email,
      password: event.password,
    ));
    
    emit(result.fold(
      (failure) => AuthFailure(failure.message),
      (user) => AuthSuccess(user),
    ));
  }
  
  Future<void> _onLogoutRequested(
    LogoutRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthInitial());
  }
} 