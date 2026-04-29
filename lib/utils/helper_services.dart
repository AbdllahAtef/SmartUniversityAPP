import 'package:dio/dio.dart';

String getErrorMessage(DioException e) {
  final data = e.response?.data;

  if (data is Map<String, dynamic>) {
    return data['error'] ??
        data['message'] ??
        data['title'] ??
        "Something went wrong";
  }

  return "Something went wrong";
}
