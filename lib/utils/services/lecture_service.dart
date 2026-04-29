import 'package:smart_university_app/models/courses_model.dart';
import 'package:smart_university_app/models/lecture_model.dart';
import 'package:smart_university_app/utils/dio_helper.dart';

class ScheduleService {
  Future<List<CourseModel>> getMyCourses(int studentId) async {
    final response = await DioHelper.dio.get(
      '/api/Enrollment/my-courses/$studentId',
    );

    final List data = response.data;

    return data.map((e) => CourseModel.fromJson(e)).toList();
  }

  Future<List<LectureModel>> getLectures(int courseId) async {
    final response = await DioHelper.dio.get('/api/lectures/$courseId');

    final List data = response.data;

    return data.map((e) => LectureModel.fromJson(e)).toList();
  }

  Future<List<LectureModel>> getAllLecturesForStudent(int studentId) async {
    final courses = await getMyCourses(studentId);

    final futures = courses.map((course) {
      return getLectures(course.id);
    });

    final results = await Future.wait(futures);

    return results.expand((e) => e).toList();
  }
}
