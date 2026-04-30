import 'package:dio/dio.dart';
import 'package:smart_university_app/models/courses_model.dart';
import 'package:smart_university_app/utils/dio_helper.dart';

class CourseService {
  Future<List<CourseModel>> getCourses({String? name}) async {
    try {
      final response = await DioHelper.dio.get(
        '/api/Courses',
        queryParameters: {"name": name, "page": 1, "pageSize": 10},
      );

      final rawData = response.data;

      if (rawData == null) {
        return [];
      }

      final data = rawData is List ? rawData : rawData['data'];

      if (data == null || data is! List || data.isEmpty) {
        return [];
      }

      return data.map<CourseModel>((e) => CourseModel.fromJson(e)).toList();
    } catch (e) {
      if (e is DioException && e.response?.statusCode == 404) {
        return [];
      }
      rethrow;
    }
  }
}
