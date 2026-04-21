import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_university_app/features/courses/view_model/courses_view_model.dart';
import 'package:smart_university_app/features/courses/presentation/views/screens/courses_details_screen.dart';
import 'package:smart_university_app/features/courses/presentation/views/widgets/course_list_item.dart';

class CoursesList extends ConsumerWidget {
  const CoursesList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final courses = ref.watch(filteredSubjectsProvider);

    return courses.isEmpty
        ? const Center(child: Text("No courses found"))
        : ListView.builder(
            itemCount: courses.length,
            itemBuilder: (context, index) {
              final course = courses[index];
              return CourseListItem(
                title: course.name,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => CoursesDetailsScreen(course: course),
                    ),
                  );
                },
              );
            },
          );
  }
}
