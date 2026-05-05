import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_university_app/models/add_grades_model.dart';
import 'package:smart_university_app/providers/attendence_provider.dart';
import 'package:smart_university_app/providers/results_provider.dart';
import 'package:smart_university_app/utils/services/attendence_service.dart';

Future<void> submitAttendance(WidgetRef ref, int courseId) async {
  final attendanceMap = ref.read(attendanceProvider);
  final service = AttendenceService();

  try {
    ref.read(isSubmittingProvider.notifier).state = true;

    final sessionId = await service.createSession(courseId);

    final presentStudents = attendanceMap.entries.where((e) => e.value == true);

    await Future.wait(
      presentStudents.map((entry) {
        return service.sendAttendance(
          sessionId: sessionId,
          studentId: entry.key,
          isPresent: true,
        );
      }),
    );

    ref.read(attendanceProvider.notifier).clear();
  } catch (e) {
    rethrow;
  } finally {
    ref.read(isSubmittingProvider.notifier).state = false;
  }
}

Future<void> submitGrades({
  required WidgetRef ref,
  required int courseId,
}) async {
  final controllers = ref.read(gradeControllersProvider);
  final selectedType = ref.read(selectedTypeProvider);
  final service = ref.read(gradesServiceProvider);

  try {
    ref.read(isSubmittingProvider.notifier).state = true;

    final requests = controllers.entries.where((e) {
      return e.value.text.isNotEmpty;
    });

    await Future.wait(
      requests.map((entry) {
        final studentId = entry.key;
        final grade = int.parse(entry.value.text);

        final model = SubmitGradeModel(
          studentId: studentId,
          courseId: courseId,
          grade: grade,
          type: selectedType,
        );

        return service.submitGrade(model);
      }),
    );

    final notifier = ref.read(gradeControllersProvider.notifier);
    notifier.dispose();
    ref.invalidate(gradeControllersProvider);
  } catch (e) {
    rethrow;
  } finally {
    ref.read(isSubmittingProvider.notifier).state = false;
  }
}

String getErrorMessage(DioException e) {
  final data = e.response?.data;

  if (data is Map<String, dynamic>) {
    return data['error'] ??
        data['message'] ??
        data['title'] ??
        "Something went wrong";
  }

  return "Something went wrong";
}
