import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_university_app/providers/user_id_provider.dart';
import 'package:smart_university_app/widgets/courses_list.dart';
import 'package:smart_university_app/widgets/custom_app_bar.dart';
import 'package:smart_university_app/widgets/grades_dropdown.dart';
import 'package:smart_university_app/widgets/result_list_view.dart';

class ResultViewBody extends ConsumerWidget {
  const ResultViewBody({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final role = ref.watch(userRoleProvider);

    if (role == 'student') {
      return const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(padding: EdgeInsets.all(16), child: GradesDropdown()),
          Expanded(child: ResultListView()),
        ],
      );
    }

    if (role == 'doctor') {
      return const Column(
        children: [
          CustomAppBar(title: "Grades"),
          SizedBox(height: 20),
          Expanded(child: CoursesList( isgrades:true)),
        ],
      );
    }
    return const Center(child: Text("No role detected"));
  }
}
