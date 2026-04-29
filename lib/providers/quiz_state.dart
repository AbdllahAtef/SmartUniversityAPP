class QuizState {
  final int currentIndex;
  final Map<int, int> answers;
  final int? score;
  final bool isSubmitting;
  final String? error;

  QuizState({
    this.currentIndex = 0,
    this.answers = const {},
    this.score,
    this.isSubmitting = false,
    this.error,
  });

  QuizState copyWith({
    int? currentIndex,
    Map<int, int>? answers,
    int? score,
    bool? isSubmitting,
    String? error,
  }) {
    return QuizState(
      currentIndex: currentIndex ?? this.currentIndex,
      answers: answers ?? this.answers,
      score: score ?? this.score,
      isSubmitting: isSubmitting ?? this.isSubmitting,
      error: error,
    );
  }
}
