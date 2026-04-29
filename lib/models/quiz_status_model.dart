class QuizStatusModel {
  final bool hasStarted;
  final bool isFinished;
  final int remainingSeconds;

  QuizStatusModel({
    required this.hasStarted,
    required this.isFinished,
    required this.remainingSeconds,
  });

  factory QuizStatusModel.fromJson(Map<String, dynamic> json) {
    return QuizStatusModel(
      hasStarted: json['hasStarted'],
      isFinished: json['isFinished'],
      remainingSeconds: json['remainingSeconds'],
    );
  }
}
