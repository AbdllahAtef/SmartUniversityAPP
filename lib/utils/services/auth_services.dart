import 'package:dio/dio.dart';
import 'package:smart_university_app/utils/dio_helper.dart';

class AuthService {
  Future<Map<String, dynamic>> register({
    required String fullName,
    required String email,
    required String password,
    required String nationalId,
    required String role,
    required int facultyId,
  }) async {
    try {
      final response = await DioHelper.dio.post(
        '/api/Auth/register',
        data: {
          "fullName": fullName,
          "email": email,
          "password": password,
          "nationalId": nationalId,
          "role": role,
          "facultyId": facultyId,
        },
      );

      final data = response.data;

      if (data == null) {
        return {};
      }

      if (data is Map<String, dynamic>) {
        return data;
      }

      return {};
    } catch (e) {
      if (e is DioException && e.response?.data != null) {
        return e.response!.data;
      }
      rethrow;
    }
  }

 Future<Map<String, dynamic>> login({
    required String email,
    required String password,
  }) async {
    try {
      final response = await DioHelper.dio.post(
        '/api/Auth/login',
        data: {"email": email, "password": password},
      );

      final data = response.data;

      if (data is Map<String, dynamic>) {
        return data;
      }

      return {};
    } on DioException catch (e) {
      if (e.response?.data is Map<String, dynamic>) {
        final errorData = e.response!.data as Map<String, dynamic>;

        throw Exception(
          errorData['message'] ?? errorData['error'] ?? "Login failed",
        );
      }

      throw Exception("Network error");
    }
  }

  Future<List<dynamic>> getFaculties() async {
    try {
      final response = await DioHelper.dio.get('/api/Faculties');

      final rawData = response.data;

      if (rawData == null) {
        return [];
      }

      final data = rawData is List ? rawData : rawData['data'];

      if (data == null || data is! List || data.isEmpty) {
        return [];
      }

      return data;
    } catch (e) {
      if (e is DioException && e.response?.statusCode == 404) {
        return [];
      }
      rethrow;
    }
  }
}
