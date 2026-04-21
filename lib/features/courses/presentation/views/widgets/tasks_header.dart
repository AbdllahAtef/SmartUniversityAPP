import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_university_app/core/styles/styles.dart';

class TasksHeader extends StatelessWidget {
  final int count;
  const TasksHeader({super.key, required this.count});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Current Tasks",
          style: TextStyles.textstyle16.copyWith(
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
          decoration: BoxDecoration(
            color: const Color(0xFF8B2072).withOpacity(0.1),
            borderRadius: BorderRadius.circular(20.r),
          ),
          child: Text(
            "$count IN PROGRESS",
            style: TextStyles.textstyle12.copyWith(
              color: const Color(0xFF8B2072),
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}
