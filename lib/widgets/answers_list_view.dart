import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_university_app/models/question_model.dart';
import 'package:smart_university_app/providers/quiz_provider.dart';
import 'package:smart_university_app/widgets/answer_item.dart';

class AnswersListView extends ConsumerWidget {
  const AnswersListView({super.key, required this.question});

  final QuestionModel question;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final quizState = ref.watch(quizProvider);

    return ListView.builder(
      itemCount: question.options.length,
      itemBuilder: (context, index) {
        final option = question.options[index];

        final isSelected = quizState.answers[question.id] == option.id;

        return GestureDetector(
          onTap: () {
            ref
                .read(quizProvider.notifier)
                .selectAnswer(question.id, option.id);
          },
          child: AnswerItem(
            label: String.fromCharCode(65 + index),
            text: option.text,
            isSelected: isSelected,
          ),
        );
      },
    );
  }
}
