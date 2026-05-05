import 'package:file_picker/file_picker.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:smart_university_app/models/assignments_model.dart';
import 'package:smart_university_app/models/create_assignment_model.dart';
import 'package:smart_university_app/utils/services/assignment_services.dart';

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
final createAssignmentProvider =
    StateNotifierProvider<CreateAssignmentNotifier, AsyncValue<void>>((ref) {
      return CreateAssignmentNotifier(ref);
    });

class CreateAssignmentNotifier extends StateNotifier<AsyncValue<void>> {
  final Ref ref;

  CreateAssignmentNotifier(this.ref) : super(const AsyncData(null));

  Future<void> create({
    required String title,
    required String description,
    required DateTime dueDate,
    required int maxGrade,
    required int courseId,
  }) async {
    state = const AsyncLoading();

    try {
      final service = ref.read(assignmentServiceProvider);

      final model = CreateAssignmentModel(
        title: title,
        description: description,
        dueDate: dueDate.toIso8601String(),
        maxGrade: maxGrade,
        courseId: courseId,
      );

      await service.createAssignment(model);

      state = const AsyncData(null);
    } catch (e, s) {
      state = AsyncError(e, s);
    }
  }
}

final isPickingFileProvider = StateProvider<bool>((ref) => false);
final fileProvider = StateProvider<PlatformFile?>((ref) => null);
