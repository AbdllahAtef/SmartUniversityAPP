import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_university_app/models/assignments_model.dart';
import 'package:smart_university_app/models/quizes_model.dart';
import 'package:smart_university_app/providers/quiz_provider.dart';
import 'package:smart_university_app/screens/assigment_submission_screen.dart';
import 'package:smart_university_app/screens/quiz_result_screen.dart';
import 'package:smart_university_app/screens/quiz_screen.dart';
import 'package:smart_university_app/utils/helper_services.dart';

class CardAction extends ConsumerWidget {
  final Color color;
  final AssignmentModel? assignment;
  final QuizModel? quiz;

  const CardAction({
    super.key,
    required this.color,
    this.assignment,
    this.quiz,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () => handleNavigation(context, ref),
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(24),
        ),
        child: Icon(
          assignment != null ? Icons.upload_file_outlined : Icons.start_sharp,
          color: Colors.white,
        ),
      ),
    );
  }

  Future<void> handleNavigation(BuildContext context, WidgetRef ref) async {
    if (assignment != null) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => AssigmentSubmissionScreen(assignment: assignment!),
        ),
      );
      return;
    }

    if (quiz != null) {
      try {
        final status = await ref.read(quizStatusProvider(quiz!.id).future);

        if (status == null) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("No data available for this quiz")),
          );
          return;
        }

        if (status.isSubmitted) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => QuizResultScreen(quiz: quiz!)),
          );
          return;
        }

        ref.read(quizProvider.notifier).reset();

        if (!status.hasStarted) {
          await ref.read(quizServiceProvider).startQuiz(quiz!.id);
        }

        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => QuizScreen(quiz: quiz!)),
        );
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              e is DioException ? getErrorMessage(e) : e.toString(),
            ),
          ),
        );
      }
    }
  }
}
