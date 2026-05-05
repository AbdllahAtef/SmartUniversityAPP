import 'package:dio/dio.dart';
import 'package:smart_university_app/models/add_grades_model.dart';
import 'package:smart_university_app/models/grades_model.dart';
import 'package:smart_university_app/utils/dio_helper.dart';

class GradesService {
  Future<GradeResponseModel?> getGradeByCourseId(int courseId) async {
    try {
      final response = await DioHelper.dio.get('/api/grades/$courseId');

      final data = response.data;

      if (data == null) return null;

      if (data is Map<String, dynamic>) {
        return GradeResponseModel.fromJson(data);
      }

      return null;
    } catch (e) {
      if (e is DioException && e.response?.statusCode == 404) {
        return null;
      }
      rethrow;
    }
  }
  Future<void> submitGrade(SubmitGradeModel model) async {
    await DioHelper.dio.post(model.endpoint, data: model.toJson());
  }
}
