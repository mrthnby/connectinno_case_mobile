import 'dart:async';
import 'package:connectinno_case_mobile/core/clients/logger/logger_service.dart';
import 'package:connectinno_case_mobile/core/di/injection.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

/// Bootstraps the Flutter application inside a [runZonedGuarded] zone.
///
/// Responsibilities:
/// - Ensures Flutter binding is initialized before any plugin or service usage.
/// - Provides a safe entry point for running the app.
/// - Allows executing any required asynchronous initialization before [runApp].
/// - Runs the app inside a guarded zone so that uncaught async errors
///   can be captured and reported (e.g., to a logging or crash reporting service).
///
/// This function is intended to centralize application startup logic such as:
/// - Dependency injection setup
/// - Localization or theme initialization
/// - Remote config loading
/// - Analytics / crash reporting setup
///
/// Usage:
/// ```dart
/// Future<void> main() async {
///   await bootstrap(const MyApp());
/// }
/// ```
Future<void> bootstrap(Widget app) async {
  await runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();

      // Initialize Easy Localization
      await EasyLocalization.ensureInitialized();

      // Initialize Dependency Injection
      configureDependencies();
      // Initialize Localization
      final localizedApp = EasyLocalization(
        supportedLocales: const [Locale('en'), Locale('tr')],
        fallbackLocale: const Locale('en'),
        path: 'assets/translations',
        child: app,
      );

      // Run the app
      runApp(localizedApp);
    },
    (error, stackTrace) {
      // TODO: Log error using crashlytics
      sl<LoggerService>().error(
        'Bootstrap error',
        error: error,
        stackTrace: stackTrace,
      );
    },
  );
}
