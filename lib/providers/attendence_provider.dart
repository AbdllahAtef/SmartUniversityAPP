import 'package:flutter_riverpod/legacy.dart';
import 'package:smart_university_app/models/attendence_model.dart';
import 'package:smart_university_app/utils/services/attendence_service.dart';

final attendanceProvider =
    StateNotifierProvider<AttendanceNotifier, Map<int, bool>>((ref) {
      return AttendanceNotifier();
    });
final isSubmittingProvider = StateProvider<bool>((ref) => false);

class AttendanceNotifier extends StateNotifier<Map<int, bool>> {
  AttendanceNotifier() : super({});

  void toggle(int studentId, bool value) {
    state = {...state, studentId: value};
  }

  void toggleAll(List<int> studentIds, bool value) {
    final updated = {for (var id in studentIds) id: value};
    state = updated;
  }

  bool isPresent(int studentId) {
    return state[studentId] ?? false;
  }

  void clear() {
    state = {};
  }
}

final attendanceSessionsProvider =
    StateNotifierProvider<
      AttendanceSessionsNotifier,
      List<AttendanceSessionModel>
    >((ref) => AttendanceSessionsNotifier());

class AttendanceSessionsNotifier
    extends StateNotifier<List<AttendanceSessionModel>> {
  AttendanceSessionsNotifier() : super([]);

  Future<int> addSession(int courseId) async {
    final service = AttendenceService();

    final sessionId = await service.createSession(courseId);

    final newSession = AttendanceSessionModel(
      sessionId: sessionId,
      date: DateTime.now(),
    );

    state = [...state, newSession];

    return sessionId;
  }
}
