import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_university_app/providers/search_provide.dart';
import 'package:smart_university_app/screens/courses_details_screen.dart';
import 'package:smart_university_app/widgets/course_list_item.dart';

class CoursesList extends ConsumerWidget {
  const CoursesList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final courses = ref.watch(filteredSubjectsProvider);

    return ListView.builder(
      itemCount: courses.length,
      itemBuilder: (context, index) {
        final course = courses[index];

        return CourseListItem(
          title: course.name,
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => const CoursesDetailsScreen(),
              ),
            );
          },
        );
      },
    );
  }
}
