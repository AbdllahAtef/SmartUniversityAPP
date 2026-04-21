import 'package:flutter/material.dart';
import 'package:smart_university_app/features/courses/presentation/views/widgets/assignment_view_body.dart';

class AssigmentSubmissionScreen extends StatelessWidget {
  const AssigmentSubmissionScreen({super.key, required this.assignmentId});

  final int assignmentId ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: AssignmentViewBody(assignmentId: assignmentId));
  }
}
