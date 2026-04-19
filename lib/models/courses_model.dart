class CourseModel {
  final int id;
  final String name;
  final String code;
  final String description;
  final String doctorId;
  final String facultyId;

  const CourseModel({
    required this.id,
    required this.name,
    required this.code,
    required this.description,
    required this.doctorId,
    required this.facultyId,
  });
}
