import 'package:flutter/material.dart';
import 'package:smart_university_app/models/quizes_model.dart';
import 'package:smart_university_app/widgets/quiz_view_body.dart';

class QuizScreen extends StatelessWidget {
  final QuizModel quiz;

  const QuizScreen({super.key, required this.quiz});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: QuizViewBody(quiz: quiz));
  }
}
