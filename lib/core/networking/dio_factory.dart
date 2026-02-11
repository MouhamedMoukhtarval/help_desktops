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
        'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNzcwODIzNDQ4LCJpYXQiOjE3NzA4MjE2NDgsImp0aSI6IjBiZmFkZTQyOGUwMTQxYjU4NTliMmNhZmVhNWU5M2IxIiwidXNlcl9pZCI6IjI4In0.YQ071elYmJdtC1tt6K1mh766aJ79i_anMJTshg1y0B4'
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