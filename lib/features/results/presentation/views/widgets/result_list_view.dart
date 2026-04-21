import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_university_app/features/results/view_model/results_view_model.dart';
import 'package:smart_university_app/features/courses/presentation/views/widgets/course_list_item.dart';
import 'package:smart_university_app/features/results/presentation/views/widgets/grades_box.dart';

class ResultListView extends ConsumerWidget {
  const ResultListView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final grades = ref.watch(gradesProvider);
    return Expanded(
      child: Container(
        color: Colors.grey.withOpacity(0.1),
        child: grades.isEmpty
            ? const Center(child: Text("No results available"))
            : ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: grades.length,
                itemBuilder: (context, index) {
                  final item = grades[index];
                  return CourseListItem(
                    title: item.name,
                    onTap: () {},
                    trailing: GradesBox(grades: item),
                  );
                },
              ),
      ),
    );
  }
}
