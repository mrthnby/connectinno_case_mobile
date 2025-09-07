import 'package:dio/dio.dart';

class NetworkExceptions implements Exception {
  NetworkExceptions(this.message);

  factory NetworkExceptions.fromDioError(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
        return NetworkExceptions('Connection Timeout');
      case DioExceptionType.sendTimeout:
        return NetworkExceptions('Send Timeout');
      case DioExceptionType.receiveTimeout:
        return NetworkExceptions('Receive Timeout');
      case DioExceptionType.cancel:
        return NetworkExceptions('Request Cancelled');
      case DioExceptionType.badResponse:
        return NetworkExceptions(
          'Invalid Status Code: ${error.response?.statusCode}',
        );
      case DioExceptionType.badCertificate:
        return NetworkExceptions('Bad Certificate');
      case DioExceptionType.connectionError:
        return NetworkExceptions('Connection Error');
      case DioExceptionType.unknown:
        return NetworkExceptions('Unexpected Error: ${error.message}');
    }
  }

  final String message;

  @override
  String toString() {
    return message;
  }
}
