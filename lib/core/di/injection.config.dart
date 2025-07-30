// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:panda/core/application/services/logger_service.dart' as _i851;
import 'package:panda/core/application/services/network_service.dart' as _i400;
import 'package:panda/core/domain/usecases/base_usecase.dart' as _i389;
import 'package:panda/core/infrastructure/services/logger_service_impl.dart'
    as _i893;
import 'package:panda/core/infrastructure/services/network_service_impl.dart'
    as _i721;
import 'package:panda/features/auth/domain/repositories/auth_repository.dart'
    as _i690;
import 'package:panda/features/auth/domain/usecases/login_usecase.dart'
    as _i678;
import 'package:panda/features/auth/infrastructure/datasources/auth_remote_datasource.dart'
    as _i216;
import 'package:panda/features/auth/infrastructure/repositories/auth_repository_impl.dart'
    as _i5;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.factory<_i389.NoParams>(() => const _i389.NoParams());
    gh.factory<_i678.LoginParams>(() => _i678.LoginParams(
          email: gh<String>(),
          password: gh<String>(),
        ));
    gh.factory<_i851.LoggerService>(() => _i893.LoggerServiceImpl());
    gh.factory<_i400.NetworkService>(() => _i721.NetworkServiceImpl());
    gh.factory<_i216.AuthRemoteDataSource>(
        () => _i216.AuthRemoteDataSourceImpl(baseUrl: gh<String>()));
    gh.factory<_i690.AuthRepository>(() => _i5.AuthRepositoryImpl(
          remoteDataSource: gh<_i216.AuthRemoteDataSource>(),
          localDataSource: gh<_i216.AuthRemoteDataSource>(),
        ));
    gh.factory<_i678.LoginUseCase>(
        () => _i678.LoginUseCase(gh<_i690.AuthRepository>()));
    return this;
  }
}
