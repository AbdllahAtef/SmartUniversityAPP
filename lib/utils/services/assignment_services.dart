import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:smart_university_app/models/assignment_submission_model.dart';
import 'package:smart_university_app/models/assignments_model.dart';
import 'package:smart_university_app/models/create_assignment_model.dart';
import 'package:smart_university_app/utils/dio_helper.dart';

class AssignmentService {
  Future<List<AssignmentModel>> getAssignments(int courseId) async {
    try {
      final response = await DioHelper.dio.get(
        '/api/Assignments/course/$courseId',
      );

      final rawData = response.data;

      if (rawData == null) {
        return [];
      }

      final data = rawData is List ? rawData : rawData['data'];

      if (data == null || data is! List || data.isEmpty) {
        return [];
      }

      return data
          .map<AssignmentModel>((e) => AssignmentModel.fromJson(e))
          .toList();
    } catch (e) {
      if (e is DioException && e.response?.statusCode == 404) {
        return [];
      }
      rethrow;
    }
  }

  Future<void> submitAssignment({
    required int assignmentId,
    required PlatformFile file,
  }) async {
    final formData = FormData.fromMap({
      "assignmentId": assignmentId,
      "file": await MultipartFile.fromFile(file.path!, filename: file.name),
    });

    await DioHelper.dio.post('/api/AssignmentSubmissions', data: formData);
  }

  Future<List<AssignmentSubmissionModel>> getSubmissions(
    int assignmentId,
  ) async {
    try {
      final response = await DioHelper.dio.get(
        '/api/AssignmentSubmissions/assignment/$assignmentId',
      );

      final rawData = response.data;

      if (rawData == null) {
        return [];
      }

      final data = rawData is List ? rawData : rawData['data'];

      if (data == null || data is! List || data.isEmpty) {
        return [];
      }

      return data
          .map<AssignmentSubmissionModel>(
            (e) => AssignmentSubmissionModel.fromJson(e),
          )
          .toList();
    } catch (e) {
      if (e is DioException && e.response?.statusCode == 404) {
        return [];
      }
      rethrow;
    }
  }

  Future<void> deleteSubmission(int id) async {
    await DioHelper.dio.delete('/api/AssignmentSubmissions/$id');
  }

  Future<void> createAssignment(CreateAssignmentModel model) async {
    await DioHelper.dio.post('/api/Assignments', data: model.toJson());
  }
}
