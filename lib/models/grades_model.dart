class GradesModel {
  final String name;
  final String type;
  final String season;
  final String? letterGrade;
  final double? score;
  final double? total;

  GradesModel({
    required this.name,
    required this.type,
    required this.season,
    this.letterGrade,
    this.score,
    this.total,
  });
}
