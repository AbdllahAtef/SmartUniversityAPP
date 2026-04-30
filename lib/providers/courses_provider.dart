import 'package:file_picker/file_picker.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:smart_university_app/models/assignments_model.dart';
import 'package:smart_university_app/models/courses_model.dart';
import 'package:smart_university_app/models/question_model.dart';
import 'package:smart_university_app/models/quiz_result_model.dart';
import 'package:smart_university_app/models/quiz_status_model.dart';
import 'package:smart_university_app/models/quizes_model.dart';
import 'package:smart_university_app/providers/quiz_state.dart';
import 'package:smart_university_app/providers/user_id_provider.dart';
import 'package:smart_university_app/utils/services/assignment_services.dart';
import 'package:smart_university_app/utils/services/courses_services.dart';
import 'package:smart_university_app/utils/services/enrollment_service.dart';
import 'package:smart_university_app/utils/services/quiz_services.dart';

// 🔹 tabs
final tabIndexProvider = StateProvider<int>((ref) => 0);
const tabs = ["Assignments", "Quizzes", "Attendance"];

// 🔹 search
final searchProvider = StateProvider<String>((ref) => '');

// 🔹 courses
final courseServiceProvider = Provider((ref) {
  return CourseService();
});

final coursesProvider = FutureProvider<List<CourseModel>>((ref) async {
  final service = ref.read(courseServiceProvider);
  return service.getCourses();
});
final enrollmentServiceProvider = Provider((ref) {
  return EnrollmentService();
});

final myCoursesProvider = FutureProvider<List<CourseModel>>((ref) async {
  final service = ref.read(enrollmentServiceProvider);

  return service.getMyCourses(ref.watch(userIdProvider) ?? 0);
});

// 🔹 filtered courses
final filteredCoursesProvider = Provider<AsyncValue<List<CourseModel>>>((ref) {
  final search = ref.watch(searchProvider).toLowerCase();
  final coursesAsync = ref.watch(coursesProvider);

  return coursesAsync.whenData((courses) {
    if (search.isEmpty) return courses;

    return courses.where((course) {
      return course.name.toLowerCase().contains(search) ||
          course.code.toLowerCase().contains(search);
    }).toList();
  });
});

// 🔹 assignments API
final assignmentServiceProvider = Provider((ref) {
  return AssignmentService();
});

final assignmentsProvider = FutureProvider.family<List<AssignmentModel>, int>((
  ref,
  courseId,
) async {
  final service = ref.read(assignmentServiceProvider);
  return service.getAssignments(courseId);
});

// 🔹 quizzes API
final quizServiceProvider = Provider((ref) {
  return QuizService();
});

final quizzesProvider = FutureProvider.family<List<QuizModel>, int>((
  ref,
  courseId,
) async {
  final service = ref.read(quizServiceProvider);
  return service.getQuizzes(courseId);
});

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

  void reset() {
    state = QuizState();
  }

  void selectAnswer(int questionId, int optionId) {
    final updated = Map<int, int>.from(state.answers);
    updated[questionId] = optionId;

    state = state.copyWith(answers: updated);
  }

  Future<void> submitQuiz(int quizId, List<QuestionModel> questions) async {
    if (state.isSubmitting) return;

    try {
      state = state.copyWith(isSubmitting: true, error: null);

      int score = 0;

      for (var q in questions) {
        final selected = state.answers[q.id];

        final correct = q.options.firstWhere(
          (o) => o.isCorrect,
          orElse: () => OptionModel(id: -1, text: '', isCorrect: false),
        );

        if (selected == correct.id) {
          score++;
        }
      }

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
}

final quizProvider = StateNotifierProvider<QuizNotifier, QuizState>((ref) {
  return QuizNotifier(ref);
});

final questionsProvider = FutureProvider.family<List<QuestionModel>, int>((
  ref,
  quizId,
) {
  return QuizService().getQuestions(quizId);
});
final quizStatusProvider = FutureProvider.family<QuizStatusModel?, int>((
  ref,
  quizId,
) async {
  final token = ref.watch(tokenProvider);

  if (token == null || token.isEmpty) {
    await Future.delayed(const Duration(milliseconds: 200));
  }

  return ref.read(quizServiceProvider).getQuizStatus(quizId);
});
final quizResultProvider = FutureProvider.family<QuizResultModel?, int>((
  ref,
  quizId,
) {
  return ref.read(quizServiceProvider).getQuizResult(quizId);
});

// 🔹 upload
final isPickingFileProvider = StateProvider<bool>((ref) => false);
final fileProvider = StateProvider<PlatformFile?>((ref) => null);
