import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_university_app/models/grades_model.dart';
import 'package:smart_university_app/utils/styles.dart';

class GradesBox extends StatelessWidget {
  const GradesBox({super.key, required this.grades});
  final GradesModel grades;

  @override
  Widget build(BuildContext context) {
    final isfinal = grades.type.toLowerCase() == "final grades";
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
          isfinal
              ? Text(
                  grades.letterGrade ?? "-",
                  style: TextStyles.textstyle18.copyWith(
                    color: const Color(0XFF8B2072),
                    fontWeight: FontWeight.w600,
                  ),
                )
              : Text(
                  "${grades.score?.toInt()}/${grades.total?.toInt()}",
                  style: TextStyles.textstyle18.copyWith(
                    color: const Color(0XFF8B2072),
                    fontWeight: FontWeight.w600,
                  ),
                ),
          const SizedBox(height: 4),
          Text(
            "S${grades.season}",
            style: TextStyles.textstyle12.copyWith(color: Colors.grey.shade600),
          ),
        ],
      ),
    );
  }
}
