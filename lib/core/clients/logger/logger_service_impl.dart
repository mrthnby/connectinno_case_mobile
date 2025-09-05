import 'dart:convert';
import 'package:connectinno_case_mobile/core/clients/logger/logger_service.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';

/// Implementation of [LoggerService] using the logger package.
///
/// This implementation provides structured logging with different levels
/// and includes special handling for network operations.
@LazySingleton(as: LoggerService)
class LoggerServiceImpl implements LoggerService {
  /// Creates a new instance of [LoggerServiceImpl].
  LoggerServiceImpl(this.logger);

  /// The logger instance.
  final Logger logger;

  @override
  void info(
    String message, {
    Map<String, Object?>? data,
  }) {
    final logMessage = _formatMessage(message, data);
    logger.i(logMessage);
  }

  @override
  void warning(
    String message, {
    Object? error,
    StackTrace? stackTrace,
    Map<String, Object?>? data,
  }) {
    final logMessage = _formatMessage(message, data);
    logger.w(logMessage, error: error, stackTrace: stackTrace);
  }

  @override
  void error(
    String message, {
    Object? error,
    StackTrace? stackTrace,
    Map<String, Object?>? data,
  }) {
    final logMessage = _formatMessage(message, data);
    logger.e(logMessage, error: error, stackTrace: stackTrace);
  }

  /// Formats the log message with optional structured [data].
  ///
  /// - Redacts sensitive keys before logging.
  /// - Serializes data to JSON if possible.
  /// - Falls back to a manual string representation if JSON encoding fails.
  String _formatMessage(String message, Map<String, Object?>? data) {
    if (data == null || data.isEmpty) {
      return message;
    }

    final redacted = _redactMap(data);
    try {
      final json = jsonEncode(redacted);
      return '$message | Data: $json';

      // Catching all exceptions to safely fallback if jsonEncode fails.
      // ignore: avoid_catches_without_on_clauses
    } catch (_) {
      final fallback = redacted.entries
          .map((e) => '${e.key}: ${_stringifyValue(e.value)}')
          .join(', ');
      return '$message | Data: $fallback';
    }
  }

  /// Recursively redacts sensitive keys in [input] map.
  ///
  /// Sensitive keys include passwords, tokens, API keys, etc.
  Map<String, Object?> _redactMap(Map<String, Object?> input) {
    final result = <String, Object?>{};
    input.forEach((String key, Object? value) {
      if (_isSensitiveKey(key)) {
        result[key] = '***REDACTED***';
      } else {
        result[key] = _redactValue(value);
      }
    });
    return result;
  }

  /// Redacts values recursively for nested [Map]s and [List]s.
  Object? _redactValue(Object? value) {
    if (value is Map) {
      final mapped = <String, Object?>{};
      value.forEach((dynamic k, dynamic v) {
        mapped[k.toString()] = _redactValue(v);
      });
      return mapped;
    }
    if (value is List) {
      return value.map<Object?>(_redactValue).toList();
    }
    if (value is String || value is num || value is bool || value == null) {
      return value;
    }
    return value.toString();
  }

  /// Safely converts [value] to a string.
  ///
  /// - Directly returns simple types.
  /// - Tries JSON encoding for complex objects.
  /// - Falls back to `toString()` if JSON encoding fails.
  String _stringifyValue(Object? value) {
    if (value == null) return 'null';
    if (value is String || value is num || value is bool) {
      return value.toString();
    }
    try {
      return jsonEncode(value);
      // Fallback to toString() if jsonEncode fails for unsupported objects.
      // ignore: avoid_catches_without_on_clauses
    } catch (_) {
      return value.toString();
    }
  }

  /// Checks if the given [key] is considered sensitive.
  ///
  /// Sensitive keys include common secrets, tokens, passwords, credit card info, etc.
  /// Partial matches for keywords like "password", "token", or "secret" are also considered sensitive.
  bool _isSensitiveKey(String key) {
    final k = key.toLowerCase();
    const sensitive = <String>{
      'password',
      'pass',
      'token',
      'access_token',
      'refresh_token',
      'authorization',
      'api_key',
      'apikey',
      'secret',
      'client_secret',
      'pin',
      'ssn',
      'cardnumber',
      'card_number',
      'cvv',
    };
    if (sensitive.contains(k)) return true;
    // Partial matches for common patterns
    return k.contains('password') ||
        k.contains('token') ||
        k.contains('secret');
  }
}
