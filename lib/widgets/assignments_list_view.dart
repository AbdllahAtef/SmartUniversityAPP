import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:smart_university_app/models/assignments_model.dart';
import 'package:smart_university_app/widgets/universal_card.dart';

class AssignmentsListView extends StatelessWidget {
  final List<AssignmentModel> assignments;

  const AssignmentsListView({super.key, required this.assignments});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.zero,
      itemCount: assignments.length,
      itemBuilder: (context, index) {
        final assignment = assignments[index];
        return UniversalCard(
          title: assignment.title,
          description: assignment.description,
          date: DateFormat('MMM d, yyyy').format(assignment.dueDate),
          extra: "Max: ${assignment.maxGrade}",
          icon: Icons.assignment,
          color: const Color(0XFF8B2072),
          assignment: assignment,
        );
      },
    );
  }
}
