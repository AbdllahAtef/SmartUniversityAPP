import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_university_app/models/courses_model.dart';
import 'package:smart_university_app/models/create_question_model.dart';
import 'package:smart_university_app/models/create_quiz_model.dart';
import 'package:smart_university_app/providers/quiz_provider.dart';
import 'package:smart_university_app/widgets/course_header.dart';
import 'package:smart_university_app/widgets/custom_elevated_button.dart';
import 'package:smart_university_app/widgets/question_item_widget.dart';
import 'package:smart_university_app/widgets/quiz_info_section.dart';

class CreateQuizBody extends ConsumerStatefulWidget {
  final CourseModel course;

  const CreateQuizBody({super.key, required this.course});

  @override
  ConsumerState<CreateQuizBody> createState() => _CreateQuizBodyState();
}

class _CreateQuizBodyState extends ConsumerState<CreateQuizBody> {
  final titleController = TextEditingController();
  final gradeController = TextEditingController();
  final durationController = TextEditingController();
  final dateController = TextEditingController();

  DateTime? selectedDate;

  @override
  void dispose() {
    titleController.dispose();
    gradeController.dispose();
    durationController.dispose();
    dateController.dispose();
    super.dispose();
  }

  void _pickDate() async {
    final picked = await showDatePicker(
      context: context,
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
      initialDate: DateTime.now(),
    );

    if (picked != null) {
      setState(() {
        selectedDate = picked;
        dateController.text = "${picked.year}-${picked.month}-${picked.day}";
      });
    }
  }

  void _submitQuiz() {
    if (ref.read(createQuizProvider).isLoading) return;
    final questions = ref.read(createQuestionsProvider);
    if (titleController.text.isEmpty ||
        selectedDate == null ||
        gradeController.text.isEmpty ||
        durationController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please fill all quiz info")),
      );
      return;
    }

    final quiz = CreateQuizModel(
      courseId: widget.course.id,
      title: titleController.text,
      totalGrade: int.tryParse(gradeController.text) ?? 0,
      quizDate: selectedDate!,
      durationMinutes: int.tryParse(durationController.text) ?? 0,
    );

    final questionsData = questions.map((q) {
      return CreateQuestionModel(
        quizId: 0,
        text: q.questionController.text,
        grade: int.tryParse(q.gradeController.text) ?? 0,
        options: q.options.asMap().entries.map((opt) {
          return CreateOptionModel(
            text: opt.value.text,
            isCorrect: q.correctIndex == opt.key,
          );
        }).toList(),
      );
    }).toList();

    ref
        .read(createQuizProvider.notifier)
        .createQuiz(quiz: quiz, questions: questionsData);
  }

  @override
  Widget build(BuildContext context) {
    final questions = ref.watch(createQuestionsProvider);
    final state = ref.watch(createQuizProvider);
    ref.listen<AsyncValue<void>>(createQuizProvider, (prev, next) {
      next.whenOrNull(
        data: (_) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Quiz Created Successfully")),
          );
          Navigator.pop(context, true);
        },
        error: (error, stack) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(error.toString())));
        },
      );
    });

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        children: [
          const CourseHeader(title: "Create Quiz"),
          Expanded(
            child: ListView(
              children: [
                SizedBox(height: 20.h),
                QuizInfoSection(
                  titleController: titleController,
                  gradeController: gradeController,
                  durationController: durationController,
                  dateController: dateController,
                  onPickDate: _pickDate,
                ),
                SizedBox(height: 20.h),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: questions.length,
                  itemBuilder: (context, index) {
                    return QuestionItemWidget(
                      index: index,
                      q: questions[index],
                    );
                  },
                ),
                SizedBox(height: 10.h),
                ElevatedButton(
                  onPressed: () =>
                      ref.read(createQuestionsProvider.notifier).addQuestion(),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF8B2072),
                  ),
                  child: const Text(
                    "+ Add Question",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 10.h),
          state.isLoading
              ? const CircularProgressIndicator()
              : CustomElevatedButton(
                  onPressed: _submitQuiz,
                  text: "Create Quiz",
                ),
          SizedBox(height: 20.h),
        ],
      ),
    );
  }
}
