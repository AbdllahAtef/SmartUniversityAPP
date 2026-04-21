import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_university_app/features/profile/presentation/views/widgets/stat_item.dart';

class ProfileStatsCard extends StatelessWidget {
  final double credits;
  final double gpa;
  final double year;

  const ProfileStatsCard({
    super.key,
    required this.credits,
    required this.gpa,
    required this.year,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 16.h),
      decoration: BoxDecoration(
        color: const Color(0xFFF4F3FF),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          StatItem(value: credits, label: 'Credit earns'),
          StatItem(value: gpa, label: 'GPA'),
          StatItem(value: year, label: 'Year student'),
        ],
      ),
    );
  }
}
