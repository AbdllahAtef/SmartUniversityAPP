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
    final assignments = ref.watch(assignmentsByCourseProvider(course.id));
    final quizzes = ref.watch(quizzesByCourseProvider(course.id));
    final count = ref.watch(tasksCountProvider(course.id));

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
          TasksHeader(count: count),
          const SizedBox(height: 8),
          Expanded(
            child: tabIndex == 0
                ? AssignmentsListView(assignments: assignments)
                : QuizzesListView(quizzes: quizzes),
          ),
        ],
      ),
    );
  }
}
