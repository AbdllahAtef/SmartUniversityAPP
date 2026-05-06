import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_university_app/models/course_students_model.dart';
import 'package:smart_university_app/providers/results_provider.dart';
import 'package:smart_university_app/widgets/student_grade_item.dart';

class AddGradesListView extends ConsumerWidget {
  const AddGradesListView({super.key, required this.studentsAsync});

  final AsyncValue<List<CourseStudentsModel>> studentsAsync;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Expanded(
      child: studentsAsync.when(
        data: (students) {
          return ListView.builder(
            padding: EdgeInsets.zero,
            itemCount: students.length,
            itemBuilder: (context, index) {
              final student = students[index];
              final selectedType = ref.watch(selectedTypeProvider);
              final controller = ref
                  .read(gradeControllersProvider.notifier)
                  .getController(student.id, ref);

              return StudentGradeItem(
                name: student.fullName,
                code: student.id,
                selectedType: selectedType,
                controller: controller,
              );
            },
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text("Error: $e")),
      ),
    );
  }
}
