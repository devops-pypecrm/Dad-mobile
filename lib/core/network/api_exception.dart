import 'package:dio/dio.dart';

/// Normalized error surfaced by Repositories so Presentation code never has
/// to know about Dio/DioException directly.
class ApiException implements Exception {
  ApiException(this.message, {this.statusCode, this.errors});

  factory ApiException.fromDioException(DioException e) {
    final data = e.response?.data;
    final serverMessage = data is Map<String, dynamic> ? data['message'] as String? : null;
    // Some endpoints (registration, change-password) return a detailed
    // `errors: string[]` breakdown alongside the summary `message` — e.g.
    // PasswordValidator's per-rule failures ("must contain a number",
    // "must contain a special character", ...). Surfaced separately so
    // callers that care can render a bullet list instead of just the
    // generic summary sentence.
    final errorsList = data is Map<String, dynamic> ? data['errors'] as List<dynamic>? : null;
    return ApiException(
      serverMessage ?? _fallbackMessage(e),
      statusCode: e.response?.statusCode,
      errors: errorsList?.cast<String>(),
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
  final List<String>? errors;

  @override
  String toString() => message;
}
