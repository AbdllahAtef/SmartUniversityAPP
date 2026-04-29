import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:smart_university_app/models/courses_model.dart';
import 'package:smart_university_app/models/lecture_model.dart';
import 'package:smart_university_app/providers/user_id_provider.dart';
import 'package:smart_university_app/utils/date_utils.dart';
import 'package:smart_university_app/utils/services/lecture_service.dart';

final selectedDateProvider = StateProvider<DateTime>((ref) => DateTime.now());

final datesProvider = Provider<List<DateTime>>((ref) {
  return generateDates();
});

final studentIdProvider = userIdProvider;

final scheduleServiceProvider = Provider<ScheduleService>((ref) {
  return ScheduleService();
});

final myCoursesProvider = FutureProvider<List<CourseModel>>((ref) async {
  final studentId = ref.watch(studentIdProvider);
  if (studentId == null) return [];
  final service = ref.watch(scheduleServiceProvider);
  return service.getMyCourses(studentId);
});

final allLecturesProvider = FutureProvider<List<LectureModel>>((ref) async {
  final studentId = ref.watch(studentIdProvider);
  if (studentId == null) return [];
  final service = ref.watch(scheduleServiceProvider);
  return service.getAllLecturesForStudent(studentId);
});

final filteredLecturesProvider = Provider<AsyncValue<List<LectureModel>>>((
  ref,
) {
  final selectedDate = ref.watch(selectedDateProvider);
  final lecturesAsync = ref.watch(allLecturesProvider);

  return lecturesAsync.whenData((lectures) {
    final day = selectedDate.weekday % 7;
    return lectures.where((lecture) => lecture.day == day).toList();
  });
});
