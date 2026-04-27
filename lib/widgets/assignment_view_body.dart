import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_university_app/models/assignments_model.dart';
import 'package:smart_university_app/providers/courses_provider.dart';
import 'package:smart_university_app/utils/styles.dart';
import 'package:smart_university_app/widgets/course_header.dart';
import 'package:smart_university_app/widgets/custom_elevated_button.dart';
import 'package:smart_university_app/widgets/deadline_card.dart';
import 'package:smart_university_app/widgets/submission_instructions_card.dart';
import 'package:smart_university_app/widgets/task_card.dart';
import 'package:smart_university_app/widgets/upload_card.dart';

class AssignmentViewBody extends ConsumerWidget {
  const AssignmentViewBody({super.key, required this.assignment});

  final AssignmentModel assignment;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final file = ref.watch(fileProvider);

    return Column(
      children: [
        const CourseHeader(title: 'Assignment Submission'),

        Expanded(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TaskCard(assignment: assignment),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: DeadlineCard(deadline: assignment.dueDate),
                ),
                const SizedBox(height: 20),
                const SubmissionInstructionsCard(),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 22),
                  child: Text(
                    "File upload",
                    style: TextStyles.textstyle16.copyWith(
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                const UploadCard(),
              ],
            ),
          ),
        ),

        Padding(
          padding: EdgeInsets.symmetric(vertical: 40.h),
          child: CustomElevatedButton(
            text: "Submit Assignment",
            onPressed: file == null
                ? null
                : () async {
                    try {
                      await ref
                          .read(assignmentServiceProvider)
                          .submitAssignment(
                            assignmentId: assignment.id,
                            file: file,
                          );

                      ref.read(fileProvider.notifier).state = null;

                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Submitted successfully ✅"),
                        ),
                      );

                      Navigator.pop(context);
                    } catch (e) {
                      String message = "Something went wrong";

                      if (e is DioException) {
                        final data = e.response?.data;

                        if (data is Map<String, dynamic>) {
                          message =
                              data['error'] ??
                              data['message'] ??
                              "Error occurred";
                        } else if (data is String) {
                          message = data;
                        }
                      } else {
                        message = e.toString();
                      }
                      ScaffoldMessenger.of(
                        context,
                      ).showSnackBar(SnackBar(content: Text(message)));
                      ref.read(fileProvider.notifier).state = null;
                    }
                  },
          ),
        ),
      ],
    );
  }
}
