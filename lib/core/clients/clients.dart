import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';

/// A dependency injection module for third-party clients.
///
/// This module is used with `injectable` to register external packages or
/// clients as injectable dependencies. This allows  the application
/// to access and manage third-party services via GetIt.
///
@module
abstract class Clients {
  /// Provides a lazily instantiated singleton of [FirebaseAuth].
  @lazySingleton
  FirebaseAuth get firebaseAuth => FirebaseAuth.instance;

  /// Provides a lazily instantiated singleton of [Logger].
  ///
  /// The logger's printer and level are configured based on the build mode:
  /// - Debug mode → PrettyPrinter (colorful, readable)
  /// - Release mode → SimplePrinter (compact, timestamped)
  @lazySingleton
  Logger get logger => Logger(
    printer: getPrinter,
    level: kDebugMode ? Level.debug : Level.info,
  );
}

/// Extension methods for [Clients] to provide additional functionality.
extension LoggerExtension on Clients {
  /// Returns the appropriate [LogPrinter] based on the current build mode.
  ///
  /// This allows the same [Logger] instance to have different output
  /// formatting for debug and release builds.
  LogPrinter get getPrinter {
    if (kDebugMode) {
      return PrettyPrinter(
        dateTimeFormat: DateTimeFormat.onlyTimeAndSinceStart,
      );
    }
    return SimplePrinter(colors: false, printTime: true);
  }
}
