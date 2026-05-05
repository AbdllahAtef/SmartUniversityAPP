import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_university_app/models/assignments_model.dart';
import 'package:smart_university_app/models/courses_model.dart';
import 'package:smart_university_app/models/quizes_model.dart';
import 'package:smart_university_app/widgets/card_action.dart';
import 'package:smart_university_app/widgets/card_content.dart';
import 'package:smart_university_app/widgets/card_leading.dart';

class UniversalCard extends StatelessWidget {
  final String title;
  final String description;
  final String date;
  final String? extra;
  final IconData icon;
  final Color color;
  final AssignmentModel? assignment;
  final QuizModel? quiz;
  final CourseModel? course;
  final bool isAttendance;

  const UniversalCard({
    super.key,
    required this.title,
    required this.description,
    required this.date,
    this.extra,
    required this.icon,
    required this.color,
    this.assignment,
    this.quiz,
    this.course,
    this.isAttendance = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.all(28),
      decoration: BoxDecoration(
        color: const Color(0xffF6F6F6),
        borderRadius: BorderRadius.circular(16),
        border: Border(
          left: BorderSide(color: color, width: 4.w),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CardLeading(icon: icon, color: color),
          const SizedBox(width: 12),
          Expanded(
            child: CardContent(
              title: title,
              description: description,
              date: date,
              extra: extra,
              color: color,
            ),
          ),
          CardAction(
            color: color,
            assignment: assignment,
            quiz: quiz,
            isAttendance: isAttendance,
            course: course,
          ),
        ],
      ),
    );
  }
}
