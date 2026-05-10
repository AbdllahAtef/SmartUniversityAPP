import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_university_app/features/quiz/presentation/manager/quiz_provider.dart';
import 'package:smart_university_app/features/quiz/presentation/manager/timer_provider.dart';

class SubmitQuizHelper {
  static Future<void> submit({
    required WidgetRef ref,
    required int quizId,
  }) async {
    ref.read(quizTimerProvider.notifier).stop();
    await ref.read(quizProvider.notifier).submitQuiz(quizId);
  }
}
