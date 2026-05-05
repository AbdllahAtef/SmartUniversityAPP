import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_university_app/providers/attendence_provider.dart';
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
