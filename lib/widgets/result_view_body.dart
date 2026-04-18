import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_university_app/providers/results_provider.dart';
import 'package:smart_university_app/widgets/course_list_item.dart';
import 'package:smart_university_app/widgets/credits_texts.dart';
import 'package:smart_university_app/widgets/grades_box.dart';
import 'package:smart_university_app/widgets/grades_dropdown.dart';

class ResultViewBody extends StatelessWidget {
  const ResultViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(padding: EdgeInsetsGeometry.all(16), child: GradesDropdown()),
        CreditsTexts(),
        ResultListView(),
      ],
    );
  }
}

class ResultListView extends ConsumerWidget {
  const ResultListView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final grades = ref.watch(gradesProvider);

    return Expanded(
      child: Container(
        color: Colors.grey.withOpacity(0.1),
        child: ListView.builder(
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
