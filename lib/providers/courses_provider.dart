import 'package:file_picker/file_picker.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:smart_university_app/models/assignments_model.dart';
import 'package:smart_university_app/models/courses_model.dart';
import 'package:smart_university_app/models/quizes_model.dart';
import 'package:smart_university_app/utils/services/assignment_services.dart';
import 'package:smart_university_app/utils/services/courses_services.dart';
import 'package:smart_university_app/utils/services/quiz_services.dart';

// 🔹 tabs
final tabIndexProvider = StateProvider<int>((ref) => 0);
const tabs = ["Assignments", "Quizzes"];

// 🔹 search
final searchProvider = StateProvider<String>((ref) => '');

// 🔹 courses
final courseServiceProvider = Provider((ref) {
  return CourseService();
});

final coursesProvider = FutureProvider<List<CourseModel>>((ref) async {
  final service = ref.read(courseServiceProvider);
  return service.getCourses();
});

// 🔹 filtered courses
final filteredCoursesProvider = Provider<AsyncValue<List<CourseModel>>>((ref) {
  final search = ref.watch(searchProvider).toLowerCase();
  final coursesAsync = ref.watch(coursesProvider);

  return coursesAsync.whenData((courses) {
    if (search.isEmpty) return courses;

    return courses.where((course) {
      return course.name.toLowerCase().contains(search) ||
          course.code.toLowerCase().contains(search);
    }).toList();
  });
});

// 🔹 assignments API
final assignmentServiceProvider = Provider((ref) {
  return AssignmentService();
});

final assignmentsProvider = FutureProvider.family<List<AssignmentModel>, int>((
  ref,
  courseId,
) async {
  final service = ref.read(assignmentServiceProvider);
  return service.getAssignments(courseId);
});


final tokenProvider = StateProvider<String>((ref) => '');

final userIdProvider = Provider<int>((ref) {
  final token = ref.watch(tokenProvider);
  if (token.isEmpty) return 0;

  final decodedToken = JwtDecoder.decode(token);

  final id =
      decodedToken['http://schemas.xmlsoap.org/ws/2005/05/identity/claims/nameidentifier'];

  return int.tryParse(id.toString()) ?? 0;
});

// 🔹 quizzes API
final quizServiceProvider = Provider((ref) {
  return QuizService();
});

final quizzesProvider = FutureProvider.family<List<QuizModel>, int>((
  ref,
  courseId,
) async {
  final service = ref.read(quizServiceProvider);
  return service.getQuizzes(courseId);
});

// 🔹 upload
final isPickingFileProvider = StateProvider<bool>((ref) => false);
final fileProvider = StateProvider<PlatformFile?>((ref) => null);
