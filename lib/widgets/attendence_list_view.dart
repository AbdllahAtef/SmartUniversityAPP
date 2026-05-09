import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_university_app/models/courses_model.dart';
import 'package:smart_university_app/providers/attendence_provider.dart';
import 'package:smart_university_app/widgets/universal_card.dart';

class AttendenceListView extends ConsumerWidget {
  const AttendenceListView({super.key, required this.course});

  final CourseModel course;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sessions = ref.watch(attendanceSessionsProvider);

    return ListView.builder(
      padding: EdgeInsets.zero,
      itemCount: sessions.length,
      itemBuilder: (context, index) {
        final session = sessions[index];

        return UniversalCard(
          title: "Lecture ${index + 1}",
          description: course.name,
          date: session.date.toString(),
          icon: Icons.person_2_outlined,
          color: const Color(0XFF8B2072),
          isAttendance: true,
          course: course,
          sessionId: session.sessionId,
        );
      },
    );
  }
}
