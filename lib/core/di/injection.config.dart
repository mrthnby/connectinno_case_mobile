// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:connectinno_case_mobile/core/clients/clients.dart' as _i533;
import 'package:connectinno_case_mobile/core/clients/logger/logger_service.dart'
    as _i794;
import 'package:connectinno_case_mobile/core/clients/logger/logger_service_impl.dart'
    as _i84;
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
    gh.lazySingleton<_i974.Logger>(() => clients.logger);
    gh.lazySingleton<_i794.LoggerService>(
      () => _i84.LoggerServiceImpl(gh<_i974.Logger>()),
    );
    return this;
  }
}

class _$Clients extends _i533.Clients {}
