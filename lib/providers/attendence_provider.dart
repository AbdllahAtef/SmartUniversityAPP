import 'package:flutter_riverpod/legacy.dart';

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
