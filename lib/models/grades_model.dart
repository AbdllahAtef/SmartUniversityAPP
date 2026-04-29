import 'package:smart_university_app/models/courses_model.dart';

class GradesModel {
  final int id;
  final int studentId;
  final int courseId;
  final int midtermGrade;
  final int finalGrade;
  final bool isPublished;

  GradesModel({
    required this.id,
    required this.studentId,
    required this.courseId,
    required this.midtermGrade,
    required this.finalGrade,
    required this.isPublished,
  });

  factory GradesModel.fromJson(Map<String, dynamic> json) {
    return GradesModel(
      id: json['id'],
      studentId: json['studentId'],
      courseId: json['courseId'],
      midtermGrade: json['midtermGrade'],
      finalGrade: json['finalGrade'],
      isPublished: json['isPublished'],
    );
  }
}
class GradeWithCourse {
  final GradesModel grade;
  final CourseModel course;

  GradeWithCourse({required this.grade, required this.course});
}
