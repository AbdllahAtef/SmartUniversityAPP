import 'package:dio/dio.dart';
import 'dart:io';
import 'package:dio/io.dart';

class DioHelper {
  static late Dio dio;

  static void init() {
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://10.0.2.2:7146',
        headers: {'Content-Type': 'application/json'},
      ),
    );

    dio.httpClientAdapter = DefaultHttpClientAdapter()
      ..onHttpClientCreate = (HttpClient client) {
        client.badCertificateCallback =
            (X509Certificate cert, String host, int port) => true;
        return client;
      };
  }
}
