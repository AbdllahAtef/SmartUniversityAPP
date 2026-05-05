import 'package:dio/dio.dart';
import 'package:smart_university_app/models/create_question_model.dart';
import 'package:smart_university_app/models/create_quiz_model.dart';
import 'package:smart_university_app/models/question_model.dart';
import 'package:smart_university_app/models/quiz_result_model.dart';
import 'package:smart_university_app/models/quiz_status_model.dart';
import 'package:smart_university_app/models/quizes_model.dart';
import 'package:smart_university_app/utils/dio_helper.dart';

class QuizService {
  Future<List<QuizModel>> getQuizzes(int courseId) async {
    try {
      final response = await DioHelper.dio.get(
        '/api/courses/$courseId/quizzes',
      );

      final rawData = response.data;

      if (rawData == null) {
        return [];
      }

      final data = rawData is List
          ? rawData
          : rawData is Map
          ? rawData['data']
          : null;

      if (data == null || data is! List || data.isEmpty) {
        return [];
      }

      return data.map<QuizModel>((e) => QuizModel.fromJson(e)).toList();
    } catch (e) {
      if (e is DioException && e.response?.statusCode == 404) {
        return [];
      }
      rethrow;
    }
  }

  Future<List<QuestionModel>> getQuestionsWithAnswers(int quizId) async {
    final response = await DioHelper.dio.get(
      "/api/quizzes/$quizId/questionsWithAnswers",
    );

    return (response.data as List)
        .map((e) => QuestionModel.fromJson(e))
        .toList();
  }

  Future<QuizStatusModel?> getQuizStatus(int quizId) async {
    try {
      final response = await DioHelper.dio.get(
        '/api/QuizSubmissions/status/$quizId',
      );

      final data = response.data;

      if (data == null || data is! Map<String, dynamic>) {
        return null;
      }

      return QuizStatusModel.fromJson(data);
    } catch (e) {
      if (e is DioException && e.response?.statusCode == 404) {
        return null;
      }
      rethrow;
    }
  }

  Future<void> startQuiz(int quizId) async {
    await DioHelper.dio.post('/api/quizzes/$quizId/start');
  }

  Future<List<QuestionModel>> getQuestions(int quizId) async {
    try {
      final response = await DioHelper.dio.get('/api/Questions/quiz/$quizId');

      final rawData = response.data;

      if (rawData == null) {
        return [];
      }

      final data = rawData is List
          ? rawData
          : rawData is Map
          ? rawData['data']
          : null;

      if (data == null || data is! List || data.isEmpty) {
        return [];
      }

      return data.map<QuestionModel>((e) => QuestionModel.fromJson(e)).toList();
    } catch (e) {
      if (e is DioException && e.response?.statusCode == 404) {
        return [];
      }
      rethrow;
    }
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

    await DioHelper.dio.post("/api/QuizSubmissions", data: body);
  }

  Future<QuizResultModel?> getQuizResult(int quizId) async {
    try {
      final response = await DioHelper.dio.get(
        '/api/QuizSubmissions/result/$quizId',
      );

      final data = response.data;

      if (data == null || data is! Map<String, dynamic>) {
        return null;
      }

      return QuizResultModel.fromJson(data);
    } catch (e) {
      if (e is DioException && e.response?.statusCode == 404) {
        return null;
      }
      rethrow;
    }
  }

  Future<dynamic> createQuiz(CreateQuizModel request) async {
    final response = await DioHelper.dio.post(
      '/api/quizzes',
      data: request.toJson(),
    );
    return response.data['id'];
  }

  Future<void> createQuestion(CreateQuestionModel request) async {
    await DioHelper.dio.post('/api/questions', data: request.toJson());
  }
}
