// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:connectinno_case_mobile/core/clients/auth/auth_client.dart'
    as _i213;
import 'package:connectinno_case_mobile/core/clients/auth/auth_client_impl.dart'
    as _i178;
import 'package:connectinno_case_mobile/core/clients/clients.dart' as _i533;
import 'package:connectinno_case_mobile/core/clients/logger/logger_service.dart'
    as _i794;
import 'package:connectinno_case_mobile/core/clients/logger/logger_service_impl.dart'
    as _i84;
import 'package:connectinno_case_mobile/features/auth/data/datasources/auth_remote_datasource.dart'
    as _i912;
import 'package:connectinno_case_mobile/features/auth/data/repositories/auth_repository_impl.dart'
    as _i664;
import 'package:connectinno_case_mobile/features/auth/domain/repositories/auth_repository.dart'
    as _i223;
import 'package:connectinno_case_mobile/features/auth/domain/usecases/login_usecase.dart'
    as _i100;
import 'package:connectinno_case_mobile/features/auth/domain/usecases/register_usecase.dart'
    as _i350;
import 'package:connectinno_case_mobile/features/auth/domain/usecases/reset_password_usecase.dart'
    as _i143;
import 'package:connectinno_case_mobile/features/auth/presentation/controllers/auth_bloc.dart'
    as _i203;
import 'package:connectinno_case_mobile/features/splash/data/datasources/splash_remote_datasource.dart'
    as _i951;
import 'package:connectinno_case_mobile/features/splash/data/repositories/splash_repository_impl.dart'
    as _i805;
import 'package:connectinno_case_mobile/features/splash/domain/repositories/splash_repository.dart'
    as _i134;
import 'package:connectinno_case_mobile/features/splash/domain/usecases/get_current_user_id_usecase.dart'
    as _i734;
import 'package:connectinno_case_mobile/features/splash/presentation/controllers/splash_bloc.dart'
    as _i1053;
import 'package:firebase_auth/firebase_auth.dart' as _i59;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:logger/logger.dart' as _i974;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final clients = _$Clients();
    gh.lazySingleton<_i59.FirebaseAuth>(() => clients.firebaseAuth);
    gh.lazySingleton<_i974.Logger>(() => clients.logger);
    gh.lazySingleton<_i794.LoggerService>(
      () => _i84.LoggerServiceImpl(gh<_i974.Logger>()),
    );
    gh.lazySingleton<_i213.AuthClient>(
      () => _i178.AuthClientImpl(
        gh<_i59.FirebaseAuth>(),
        gh<_i794.LoggerService>(),
      ),
    );
    gh.lazySingleton<_i951.SplashRemoteDatasource>(
      () => _i951.SplashRemoteDatasourceImpl(gh<_i213.AuthClient>()),
    );
    gh.lazySingleton<_i912.AuthRemoteDatasource>(
      () => _i912.AuthRemoteDatasourceImpl(gh<_i213.AuthClient>()),
    );
    gh.lazySingleton<_i134.SplashRepository>(
      () => _i805.SplashRepositoryImpl(gh<_i951.SplashRemoteDatasource>()),
    );
    gh.lazySingleton<_i223.AuthRepository>(
      () => _i664.AuthRepositoryImpl(gh<_i912.AuthRemoteDatasource>()),
    );
    gh.factory<_i734.GetCurrentUserIDUsecase>(
      () => _i734.GetCurrentUserIDUsecase(gh<_i134.SplashRepository>()),
    );
    gh.factory<_i100.LoginUsecase>(
      () => _i100.LoginUsecase(gh<_i223.AuthRepository>()),
    );
    gh.factory<_i350.RegisterUsecase>(
      () => _i350.RegisterUsecase(gh<_i223.AuthRepository>()),
    );
    gh.factory<_i143.ResetPasswordUsecase>(
      () => _i143.ResetPasswordUsecase(gh<_i223.AuthRepository>()),
    );
    gh.factory<_i1053.SplashBloc>(
      () => _i1053.SplashBloc(gh<_i734.GetCurrentUserIDUsecase>()),
    );
    gh.factory<_i203.AuthBloc>(
      () => _i203.AuthBloc(
        gh<_i100.LoginUsecase>(),
        gh<_i350.RegisterUsecase>(),
        gh<_i143.ResetPasswordUsecase>(),
      ),
    );
    return this;
  }
}

class _$Clients extends _i533.Clients {}
