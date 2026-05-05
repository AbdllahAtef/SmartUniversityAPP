import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_university_app/models/course_students_model.dart';
import 'package:smart_university_app/models/courses_model.dart';
import 'package:smart_university_app/providers/attendence_provider.dart';
import 'package:smart_university_app/providers/courses_provider.dart';
import 'package:smart_university_app/providers/results_provider.dart';
import 'package:smart_university_app/utils/helpers.dart';
import 'package:smart_university_app/utils/styles.dart';
import 'package:smart_university_app/widgets/add_grades_list_view.dart';
import 'package:smart_university_app/widgets/course_header.dart';
import 'package:smart_university_app/widgets/custom_elevated_button.dart';
import 'package:smart_university_app/widgets/grades_dropdown.dart';

class AddGradesBody extends ConsumerWidget {
  final CourseModel course;

  const AddGradesBody({super.key, required this.course});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final studentsAsync = ref.watch(courseStudentsProvider(course.id));
    final isLoading = ref.watch(isSubmittingProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CourseHeader(title: "Add Grades"),

        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [GradesDropdown()],
          ),
        ),
        const SizedBox(height: 16),
        AddGradesListView(studentsAsync: studentsAsync),
        Padding(
          padding: const EdgeInsets.all(16),
          child: CustomElevatedButton(
            onPressed: isLoading
                ? null
                : () async {
                    try {
                      await submitGrades(ref: ref, courseId: course.id);
                      if (context.mounted) {
                        Navigator.pop(context);
                      }
                    } catch (e) {
                      ScaffoldMessenger.of(
                        context,
                      ).showSnackBar(SnackBar(content: Text("Error: $e")));
                    }
                  },
            text: isLoading ? "Loading..." : "Submit Grades",
          ),
        ),
      ],
    );
  }
}
