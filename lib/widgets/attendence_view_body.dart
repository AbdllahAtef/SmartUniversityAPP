import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_university_app/models/courses_model.dart';
import 'package:smart_university_app/providers/attendence_provider.dart';
import 'package:smart_university_app/providers/search_provider.dart';
import 'package:smart_university_app/utils/helpers.dart';
import 'package:smart_university_app/widgets/course_header.dart';
import 'package:smart_university_app/widgets/custom_elevated_button.dart';
import 'package:smart_university_app/widgets/search_field.dart';
import 'package:smart_university_app/widgets/students_attendance_list_view.dart';

class AttendenceViewBody extends ConsumerWidget {
  final CourseModel course;
  final int sessionId;

  const AttendenceViewBody({
    super.key,
    required this.course,
    required this.sessionId,
  });
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final studentsAsync = ref.watch(filteredStudentsProvider(course.id));
    final attendance = ref.watch(attendanceProvider);
    final isSubmitting = ref.watch(isSubmittingProvider);
    return Column(
      children: [
        Expanded(
          child: studentsAsync.when(
            data: (students) {
              if (students.isEmpty) {
                return const Center(child: Text("No students"));
              }
              return Column(
                children: [
                  CourseHeader(
                    title: "Attendence",
                    isAttendance: true,
                    students: students.map((e) => e.id).toList(),
                  ),
                  const SizedBox(height: 10),
                  SearchField(provider: studentSearchProvider),
                  const SizedBox(height: 10),
                  Expanded(
                    child: StudentsAttendanceListView(
                      attendance: attendance,
                      students: students,
                    ),
                  ),
                ],
              );
            },
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (e, _) => Center(child: Text(e.toString())),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(12),
          child: CustomElevatedButton(
            text: isSubmitting ? "Submitting..." : "Submit Attendance",
            onPressed: isSubmitting
                ? null
                : () async {
                    try {
                      await submitAttendance(ref, sessionId);
                      if (context.mounted) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text("Attendance submitted")),
                        );
                        Navigator.pop(context);
                      }
                    } catch (e) {
                      ScaffoldMessenger.of(
                        context,
                      ).showSnackBar(SnackBar(content: Text(e.toString())));
                    }
                  },
          ),
        ),
      ],
    );
  }
}
