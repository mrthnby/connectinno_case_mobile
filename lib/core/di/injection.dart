import 'package:connectinno_case_mobile/core/di/injection.config.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

/// The global service locator instance used throughout the app.
/// `sl` stands for "service locator" and is an instance of `GetIt`.
final GetIt sl = GetIt.instance;

/// Initializes dependency injection for the app.
/// Must be called at app startup before using any injected services.
@InjectableInit()
void configureDependencies() => sl.init();
