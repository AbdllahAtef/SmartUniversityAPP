import 'package:dio/dio.dart';
import 'package:smart_university_app/models/grades_model.dart';
import 'package:smart_university_app/utils/dio_helper.dart';

class GradesService {
  Future<GradesModel?> getGradeByCourseId(int courseId) async {
    try {
      final response = await DioHelper.dio.get('/api/grades/$courseId');

      final data = response.data;

      if (data == null) {
        return null;
      }

      if (data is Map<String, dynamic>) {
        return GradesModel.fromJson(data);
      }

      return null;
    } catch (e) {
      if (e is DioException && e.response?.statusCode == 404) {
        return null;
      }
      rethrow;
    }
  }
}
