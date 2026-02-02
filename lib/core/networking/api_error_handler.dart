import 'package:dio/dio.dart';

class ApiErrorHandler {
  static String handle(dynamic error){
    if (error is DioException){
      switch(error.type){
        case DioExceptionType.connectionTimeout:
          return "Check your internet connection and try again.";
        case DioExceptionType.sendTimeout:
          return "Check your internet connection and try again.";
        case DioExceptionType.receiveTimeout:
          return "Check your internet connection and try again.";
        case DioExceptionType.badResponse:
          return _handleResponseError(error.response);
        case DioExceptionType.cancel:
          return "Request was cancelled.";
        case DioExceptionType.connectionError:
          return "Check your internet connection and try again.";
        case DioExceptionType.badCertificate:
          return "A security error occurred. Please try again later.";
        default:
          return "An unexpected error occurred. Please try again later.";
      }
    } else {
      return "An unexpected error occurred. Please try again later.";
    }
  }
  static String _handleResponseError(Response? response){
    if (response == null) return "An unexpected error occurred. Please try again later.";
    final statusCode = response.statusCode;
    final data = response.data;
    if (data is Map<String, dynamic> && (data.containsKey('message') || data.containsKey('error'))){
      return data['message'] ?? data['error'] ;
    }
    switch (statusCode){
      case 400:
        return "Bad request.";
      case 401:
        return "Unauthorized.";
      case 403:
        return "Forbidden.";
      case 404:
        return "Not found.";
      case 500:
        return "Internal server error.";
      case 503:
        return "Service unavailable.";
      default:
        return "An unexpected error occurred. Please try again later.";
    }
  }
}