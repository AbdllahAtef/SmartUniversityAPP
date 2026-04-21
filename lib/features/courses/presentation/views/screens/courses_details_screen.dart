import 'package:flutter/material.dart';
import 'package:smart_university_app/features/courses/model/courses_model.dart';
import 'package:smart_university_app/features/courses/presentation/views/widgets/courses_details_body.dart';

class CoursesDetailsScreen extends StatelessWidget {
  const CoursesDetailsScreen({super.key, required this.course});
  final CourseModel course;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: CoursesDetailsBody(course: course,),
    );
  }
}