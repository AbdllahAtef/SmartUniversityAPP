class QuizModel {
  final int id;
  final int courseId;
  final String title;
  final double totalGrade;
  final DateTime quizDate;
  final int durationMinutes;

  const QuizModel({
    required this.id,
    required this.courseId,
    required this.title,
    required this.totalGrade,
    required this.quizDate,
    required this.durationMinutes,
  });
}
