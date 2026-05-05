import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:smart_university_app/models/courses_model.dart';
import 'package:smart_university_app/providers/user_id_provider.dart';
import 'package:smart_university_app/utils/services/courses_services.dart';
import 'package:smart_university_app/utils/services/enrollment_service.dart';

final tabIndexProvider = StateProvider<int>((ref) => 0);
final tabsProvider = Provider<List<String>>((ref) {
  final role = ref.watch(userRoleProvider);

  final tabs = ["Assignments", "Quizzes"];

  if (role == "doctor") {
    tabs.add("Attendance");
  }

  return tabs;
});

final searchProvider = StateProvider<String>((ref) => '');
final courseServiceProvider = Provider((ref) {
  return CourseService();
});
final coursesProvider = FutureProvider<List<CourseModel>>((ref) async {
  final service = ref.read(courseServiceProvider);
  return service.getCourses();
});

final coursesByRoleProvider = FutureProvider<List<CourseModel>>((ref) async {
  final role = ref.watch(userRoleProvider);
  final service = ref.read(courseServiceProvider);

  if (role == "doctor") {
    return await service.getDoctorCourses();
  } else {
    return await ref.watch(myCoursesProvider.future);
  }
});
final enrollmentServiceProvider = Provider((ref) {
  return EnrollmentService();
});

final myCoursesProvider = FutureProvider<List<CourseModel>>((ref) async {
  final service = ref.read(enrollmentServiceProvider);

  return service.getMyCourses(ref.watch(userIdProvider) ?? 0);
});
final filteredCoursesProvider = Provider<AsyncValue<List<CourseModel>>>((ref) {
  final search = ref.watch(searchProvider).toLowerCase();
  final coursesAsync = ref.watch(coursesByRoleProvider);

  return coursesAsync.whenData((courses) {
    if (search.isEmpty) return courses;

    return courses.where((course) {
      return course.name.toLowerCase().contains(search) ||
          course.code.toLowerCase().contains(search);
    }).toList();
  });
});
