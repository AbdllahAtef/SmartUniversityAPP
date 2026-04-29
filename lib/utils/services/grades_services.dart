import 'package:dio/dio.dart';
import 'package:smart_university_app/models/grades_model.dart';

class GradesService {
  final Dio dio;

  GradesService(this.dio);

  Future<GradesModel> getGradeByCourseId(int courseId) async {
    final response = await dio.get('/api/grades/$courseId');

    return GradesModel.fromJson(response.data);
  }
}
