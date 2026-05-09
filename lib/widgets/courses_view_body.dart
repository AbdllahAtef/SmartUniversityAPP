import 'package:flutter/material.dart';
import 'package:smart_university_app/providers/search_provider.dart';
import 'package:smart_university_app/widgets/courses_list.dart';
import 'package:smart_university_app/widgets/search_field.dart';

class CoursesViewBody extends StatelessWidget {
  const CoursesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SearchField(provider: searchProvider),
        Expanded(
          child: Container(
            color: Colors.grey.withOpacity(0.1),
            child: const CoursesList(),
          ),
        ),
      ],
    );
  }
}
