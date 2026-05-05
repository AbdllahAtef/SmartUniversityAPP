import 'package:flutter/material.dart';
import 'package:smart_university_app/models/courses_model.dart';
import 'package:smart_university_app/widgets/attendence_view_body.dart';

class AttendanceScreen extends StatelessWidget {
  const AttendanceScreen({super.key, required this.course});
  final CourseModel course;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: AttendenceViewBody(course: course)),
    );
  }
}
