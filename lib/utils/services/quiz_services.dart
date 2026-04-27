import 'package:smart_university_app/models/quizes_model.dart';
import 'package:smart_university_app/utils/dio_helper.dart';

class QuizService {
  Future<List<QuizModel>> getQuizzes(int courseId) async {
    final response = await DioHelper.dio.get('/api/Quiz/course/$courseId');

    List data = response.data;

    return data.map((e) => QuizModel.fromJson(e)).toList();
  }
}
