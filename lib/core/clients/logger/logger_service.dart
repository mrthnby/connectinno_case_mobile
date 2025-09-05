/// Abstract interface for logging services.
///
/// This interface defines the contract for logging services in the application.
/// Implementations should handle different log levels and provide structured logging.
///
abstract class LoggerService {
  /// Logs an info message.
  ///
  /// [message] The info message to log
  /// [data] Optional additional data to include in the log
  void info(
    String message, {
    Map<String, Object?>? data,
  });

  /// Logs a warning message.
  ///
  /// [message] The warning message to log
  /// [error] Optional error object
  /// [stackTrace] Optional stack trace
  /// [data] Optional additional data to include in the log
  void warning(
    String message, {
    Object? error,
    StackTrace? stackTrace,
    Map<String, Object?>? data,
  });

  /// Logs an error message.
  ///
  /// [message] The error message to log
  /// [error] Optional error object
  /// [stackTrace] Optional stack trace
  /// [data] Optional additional data to include in the log
  void error(
    String message, {
    Object? error,
    StackTrace? stackTrace,
    Map<String, Object?>? data,
  });
}
