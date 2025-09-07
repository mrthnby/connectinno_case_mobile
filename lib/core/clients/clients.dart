import 'package:connectinno_case_mobile/core/clients/db/local_db_client_impl.dart';
import 'package:connectinno_case_mobile/core/constants/app_constants.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
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

  /// Provides a lazily instantiated singleton of [FirebaseFirestore].
  @lazySingleton
  FirebaseFirestore get firestore => FirebaseFirestore.instance;

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

  /// Provides a singleton instance of [ObjectBox].
  ///
  /// - Creates the ObjectBox instance and returns it.
  @preResolve
  Future<ObjectBox> get objectBox => ObjectBox.create();

  /// Provides a singleton instance of [Dio].
  ///
  /// - Configures the Dio instance with the base URL and timeouts.
  @lazySingleton
  Dio get dio => Dio(
    BaseOptions(
      baseUrl: AppConstants.apiBaseUrl,
      connectTimeout: AppConstants.networkTimeout,
      receiveTimeout: AppConstants.networkTimeout,
    ),
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
        colors: false,
      );
    }
    return SimplePrinter(colors: false, printTime: true);
  }
}
