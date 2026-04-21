import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_university_app/core/styles/styles.dart';

class SessionCard extends StatelessWidget {
  const SessionCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: Colors.grey.shade300),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Digital Thinking",
              style: TextStyles.textstyle14.copyWith(
                color: Colors.black,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 8.h),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.schedule, size: 16.sp, color: Colors.grey),
                SizedBox(width: 4.w),
                Text(
                  "09:00 - 11:00",
                  style: TextStyles.textstyle8.copyWith(color: Colors.grey),
                ),
                SizedBox(width: 16.w),
                Icon(
                  Icons.location_on_outlined,
                  size: 16.sp,
                  color: Colors.grey,
                ),
                SizedBox(width: 4.w),
                Text(
                  "Main auditorium",
                  style: TextStyles.textstyle8.copyWith(color: Colors.grey),
                ),
              ],
            ),
            SizedBox(height: 8.h),
            Text(
              "Mam Mahnoor",
              style: TextStyles.textstyle8.copyWith(
                color: Colors.grey,
                fontSize: 10.sp,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
