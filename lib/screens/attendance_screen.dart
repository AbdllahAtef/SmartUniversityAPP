import 'package:flutter/material.dart';
import 'package:smart_university_app/models/courses_model.dart';
import 'package:smart_university_app/widgets/attendence_view_body.dart';

class AttendanceScreen extends StatelessWidget {
  const AttendanceScreen({
    super.key,
    required this.course,
    required this.sessionId,
  });

  final CourseModel course;
  final int sessionId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: AttendenceViewBody(course: course, sessionId: sessionId),
      ),
    );
  }
}
