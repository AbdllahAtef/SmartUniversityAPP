class QuizModel {
  final int id;
  final int courseId;
  final String title;
  final int totalGrade;
  final DateTime quizDate;
  final int durationMinutes;

  QuizModel({
    required this.id,
    required this.courseId,
    required this.title,
    required this.totalGrade,
    required this.quizDate,
    required this.durationMinutes,
  });

  factory QuizModel.fromJson(Map<String, dynamic> json) {
    return QuizModel(
      id: json['id'] ?? 0,
      courseId: json['courseId'] ?? 0,
      title: json['title'] ?? '',
      totalGrade: json['totalGrade'] ?? 0,
      durationMinutes: json['durationMinutes'] ?? 0,
      quizDate: json['quizDate'] != null
          ? DateTime.parse(json['quizDate'])
          : DateTime.now(),
    );
  }
}
