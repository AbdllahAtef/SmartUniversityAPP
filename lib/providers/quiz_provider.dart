import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:smart_university_app/models/create_question_model.dart';
import 'package:smart_university_app/models/create_quiz_model.dart';
import 'package:smart_university_app/models/question_form.dart';
import 'package:smart_university_app/models/question_model.dart';
import 'package:smart_university_app/models/quiz_result_model.dart';
import 'package:smart_university_app/models/quiz_status_model.dart';
import 'package:smart_university_app/models/quizes_model.dart';
import 'package:smart_university_app/providers/quiz_state.dart';
import 'package:smart_university_app/utils/services/quiz_services.dart';

final quizServiceProvider = Provider((ref) => QuizService());

final quizzesProvider = FutureProvider.family.autoDispose<List<QuizModel>, int>(
  (ref, courseId) {
    return ref.watch(quizServiceProvider).getQuizzes(courseId);
  },
);

class QuizNotifier extends StateNotifier<QuizState> {
  final Ref ref;
  QuizNotifier(this.ref) : super(QuizState());

  void next(int totalQuestions) {
    if (state.currentIndex < totalQuestions - 1) {
      state = state.copyWith(currentIndex: state.currentIndex + 1);
    }
  }

  void previous() {
    if (state.currentIndex > 0) {
      state = state.copyWith(currentIndex: state.currentIndex - 1);
    }
  }

  void reset() => state = QuizState();

  void selectAnswer(int questionId, int optionId) {
    state = state.copyWith(answers: {...state.answers, questionId: optionId});
  }

  Future<void> submitQuiz(int quizId, List<QuestionModel> questions) async {
    if (state.isSubmitting) return;
    state = state.copyWith(isSubmitting: true, error: null);

    try {
      final score = _calculateScore(questions);
      await ref.read(quizServiceProvider).submitQuiz(quizId, state.answers);

      state = state.copyWith(
        currentIndex: -1,
        score: score,
        isSubmitting: false,
      );
    } catch (e) {
      state = state.copyWith(isSubmitting: false, error: e.toString());
    }
  }

  int _calculateScore(List<QuestionModel> questions) {
    return questions.where((q) {
      final selected = state.answers[q.id];
      final correctOption = q.options.firstWhere(
        (o) => o.isCorrect == true,
        orElse: () {
          return OptionModel(id: -1, text: '', isCorrect: false);
        },
      );
      return selected == correctOption.id;
    }).length;
  }
}
final quizInitProvider = FutureProvider.family<List<QuestionModel>, int>((
  ref,
  quizId,
) async {
  final service = ref.read(quizServiceProvider);

  await service.startQuiz(quizId); 

  return service.getQuestions(quizId); 
});

final questionsWithAnswersProvider =
    FutureProvider.family<List<QuestionModel>, int>((ref, quizId) {
      return ref.read(quizServiceProvider).getQuestionsWithAnswers(quizId);
    });

final quizProvider = StateNotifierProvider<QuizNotifier, QuizState>((ref) {
  return QuizNotifier(ref);
});

final questionsProvider = FutureProvider.family
    .autoDispose<List<QuestionModel>, int>((ref, quizId) {
      return ref.watch(quizServiceProvider).getQuestions(quizId);
    });

final quizStatusProvider = FutureProvider.family
    .autoDispose<QuizStatusModel?, int>((ref, quizId) async {
      return ref.watch(quizServiceProvider).getQuizStatus(quizId);
    });

final quizResultProvider = FutureProvider.family
    .autoDispose<QuizResultModel?, int>((ref, quizId) {
      return ref.watch(quizServiceProvider).getQuizResult(quizId);
    });

final createQuizProvider =
    StateNotifierProvider<CreateQuizNotifier, AsyncValue<void>>((ref) {
      return CreateQuizNotifier(ref);
    });

class CreateQuizNotifier extends StateNotifier<AsyncValue<void>> {
  final Ref ref;
  CreateQuizNotifier(this.ref) : super(const AsyncData(null));

  Future<void> createQuiz({
    required CreateQuizModel quiz,
    required List<CreateQuestionModel> questions,
  }) async {
    state = const AsyncLoading();

    state = await AsyncValue.guard(() async {
      final service = ref.read(quizServiceProvider);

      final quizId = await service.createQuiz(quiz);

      for (final q in questions) {
        final request = CreateQuestionModel(
          quizId: quizId,
          text: q.text,
          grade: q.grade,
          options: q.options,
        );

        await service.createQuestion(request);
      }
      ref.invalidate(quizzesProvider(quiz.courseId));
    });
  }
}

final createQuestionsProvider =
    StateNotifierProvider.autoDispose<QuestionsNotifier, List<QuestionForm>>((
      ref,
    ) {
      return QuestionsNotifier();
    });

class QuestionsNotifier extends StateNotifier<List<QuestionForm>> {
  QuestionsNotifier() : super([QuestionForm()]);

  void addQuestion() {
    state = [...state, QuestionForm()];
  }

  void removeQuestion(int index) {
    final updated = [...state];
    updated[index].dispose();
    updated.removeAt(index);
    state = updated;
  }

  void selectCorrect(int questionIndex, int optionIndex) {
    final updated = [...state];
    updated[questionIndex].correctIndex = optionIndex;
    state = updated;
  }
}
