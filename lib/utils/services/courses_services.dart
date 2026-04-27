import 'package:smart_university_app/models/courses_model.dart';
import 'package:smart_university_app/utils/dio_helper.dart';

class CourseService {
  Future<List<CourseModel>> getCourses({String? name}) async {
    final response = await DioHelper.dio.get(
      '/api/Courses',
      queryParameters: {"name": name, "page": 1, "pageSize": 10},
    );

    List data = response.data['data'];

    return data.map((e) => CourseModel.fromJson(e)).toList();
  }
}
