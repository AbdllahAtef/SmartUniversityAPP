import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:smart_university_app/models/grades_model.dart';
import 'package:smart_university_app/providers/courses_provider.dart';
import 'package:smart_university_app/utils/dio_helper.dart';
import 'package:smart_university_app/utils/services/grades_services.dart';

final gradesTypesProvider = Provider<List<String>>((ref) {
  return ["Final Grades", "Midterm"];
});

final selectedTypeProvider = StateProvider<String>((ref) {
  return ref.read(gradesTypesProvider).first;
});

final gradesServiceProvider = Provider<GradesService>((ref) {
  return GradesService();
});

final gradeProvider = FutureProvider.family<GradesModel?, int>((
  ref,
  courseId,
) async {
  final service = ref.read(gradesServiceProvider);
  return service.getGradeByCourseId(courseId);
});
final allGradesProvider = FutureProvider<List<GradeWithCourse>>((ref) async {
  final courses = await ref.watch(myCoursesProvider.future);
  final gradeService = ref.read(gradesServiceProvider);

  final List<GradeWithCourse> result = [];

  final results = await Future.wait(
    courses.map((course) async {
      final grade = await gradeService.getGradeByCourseId(course.id);
      if (grade == null) return null;

      return GradeWithCourse(grade: grade, course: course);
    }),
  );

  return results.whereType<GradeWithCourse>().toList();
});
