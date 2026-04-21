import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:smart_university_app/features/courses/model/assignments_model.dart';
import 'package:smart_university_app/features/courses/presentation/views/widgets/universal_card.dart';

class AssignmentsListView extends StatelessWidget {
  final List<AssignmentModel> assignments;

  const AssignmentsListView({super.key, required this.assignments});

  @override
  Widget build(BuildContext context) {
    return assignments.isEmpty
        ? const Center(child: Text("No assignments found."))
        : ListView.builder(
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
                assignmentId: assignment.id,
              );
            },
          );
  }
}
