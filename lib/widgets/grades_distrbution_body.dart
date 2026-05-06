import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_university_app/models/courses_model.dart';
import 'package:smart_university_app/providers/results_provider.dart';
import 'package:smart_university_app/screens/add_grades_screen.dart';
import 'package:smart_university_app/utils/helpers.dart';
import 'package:smart_university_app/utils/styles.dart';
import 'package:smart_university_app/widgets/course_header.dart';
import 'package:smart_university_app/widgets/custom_elevated_button.dart';
import 'package:smart_university_app/widgets/custom_field.dart';

class GradesDistrbutionBody extends ConsumerWidget {
  final CourseModel course;

  const GradesDistrbutionBody({super.key, required this.course});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CourseHeader(title: "Grades Distribution"),

          SizedBox(height: 16.h),

          Text(
            "Define grading structure",
            style: TextStyles.textstyle16.copyWith(
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),

          SizedBox(height: 16.h),

          CustomField(
            label: "Class Work Grades",
            controller: ref.watch(midtermControllerProvider),
            keyboardType: TextInputType.number,
            suffixIcon: Padding(
              padding: const EdgeInsets.all(16),
              child: Icon(Icons.percent, color: Colors.grey.shade700),
            ),
          ),

          SizedBox(height: 16.h),

          CustomField(
            label: "Final Exam Grades",
            controller: ref.watch(finalControllerProvider),
            keyboardType: TextInputType.number,
            suffixIcon: Padding(
              padding: const EdgeInsets.all(16),
              child: Icon(Icons.percent, color: Colors.grey.shade700),
            ),
          ),
          const Spacer(),
          CustomElevatedButton(
            text: "Save Distribution",
            onPressed: () async {
              try {
                await submitGradingScheme(ref: ref, courseId: course.id);
                if (context.mounted) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => AddGradesScreen(course: course),
                    ),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Saved Successfully")),
                  );
                }
              } catch (e) {
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text("Error: $e")));
              }
            },
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}
