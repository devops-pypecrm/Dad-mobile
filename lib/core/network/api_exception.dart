import 'package:dio/dio.dart';

/// Normalized error surfaced by Repositories so Presentation code never has
/// to know about Dio/DioException directly.
class ApiException implements Exception {
  ApiException(this.message, {this.statusCode});

  factory ApiException.fromDioException(DioException e) {
    final data = e.response?.data;
    final serverMessage = data is Map<String, dynamic> ? data['message'] as String? : null;
    return ApiException(
      serverMessage ?? _fallbackMessage(e),
      statusCode: e.response?.statusCode,
    );
  }

  /// Dio's own `e.message` (e.g. "DioException [connection timeout]: ...")
  /// isn't something to show a user — map the connection-level failure
  /// types (no server message available for these, by definition) to
  /// plain-language equivalents instead.
  static String _fallbackMessage(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return 'The request timed out. Check your connection and try again.';
      case DioExceptionType.connectionError:
        return 'Could not reach the server. Check your internet connection.';
      case DioExceptionType.badCertificate:
        return 'Could not establish a secure connection.';
      case DioExceptionType.cancel:
        return 'Request cancelled.';
      case DioExceptionType.badResponse:
      case DioExceptionType.unknown:
      case DioExceptionType.transformTimeout:
        return 'Something went wrong. Please try again.';
    }
  }

  final String message;
  final int? statusCode;

  @override
  String toString() => message;
}
