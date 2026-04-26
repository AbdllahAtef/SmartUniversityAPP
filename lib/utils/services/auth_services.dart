import 'package:dio/dio.dart';
import 'package:smart_university_app/utils/dio_helper.dart';

class AuthService {
  Future<Response> register({
    required String fullName,
    required String email,
    required String password,
    required String nationalId,
    required String role,
    required int facultyId,
  }) async {
    return await DioHelper.dio.post(
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
  }
  Future<Response> login({
    required String email,
    required String password,
  }) async {
    return await DioHelper.dio.post(
      '/api/Auth/login',
      data: {"email": email, "password": password},
    );
  }
  

  Future<Response> getFaculties() async {
    return await DioHelper.dio.get('/api/Faculties');
  }
}
