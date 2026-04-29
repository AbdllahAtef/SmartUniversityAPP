import 'package:dio/dio.dart';
import 'package:smart_university_app/models/question_model.dart';
import 'package:smart_university_app/models/quiz_result_model.dart';
import 'package:smart_university_app/models/quiz_status_model.dart';
import 'package:smart_university_app/models/quizes_model.dart';
import 'package:smart_university_app/utils/dio_helper.dart';

class QuizService {
  Future<List<QuizModel>> getQuizzes(int courseId) async {
    final response = await DioHelper.dio.get('/api/courses/$courseId/quizzes');

    final List data = response.data is List
        ? response.data as List
        : response.data['data'] as List;

    return data
        .map((e) => QuizModel.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  Future<QuizStatusModel> getQuizStatus(int quizId) async {
    final response = await DioHelper.dio.get(
      '/api/QuizSubmissions/status/$quizId',
    );

    return QuizStatusModel.fromJson(response.data);
  }

  Future<void> startQuiz(int quizId) async {
    await DioHelper.dio.post('/api/quizzes/$quizId/start');
  }

  Future<List<QuestionModel>> getQuestions(int quizId) async {
    final response = await DioHelper.dio.get('/api/Questions/quiz/$quizId');

    final data = response.data;

    return (data as List).map((e) => QuestionModel.fromJson(e)).toList();
  }

  Future<void> submitQuiz(int quizId, Map<int, int> answers) async {
    if (answers.isEmpty) {
      throw Exception("Cannot submit quiz with no answers selected");
    }

    final body = {
      "quizId": quizId,
      "answers": answers.entries
          .map((e) => {"questionId": e.key, "selectedOptionId": e.value})
          .toList(),
    };

    print("=== QUIZ SUBMISSION DEBUG ===");
    print("Quiz ID: $quizId");
    print("Answers Map: $answers");
    print("Request Body: $body");
    print("=============================");

    try {
      final response = await DioHelper.dio.post(
        "/api/QuizSubmissions",
        data: body,
      );

      print("SUCCESS RESPONSE: ${response.data}");
    } on DioException catch (e) {
      print("SUBMISSION ERROR - STATUS: ${e.response?.statusCode}");
      print("SUBMISSION ERROR - DATA: ${e.response?.data}");
      print("SUBMISSION ERROR - MESSAGE: ${e.message}");
      print("SUBMISSION ERROR - REQUEST DATA: ${e.requestOptions.data}");
      rethrow;
    }
  }

  Future<QuizResultModel> getQuizResult(int quizId) async {
    final response = await DioHelper.dio.get(
      '/api/QuizSubmissions/result/$quizId',
    );

    return QuizResultModel.fromJson(response.data);
  }
}
