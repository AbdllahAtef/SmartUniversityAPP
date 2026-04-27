import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_university_app/models/courses_model.dart';
import 'package:smart_university_app/providers/courses_provider.dart';
import 'package:smart_university_app/widgets/assignments_list_view.dart';
import 'package:smart_university_app/widgets/course_details_card.dart';
import 'package:smart_university_app/widgets/course_header.dart';
import 'package:smart_university_app/widgets/custom_tabs.dart';
import 'package:smart_university_app/widgets/quizzes_list_view.dart';
import 'package:smart_university_app/widgets/tasks_header.dart';

class CoursesDetailsBody extends ConsumerWidget {
  const CoursesDetailsBody({super.key, required this.course});
  final CourseModel course;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tabIndex = ref.watch(tabIndexProvider);
    final assignmentsAsync = ref.watch(assignmentsProvider(course.id));
    final quizzesAsync = ref.watch(quizzesProvider(course.id));

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        children: [
          const CourseHeader(title: "Course Details"),
          CourseDetailsCard(
            title: course.name,
            description: course.description,
          ),
          const SizedBox(height: 12),
          const CustomTabs(),
          const SizedBox(height: 12),
          TasksHeader(
            count: tabIndex == 0
                ? assignmentsAsync.value?.length ?? 0
                : quizzesAsync.value?.length ?? 0,
          ),
          const SizedBox(height: 8),
          Expanded(
            child: tabIndex == 0
                ? assignmentsAsync.when(
                    data: (assignments) {
                      if (assignments.isEmpty) {
                        return const Center(
                          child: Text("No assignments found"),
                        );
                      }
                      return AssignmentsListView(assignments: assignments);
                    },
                    loading: () =>
                        const Center(child: CircularProgressIndicator()),
                    error: (e, _) => Center(child: Text("Error: $e")),
                  )
                : quizzesAsync.when(
                    data: (quizzes) {
                      if (quizzes.isEmpty) {
                        return const Center(
                          child: Text("No quizzes available"),
                        );
                      }
                      return QuizzesListView(quizzes: quizzes);
                    },
                    loading: () =>
                        const Center(child: CircularProgressIndicator()),
                    error: (e, _) => Center(child: Text("Error: $e")),
                  ),
          ),
        ],
      ),
    );
  }
}
