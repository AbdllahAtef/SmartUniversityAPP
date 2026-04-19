import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_university_app/widgets/dash_board.dart';
import 'package:smart_university_app/widgets/profile_header.dart';
import 'package:smart_university_app/widgets/profile_statistics_card.dart';
import 'package:smart_university_app/widgets/profile_stats_card.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          const ProfileHeader(
            name: "Abdllah",
            studentId: "st34_hj45_2333_30li",
            avatarPath:
                'https://images.pexels.com/photos/31438472/pexels-photo-31438472.jpeg',
          ),
          SizedBox(height: 24.h),
          const ProfileStatsCard(credits: 120, gpa: 3.8, year: 3),
          SizedBox(height: 24.h),
          ProfileStatisticsCard(
            date: "Today",
            attendance: 10,
            taskAndWork: 5,
            quiz: 3,
            onMarkAttend: () {},
          ),
          SizedBox(height: 24.h),
          const DashBoard(),
        ],
      ),
    );
  }
}
