import 'package:dio/dio.dart';
import 'dart:io';

import 'package:dio/io.dart';

class DioHelper {
  static late Dio dio;

  static void init() {
    dio = Dio(
      BaseOptions(
        baseUrl: 'http://10.0.2.2:5242',
        receiveDataWhenStatusError: true,
        headers: {'Content-Type': 'application/json'},
        validateStatus: (status) {
          return status != null && status < 400;
        },
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
