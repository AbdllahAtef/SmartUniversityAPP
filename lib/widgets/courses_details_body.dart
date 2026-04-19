import 'package:flutter/material.dart';
import 'package:smart_university_app/widgets/course_header.dart';

class CoursesDetailsBody extends StatelessWidget {
  const CoursesDetailsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(children: [CourseHeader(title: "Course Details")]);
  }
}
