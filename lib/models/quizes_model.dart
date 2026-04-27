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
      id: json['id'],
      courseId: json['courseId'],
      title: json['title'],
      totalGrade: json['totalGrade'],
      quizDate: DateTime.parse(json['quizDate']),
      durationMinutes: json['durationMinutes'],
    );
  }
}
