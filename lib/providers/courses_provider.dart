import 'package:file_picker/file_picker.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:smart_university_app/models/assignments_model.dart';
import 'package:smart_university_app/models/courses_model.dart';
import 'package:smart_university_app/models/quizes_model.dart';
import 'package:smart_university_app/utils/mock_data.dart';

final tabIndexProvider = StateProvider<int>((ref) => 0);

final assignmentsByCourseProvider = Provider.family<List<AssignmentModel>, int>(
  (ref, courseId) {
    return assignments.where((a) => a.courseId == courseId).toList();
  },
);

final quizzesByCourseProvider = Provider.family<List<QuizModel>, int>((
  ref,
  courseId,
) {
  return quizzes.where((q) => q.courseId == courseId).toList();
});

final tasksCountProvider = Provider.family<int, int>((ref, courseId) {
  final tabIndex = ref.watch(tabIndexProvider);

  final assignments = ref.watch(assignmentsByCourseProvider(courseId));

  final quizzes = ref.watch(quizzesByCourseProvider(courseId));

  return tabIndex == 0 ? assignments.length : quizzes.length;
});
final assignmentByIdProvider = Provider.family<AssignmentModel, int>((
  ref,
  assignmentId,
) {
  return assignments.firstWhere((a) => a.id == assignmentId);
});

const tabs = ["Assignments", "Quizzes"];

final searchProvider = StateProvider<String>((ref) => '');

final filteredSubjectsProvider = Provider<List<CourseModel>>((ref) {
  final search = ref.watch(searchProvider).toLowerCase();
  final subjects = courses;

  if (search.isEmpty) return subjects;

  return subjects.where((course) {
    return course.name.toLowerCase().contains(search) ||
        course.code.toLowerCase().contains(search);
  }).toList();
});
final fileProvider = StateProvider<PlatformFile?>((ref) => null);
