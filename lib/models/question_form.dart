import 'package:flutter/material.dart';

class QuestionForm {
  TextEditingController questionController = TextEditingController();
  TextEditingController gradeController = TextEditingController();

  List<TextEditingController> options = [
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
  ];

  int correctIndex = 0;

  void dispose() {
    questionController.dispose();
    gradeController.dispose();
    for (var o in options) {
      o.dispose();
    }
  }
}
