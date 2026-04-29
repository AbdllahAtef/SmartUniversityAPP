import 'package:flutter/material.dart';
import 'package:smart_university_app/screens/quiz_screen.dart';
import 'package:smart_university_app/utils/styles.dart';
import 'package:smart_university_app/widgets/quiz_timer_widget.dart';

class CourseHeader extends StatelessWidget {
  const CourseHeader({super.key, required this.title, this.isquiz = false});
  final String title;
  final bool isquiz;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        margin: const EdgeInsets.all(16),

        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () => Navigator.pop(context),
              child: const Icon(Icons.arrow_back_ios),
            ),
            Text(
              title,
              style: TextStyles.textstyle20.copyWith(
                color: const Color(0xFF8B2072),
              ),
            ),
            if (isquiz) const QuizTimerWidget(),

            const Icon(Icons.more_vert),
          ],
        ),
      ),
    );
  }
}
