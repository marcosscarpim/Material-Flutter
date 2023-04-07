import 'package:dio/dio.dart';
import 'package:dio/io.dart';

class CustomDio extends DioForNative {
  CustomDio()
      : super(BaseOptions(
          baseUrl: 'https://pokeapi.co/api/v2',
          connectTimeout: const Duration(seconds: 5),
          receiveTimeout: const Duration(seconds: 30),
          headers: {
            'Content-Type': "application/json",
          },
        )) {
    interceptors.add(LogInterceptor(requestBody: true, responseBody: true));
  }
}
