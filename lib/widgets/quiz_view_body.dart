import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_university_app/providers/courses_provider.dart';
import 'package:smart_university_app/providers/timer_provider.dart';
import 'package:smart_university_app/widgets/answers_list_view.dart';
import 'package:smart_university_app/widgets/bottom_quiz_buttons.dart';
import 'package:smart_university_app/widgets/course_header.dart';
import 'package:smart_university_app/widgets/question_card.dart';
import 'package:smart_university_app/widgets/quiz_progress.dart';
import 'package:smart_university_app/widgets/quiz_result_view.dart';

class QuizViewBody extends ConsumerStatefulWidget {
  final int quizId;

  const QuizViewBody({super.key, required this.quizId});

  @override
  ConsumerState<QuizViewBody> createState() => _QuizViewBodyState();
}

class _QuizViewBodyState extends ConsumerState<QuizViewBody> {
  late final ProviderSubscription<int> _timerSub;

  @override
  void initState() {
    super.initState();

    _timerSub = ref.listenManual<int>(quizTimerProvider, (
      previous,
      next,
    ) async {
      final quizState = ref.read(quizProvider);
      if (next == 0 && previous != 0 && !quizState.isSubmitting) {
        final questions = await ref.read(
          questionsProvider(widget.quizId).future,
        );

        ref.read(quizTimerProvider.notifier).stop();

        await ref
            .read(quizProvider.notifier)
            .submitQuiz(widget.quizId, questions);

        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Time is up! Submitting...")),
          );
        }
      }
    });
  }

  @override
  void dispose() {
    _timerSub.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final quizState = ref.watch(quizProvider);
    final questionsAsync = ref.watch(questionsProvider(widget.quizId));

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          const SizedBox(height: 10),
          const CourseHeader(title: "Quiz", isquiz: true),
          const SizedBox(height: 20),

          Expanded(
            child: questionsAsync.when(
              data: (questions) {
                if (quizState.isSubmitting) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (quizState.error != null) {
                  return Center(child: Text("Error: ${quizState.error}"));
                }

                if (questions.isEmpty) {
                  return const Center(child: Text("No questions available"));
                }
                if (quizState.currentIndex == -1) {
                  final resultAsync = ref.watch(
                    quizResultProvider(widget.quizId),
                  );

                  return resultAsync.when(
                    data: (result) {
                      final total = result.questions.fold(
                        0,
                        (sum, q) => sum + q.grade,
                      );
                      return QuizResultView(
                        score: result.totalScore,
                        total: total,
                      );
                    },
                    loading: () =>
                        const Center(child: CircularProgressIndicator()),
                    error: (e, _) => Center(child: Text("Error: $e")),
                  );
                }

                final question = questions[quizState.currentIndex];
                final isLast = quizState.currentIndex == questions.length - 1;

                return Column(
                  children: [
                    QuizProgress(
                      current: quizState.currentIndex + 1,
                      total: questions.length,
                    ),
                    const SizedBox(height: 20),
                    QuestionCard(text: question.text),
                    Expanded(child: AnswersListView(question: question)),
                    BottomQuizButtons(
                      isLast: isLast,
                      onNext: () async {
                        final quizState = ref.read(quizProvider);

                        if (isLast) {
                          if (quizState.isSubmitting) return;

                          ref.read(quizTimerProvider.notifier).stop();

                          await ref
                              .read(quizProvider.notifier)
                              .submitQuiz(widget.quizId, questions);
                        } else {
                          ref
                              .read(quizProvider.notifier)
                              .next(questions.length);
                        }
                      },

                      onPrev: () {
                        ref.read(quizProvider.notifier).previous();
                      },
                    ),
                  ],
                );
              },

              loading: () => const Center(child: CircularProgressIndicator()),

              error: (e, _) => const Center(child: Text("Error loading quiz")),
            ),
          ),
        ],
      ),
    );
  }
}
