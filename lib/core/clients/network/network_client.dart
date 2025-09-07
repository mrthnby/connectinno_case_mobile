import 'package:connectinno_case_mobile/core/clients/network/api_path.dart';

/// Interface for performing HTTP requests in the app.
/// Supports GET, POST, PUT, and DELETE methods with generic response type [T].
abstract class NetworkClient {
  /// Sends a GET request.
  ///
  /// [path]: The endpoint ([ApiPath]).
  /// [pathParams]: Replaces placeholders in the URL, e.g., `{'id': '123'}` → `/notes/123`.
  /// [queryParameters]: Appended as URL query parameters.
  /// [headers]: Optional HTTP headers.
  Future<T> get<T>(
    ApiPath path, {
    Map<String, String>? pathParams,
    Map<String, dynamic>? queryParameters,
    Map<String, String>? headers,
  });

  /// Sends a POST request.
  ///
  /// [data]: Request body (Map, List, or JSON-serializable object).
  /// Other parameters are same as [get].
  Future<T> post<T>(
    ApiPath path, {
    dynamic data,
    Map<String, String>? pathParams,
    Map<String, dynamic>? queryParameters,
    Map<String, String>? headers,
  });

  /// Sends a PUT request.
  ///
  /// [data]: Request body (Map, List, or JSON-serializable object).
  /// Other parameters are same as [get].
  Future<T> put<T>(
    ApiPath path, {
    dynamic data,
    Map<String, String>? pathParams,
    Map<String, dynamic>? queryParameters,
    Map<String, String>? headers,
  });

  /// Sends a DELETE request.
  ///
  /// [data]: Optional request body for DELETE.
  /// Other parameters are same as [get].
  Future<T> delete<T>(
    ApiPath path, {
    dynamic data,
    Map<String, String>? pathParams,
    Map<String, dynamic>? queryParameters,
    Map<String, String>? headers,
  });
}
