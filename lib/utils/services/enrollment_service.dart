import 'package:smart_university_app/models/courses_model.dart';
import 'package:smart_university_app/utils/dio_helper.dart';

class EnrollmentService {
  Future<List<CourseModel>> getMyCourses(int studentId) async {
    final response = await DioHelper.dio.get(
      '/api/Enrollment/my-courses/$studentId',
    );

    return (response.data as List).map((e) => CourseModel.fromJson(e)).toList();
  }
}
