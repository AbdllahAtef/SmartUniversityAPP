import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:smart_university_app/models/assignment_submission_model.dart';
import 'package:smart_university_app/models/assignments_model.dart';
import 'package:smart_university_app/utils/dio_helper.dart';

class AssignmentService {
  Future<List<AssignmentModel>> getAssignments(int courseId) async {
    final response = await DioHelper.dio.get(
      '/api/Assignments/course/$courseId',
    );

    final data = response.data is List ? response.data : response.data['data'];

    return List<AssignmentModel>.from(
      data.map((e) => AssignmentModel.fromJson(e)),
    );
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
    final response = await DioHelper.dio.get(
      '/api/AssignmentSubmissions/assignment/$assignmentId',
    );

    final data = response.data is List ? response.data : response.data['data'];

    return List<AssignmentSubmissionModel>.from(
      data.map((e) => AssignmentSubmissionModel.fromJson(e)),
    );
  }

  Future<void> deleteSubmission(int id) async {
    await DioHelper.dio.delete('/api/AssignmentSubmissions/$id');
  }
}
