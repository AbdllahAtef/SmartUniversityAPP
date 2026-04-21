import 'package:flutter/material.dart';
import 'package:smart_university_app/core/styles/styles.dart';
import 'package:smart_university_app/features/profile/presentation/views/widgets/attendence_button.dart';
import 'package:smart_university_app/features/profile/presentation/views/widgets/stat_tile.dart';

class ProfileStatisticsCard extends StatelessWidget {
  final String date;
  final int attendance;
  final int taskAndWork;
  final int quiz;
  final VoidCallback onMarkAttend;

  const ProfileStatisticsCard({
    super.key,
    required this.date,
    required this.attendance,
    required this.taskAndWork,
    required this.quiz,
    required this.onMarkAttend,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFF4F3FF),
        border: BoxBorder.all(color: const Color(0xFF8B2072), width: 1),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Statistics',
                    style: TextStyles.textstyle18.copyWith(
                      color: Colors.black87,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    date,
                    style: TextStyles.textstyle12.copyWith(color: Colors.grey),
                  ),
                ],
              ),
              AttendenceButton(onMarkAttend: onMarkAttend),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: StatTile(
                  icon: Icons.calendar_month,
                  iconColor: const Color(0xFFFF6B35),
                  label: 'Attendance',
                  value: '$attendance%',
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: StatTile(
                  icon: Icons.task_alt,
                  iconColor: const Color(0xFF8B5CF6),
                  label: 'Task & Work',
                  value: '$taskAndWork%',
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: StatTile(
                  icon: Icons.quiz_outlined,
                  iconColor: const Color(0xFFEC4899),
                  label: 'Quiz',
                  value: '$quiz%',
                ),
              ),
              const Expanded(child: SizedBox()),
            ],
          ),
        ],
      ),
    );
  }
}
