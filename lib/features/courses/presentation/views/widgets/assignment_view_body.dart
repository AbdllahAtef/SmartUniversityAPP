import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_university_app/features/courses/view_model/courses_view_model.dart';
import 'package:smart_university_app/core/styles/styles.dart';
import 'package:smart_university_app/features/courses/presentation/views/widgets/course_header.dart';
import 'package:smart_university_app/core/widgets/custom_elevated_button.dart';
import 'package:smart_university_app/features/courses/presentation/views/widgets/deadline_card.dart';
import 'package:smart_university_app/features/courses/presentation/views/widgets/submission_instructions_card.dart';
import 'package:smart_university_app/features/courses/presentation/views/widgets/task_card.dart';
import 'package:smart_university_app/features/courses/presentation/views/widgets/upload_card.dart';

class AssignmentViewBody extends ConsumerWidget {
  const AssignmentViewBody({super.key, required this.assignmentId});

  final int assignmentId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final assignment = ref.watch(assignmentByIdProvider(assignmentId));
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
            onPressed: file == null
                ? null
                : () async {
                    final messenger = ScaffoldMessenger.of(context);
                    await Future.delayed(const Duration(seconds: 1));
                    if (!context.mounted) return;
                    ref.read(fileProvider.notifier).state = null;

                    messenger.showSnackBar(
                      const SnackBar(content: Text("Submitted successfully ✅")),
                    );
                  },
            text: "Submit Assignment",
          ),
        ),
      ],
    );
  }
}
