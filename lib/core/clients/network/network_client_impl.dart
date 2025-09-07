import 'package:connectinno_case_mobile/core/clients/logger/logger_service.dart';
import 'package:connectinno_case_mobile/core/clients/network/api_path.dart';
import 'package:connectinno_case_mobile/core/clients/network/network_client.dart';
import 'package:connectinno_case_mobile/core/clients/network/network_exceptions.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@Singleton(as: NetworkClient)
class NetworkClientImpl implements NetworkClient {
  NetworkClientImpl(this._dio, this._logger);

  final Dio _dio;
  final LoggerService _logger;

  @override
  Future<T> get<T>(
    ApiPath path, {
    Map<String, String>? pathParams,
    Map<String, dynamic>? queryParameters,
    Map<String, String>? headers,
  }) async {
    final url = path.path(params: pathParams);
    final startTime = DateTime.now();

    _logger.info(
      'GET',
      data: {
        'url': url,
        'headers': headers,
        'queryParameters': queryParameters,
      },
    );

    try {
      final response = await _dio.get<T>(
        url,
        queryParameters: queryParameters,
        options: Options(
          headers: headers,
        ),
      );

      final duration = DateTime.now().difference(startTime).inMilliseconds;
      _logger.info(
        'GET',
        data: {
          'url': url,
          'statusCode': response.statusCode,
          'duration': duration,
          'data': response.data,
        },
      );

      return response.data as T;
    } on DioException catch (e) {
      _logger.error('GET', error: e);
      throw NetworkExceptions.fromDioError(e);
    } catch (e) {
      _logger.error('GET', error: e);
      throw NetworkExceptions(e.toString());
    }
  }

  @override
  Future<T> post<T>(
    ApiPath path, {
    dynamic data,
    Map<String, String>? pathParams,
    Map<String, dynamic>? queryParameters,
    Map<String, String>? headers,
  }) async {
    final url = path.path(params: pathParams);
    final startTime = DateTime.now();

    _logger.info(
      'POST',
      data: {
        'url': url,
        'headers': headers,
        'queryParameters': queryParameters,
        'data': data,
      },
    );

    try {
      final response = await _dio.post<T>(
        url,
        data: data,
        queryParameters: queryParameters,
        options: Options(
          headers: headers,
        ),
      );

      final duration = DateTime.now().difference(startTime).inMilliseconds;
      _logger.info(
        'POST',
        data: {
          'url': url,
          'statusCode': response.statusCode,
          'duration': duration,
          'data': response.data,
        },
      );

      return response.data as T;
    } on DioException catch (e) {
      _logger.error('POST', error: e);
      throw NetworkExceptions.fromDioError(e);
    } catch (e) {
      _logger.error('POST', error: e);
      throw NetworkExceptions(e.toString());
    }
  }

  @override
  Future<T> put<T>(
    ApiPath path, {
    dynamic data,
    Map<String, String>? pathParams,
    Map<String, dynamic>? queryParameters,
    Map<String, String>? headers,
  }) async {
    final url = path.path(params: pathParams);
    final startTime = DateTime.now();

    _logger.info(
      'PUT',
      data: {
        'url': url,
        'headers': headers,
        'queryParameters': queryParameters,
        'data': data,
      },
    );

    try {
      final response = await _dio.put<T>(
        url,
        data: data,
        queryParameters: queryParameters,
        options: Options(
          headers: headers,
        ),
      );

      final duration = DateTime.now().difference(startTime).inMilliseconds;
      _logger.info(
        'PUT',
        data: {
          'url': url,
          'statusCode': response.statusCode,
          'duration': duration,
          'data': response.data,
        },
      );

      return response.data as T;
    } on DioException catch (e) {
      _logger.error('PUT', error: e);
      throw NetworkExceptions.fromDioError(e);
    } catch (e) {
      _logger.error('PUT', error: e);
      throw NetworkExceptions(e.toString());
    }
  }

  @override
  Future<T> delete<T>(
    ApiPath path, {
    dynamic data,
    Map<String, String>? pathParams,
    Map<String, dynamic>? queryParameters,
    Map<String, String>? headers,
  }) async {
    final url = path.path(params: pathParams);
    final startTime = DateTime.now();

    _logger.info(
      'DELETE',
      data: {
        'url': url,
        'headers': headers,
        'queryParameters': queryParameters,
        'data': data,
      },
    );

    try {
      final response = await _dio.delete<T>(
        url,
        data: data,
        queryParameters: queryParameters,
        options: Options(
          headers: headers,
        ),
      );

      final duration = DateTime.now().difference(startTime).inMilliseconds;
      _logger.info(
        'DELETE',
        data: {
          'url': url,
          'statusCode': response.statusCode,
          'duration': duration,
          'data': response.data,
        },
      );

      return response.data as T;
    } on DioException catch (e) {
      _logger.error('DELETE', error: e);
      throw NetworkExceptions.fromDioError(e);
    } catch (e) {
      _logger.error('DELETE', error: e);
      throw NetworkExceptions(e.toString());
    }
  }
}
