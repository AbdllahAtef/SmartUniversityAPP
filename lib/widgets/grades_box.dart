import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_university_app/models/grades_model.dart';
import 'package:smart_university_app/providers/results_provider.dart';
import 'package:smart_university_app/utils/styles.dart';

class GradesBox extends ConsumerWidget {
  const GradesBox({super.key, required this.grades});
  final GradesModel grades;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedType = ref.watch(selectedTypeProvider);

    final isFinal = selectedType == "Final Grades";

    final value = isFinal ? grades.finalGrade : grades.midtermGrade;

    return Container(
      width: 60.w,
      height: 60.h,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.08),
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            value.toString(),
            style: TextStyles.textstyle18.copyWith(
              color: const Color(0XFF8B2072),
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            isFinal ? "Final" : "Midterm",
            style: TextStyles.textstyle12.copyWith(color: Colors.grey.shade600),
          ),
        ],
      ),
    );
  }
}
