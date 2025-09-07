// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:cloud_firestore/cloud_firestore.dart' as _i974;
import 'package:connectinno_case_mobile/core/clients/auth/auth_client.dart'
    as _i213;
import 'package:connectinno_case_mobile/core/clients/auth/auth_client_impl.dart'
    as _i178;
import 'package:connectinno_case_mobile/core/clients/clients.dart' as _i533;
import 'package:connectinno_case_mobile/core/clients/db/local_db_client_impl.dart'
    as _i161;
import 'package:connectinno_case_mobile/core/clients/db/local_db_client.dart'
    as _i135;
import 'package:connectinno_case_mobile/core/clients/logger/logger_service.dart'
    as _i794;
import 'package:connectinno_case_mobile/core/clients/logger/logger_service_impl.dart'
    as _i84;
import 'package:connectinno_case_mobile/core/clients/network/network_client.dart'
    as _i120;
import 'package:connectinno_case_mobile/core/clients/network/network_client_impl.dart'
    as _i421;
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
import 'package:connectinno_case_mobile/features/home/data/datasources/home_local_datasource.dart'
    as _i396;
import 'package:connectinno_case_mobile/features/home/data/datasources/home_remote_datasource.dart'
    as _i1035;
import 'package:connectinno_case_mobile/features/home/data/repositories/home_repository_impl.dart'
    as _i614;
import 'package:connectinno_case_mobile/features/home/domain/repositories/home_repository.dart'
    as _i163;
import 'package:connectinno_case_mobile/features/home/domain/usecases/create_note_usecase.dart'
    as _i765;
import 'package:connectinno_case_mobile/features/home/domain/usecases/delete_note_usecase.dart'
    as _i40;
import 'package:connectinno_case_mobile/features/home/domain/usecases/get_notes_usecase.dart'
    as _i272;
import 'package:connectinno_case_mobile/features/home/domain/usecases/update_note_usecase.dart'
    as _i1047;
import 'package:connectinno_case_mobile/features/home/presentation/controllers/home_bloc.dart'
    as _i189;
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
import 'package:dio/dio.dart' as _i361;
import 'package:firebase_auth/firebase_auth.dart' as _i59;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:logger/logger.dart' as _i974;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final clients = _$Clients();
    await gh.factoryAsync<_i161.ObjectBox>(
      () => clients.objectBox,
      preResolve: true,
    );
    gh.lazySingleton<_i59.FirebaseAuth>(() => clients.firebaseAuth);
    gh.lazySingleton<_i974.FirebaseFirestore>(() => clients.firestore);
    gh.lazySingleton<_i974.Logger>(() => clients.logger);
    gh.lazySingleton<_i361.Dio>(() => clients.dio);
    gh.lazySingleton<_i794.LoggerService>(
      () => _i84.LoggerServiceImpl(gh<_i974.Logger>()),
    );
    gh.lazySingleton<_i213.AuthClient>(
      () => _i178.AuthClientImpl(
        gh<_i59.FirebaseAuth>(),
        gh<_i974.FirebaseFirestore>(),
        gh<_i794.LoggerService>(),
      ),
    );
    gh.singleton<_i135.LocalDatabaseClient>(
      () => _i161.LocalDatabaseClientImpl(gh<_i161.ObjectBox>()),
    );
    gh.lazySingleton<_i396.HomeLocalDatasource>(
      () => _i396.HomeLocalDatasourceImpl(gh<_i135.LocalDatabaseClient>()),
    );
    gh.lazySingleton<_i951.SplashRemoteDatasource>(
      () => _i951.SplashRemoteDatasourceImpl(gh<_i213.AuthClient>()),
    );
    gh.singleton<_i120.NetworkClient>(
      () => _i421.NetworkClientImpl(gh<_i361.Dio>(), gh<_i794.LoggerService>()),
    );
    gh.lazySingleton<_i912.AuthRemoteDatasource>(
      () => _i912.AuthRemoteDatasourceImpl(gh<_i213.AuthClient>()),
    );
    gh.lazySingleton<_i1035.HomeRemoteDatasource>(
      () => _i1035.HomeRemoteDatasourceImpl(
        gh<_i120.NetworkClient>(),
        gh<_i213.AuthClient>(),
      ),
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
    gh.lazySingleton<_i163.HomeRepository>(
      () => _i614.HomeRepositoryImpl(
        gh<_i396.HomeLocalDatasource>(),
        gh<_i1035.HomeRemoteDatasource>(),
      ),
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
    gh.factory<_i765.CreateNoteUsecase>(
      () => _i765.CreateNoteUsecase(gh<_i163.HomeRepository>()),
    );
    gh.factory<_i40.DeleteNoteUsecase>(
      () => _i40.DeleteNoteUsecase(gh<_i163.HomeRepository>()),
    );
    gh.factory<_i1047.UpdateNoteUsecase>(
      () => _i1047.UpdateNoteUsecase(gh<_i163.HomeRepository>()),
    );
    gh.factory<_i272.GetNotesUsecase>(
      () => _i272.GetNotesUsecase(gh<_i163.HomeRepository>()),
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
    gh.factory<_i189.HomeBloc>(
      () => _i189.HomeBloc(
        gh<_i272.GetNotesUsecase>(),
        gh<_i765.CreateNoteUsecase>(),
        gh<_i1047.UpdateNoteUsecase>(),
        gh<_i40.DeleteNoteUsecase>(),
      ),
    );
    return this;
  }
}

class _$Clients extends _i533.Clients {}
