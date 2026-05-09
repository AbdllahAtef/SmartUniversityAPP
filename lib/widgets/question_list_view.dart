import 'package:flutter/material.dart';
import 'package:smart_university_app/models/question_form.dart';
import 'package:smart_university_app/widgets/question_item_widget.dart';

class QuestionListView extends StatelessWidget {
  const QuestionListView({
    super.key,
    required this.questions,
  });

  final List<QuestionForm> questions;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: questions.length,
      itemBuilder: (context, index) {
        return QuestionItemWidget(
          index: index,
          q: questions[index],
        );
      },
    );
  }
}
