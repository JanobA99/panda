import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:dio/dio.dart';
import '../../presentation/utils/constants.dart';
import '../../../features/auth/presentation/pages/login_page.dart';
import '../../../features/auth/application/blocs/auth_bloc.dart';
import '../../../features/auth/domain/usecases/login_usecase.dart';
import '../../../features/auth/infrastructure/repositories/auth_repository_impl.dart';
import '../../../features/auth/infrastructure/datasources/auth_remote_datasource.dart';
import '../../../features/onboarding/onboarding.dart';

class AppRoutes {
  // Route paths
  static const String languageSelection = '/';
  static const String locationPermission = '/location-permission';
  static const String locationSelection = '/location-selection';
  static const String login = '/login';
  
  // Route names
  static const String languageSelectionName = 'language-selection';
  static const String locationPermissionName = 'location-permission';
  static const String locationSelectionName = 'location-selection';
  static const String loginName = 'login';
}

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: AppRoutes.languageSelection,
    routes: [
      // Language Selection Page
      GoRoute(
        path: AppRoutes.languageSelection,
        name: AppRoutes.languageSelectionName,
        builder: (context, state) => const LanguageSelectionPage(),
      ),
      
      // Location Permission Page
      GoRoute(
        path: AppRoutes.locationPermission,
        name: AppRoutes.locationPermissionName,
        builder: (context, state) => const LocationPermissionPage(),
      ),
      
      // Location Selection Page
      GoRoute(
        path: AppRoutes.locationSelection,
        name: AppRoutes.locationSelectionName,
        builder: (context, state) => MultiProvider(
          providers: [
            Provider<Dio>(
              create: (context) => Dio(BaseOptions(
                baseUrl: AppConstants.baseUrl,
                connectTimeout: const Duration(seconds: 30),
                receiveTimeout: const Duration(seconds: 30),
              )),
            ),
          ],
          child: const LocationSelectionPage(),
        ),
      ),
      
      // Login Page
      GoRoute(
        path: AppRoutes.login,
        name: AppRoutes.loginName,
        builder: (context, state) => BlocProvider(
          create: (context) => AuthBloc(
            loginUseCase: LoginUseCase(
              AuthRepositoryImpl(
                remoteDataSource: AuthRemoteDataSourceImpl(baseUrl: AppConstants.baseUrl),
                localDataSource: AuthRemoteDataSourceImpl(baseUrl: AppConstants.baseUrl),
              ),
            ),
          ),
          child: LoginPage(),
        ),
      ),
    ],
  );
} 