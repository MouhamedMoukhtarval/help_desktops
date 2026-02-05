import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioFactory {
  /// private constructor as I don't want to allow creating an instance of this class
  DioFactory._();

  static Dio? dio;

  static Dio getDio() {
    Duration timeout = const Duration(seconds: 30);

    if (dio == null) {
      dio = Dio();
      dio!
        ..options.connectTimeout = timeout
        ..options.receiveTimeout = timeout;
      addHeaders();
      addDioInterceptor();
      return dio!;
    } else {
      return dio!;
    }
  }
  static void addHeaders(){
    dio!.options.headers={
      'Content-Type': 'application/json',
      'Authorization':
        'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNzcwMzEwOTQwLCJpYXQiOjE3NzAzMDkxNDEsImp0aSI6ImU4M2Q1YThhMzRkMzRkOTRiYjA5M2JkOWExZjMxY2VmIiwidXNlcl9pZCI6IjI2In0.6aRN9qtCS90gy1mlUIo8K67l50_UWKdpE9t4PZJ4cm8'
    };
  }

  static void addDioInterceptor() {
    dio!.interceptors.add(
      PrettyDioLogger(
        requestBody: true,
        requestHeader: true,
        responseHeader: true,
      ),
    );
  }

}