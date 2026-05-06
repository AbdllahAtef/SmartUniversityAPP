import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:smart_university_app/models/grades_model.dart';
import 'package:smart_university_app/providers/courses_provider.dart';
import 'package:smart_university_app/providers/user_id_provider.dart';
import 'package:smart_university_app/utils/services/grades_services.dart';

final gradesTypesProvider = Provider<List<String>>((ref) {
  return ["Final Grades", "Midterm"];
});

final selectedTypeProvider = StateProvider<String>((ref) {
  return ref.read(gradesTypesProvider).first;
});

final gradesServiceProvider = Provider((ref) => GradesService());

final gradeProvider = FutureProvider.family<GradeResponseModel?, int>((
  ref,
  courseId,
) async {
  final token = ref.watch(tokenProvider);
  if (token == null) return null;

  final service = ref.read(gradesServiceProvider);
  return service.getGradeByCourseId(courseId);
});
final allGradesProvider = FutureProvider<List<GradeWithCourse>>((ref) async {
  final token = ref.watch(tokenProvider);
  if (token == null) return [];

  final courses = await ref.watch(myCoursesProvider.future);
  final gradeService = ref.read(gradesServiceProvider);

  final results = await Future.wait(
    courses.map((course) async {
      final grade = await gradeService.getGradeByCourseId(course.id);
      if (grade == null) return null;

      return GradeWithCourse(grade: grade, course: course);
    }),
  );

  return results.whereType<GradeWithCourse>().toList();
});
final gradeControllersProvider =
    StateNotifierProvider<
      GradeControllersNotifier,
      Map<int, TextEditingController>
    >((ref) => GradeControllersNotifier());

class GradeControllersNotifier
    extends StateNotifier<Map<int, TextEditingController>> {
  GradeControllersNotifier() : super({});

TextEditingController getController(int id, WidgetRef ref) {
    if (state.containsKey(id)) return state[id]!;

    final controller = TextEditingController();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!state.containsKey(id)) {
        state = {...state, id: controller};
      }
    });

    return controller;
  }

  @override
  void dispose() {
    for (final c in state.values) {
      c.dispose();
    }
    super.dispose();
  }
}
final midtermControllerProvider = Provider<TextEditingController>((ref) {
  final controller = TextEditingController();

  ref.onDispose(() {
    controller.dispose();
  });

  return controller;
});

final finalControllerProvider = Provider<TextEditingController>((ref) {
  final controller = TextEditingController();

  ref.onDispose(() {
    controller.dispose();
  });

  return controller;
});
