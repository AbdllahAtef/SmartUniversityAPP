import 'package:flutter/material.dart';
import 'package:smart_university_app/models/assignments_model.dart';
import 'package:smart_university_app/screens/assigment_submission_screen.dart';

class CardAction extends StatelessWidget {
  final Color color;
  final AssignmentModel? assignment;
  final int? quizId;

  const CardAction({
    super.key,
    required this.color,
    this.assignment,
    this.quizId,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => handleNavigation(context),
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(24),
        ),
        child: Icon(
          assignment?.id != null ? Icons.upload_file_outlined : Icons.start_sharp,
          color: Colors.white,
        ),
      ),
    );
  }

  void handleNavigation(BuildContext context) {
    assignment?.id != null
        ? Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) =>
                  AssigmentSubmissionScreen(assignment: assignment!),
            ),
          )
        : null;

    // if (quizId != null) {
    //   Navigator.push(
    //     context,
    //     MaterialPageRoute(builder: (_) => QuizScreen(quizId: quizId!)),
    //   );
  }
}
