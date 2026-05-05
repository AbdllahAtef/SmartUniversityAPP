import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_university_app/providers/courses_provider.dart';
import 'package:smart_university_app/screens/courses_details_screen.dart';
import 'package:smart_university_app/widgets/course_list_item.dart';

class CoursesList extends ConsumerWidget {
  const CoursesList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final coursesAsync = ref.watch(coursesByRoleProvider);

    return coursesAsync.when(
      data: (courses) {
        if (courses.isEmpty) {
          return const Center(child: Text("No courses Registered"));
        }

        return ListView.builder(
          padding: EdgeInsets.zero,
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
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (e, _) => Center(child: Text("Error: $e")),
    );
  }
}
