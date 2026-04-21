import 'package:flutter/material.dart';
import 'package:smart_university_app/features/courses/presentation/views/widgets/courses_list.dart';
import 'package:smart_university_app/features/courses/presentation/views/widgets/search_field.dart';

class CoursesViewBody extends StatelessWidget {
  const CoursesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SearchField(),
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
