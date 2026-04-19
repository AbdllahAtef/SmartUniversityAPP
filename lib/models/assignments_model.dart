class AssignmentModel {
  final int id;
  final int courseId;
  final String title;
  final String description;
  final DateTime dueDate;
  final double maxGrade;

  const AssignmentModel({
    required this.id,
    required this.courseId,
    required this.title,
    required this.description,
    required this.dueDate,
    required this.maxGrade,
  });
}
