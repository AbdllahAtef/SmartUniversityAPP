import 'package:flutter/material.dart';
import 'package:smart_university_app/models/courses_model.dart';
import 'package:smart_university_app/widgets/create_asignment_body.dart';

class CreateAssignmentScreen extends StatelessWidget {
  final CourseModel course;
  const CreateAssignmentScreen({super.key, required this.course});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: CreateAsignmentBody(course: course),),
    );
  }
}
