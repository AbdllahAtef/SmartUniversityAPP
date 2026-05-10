class LectureModel {
  final int id;
  final int? courseId;
  final String title;
  final String subtitle;
  final String room;
  final String? instructor;
  final int day;
  final String startTime;
  final String endTime;

  LectureModel({
    required this.id,
    this.courseId,
    required this.title,
    required this.subtitle,
    required this.room,
    this.instructor,
    required this.day,
    required this.startTime,
    required this.endTime,
  });

  factory LectureModel.fromJson(Map<String, dynamic> json) {
    return LectureModel(
      id: json['id'],
      courseId: json['courseId'],
      title: json['title'],
      subtitle: json['subtitle'],
      room: json['room'],
      instructor: json['instructor'],
      day: json['day'],
      startTime: json['startTime'],
      endTime: json['endTime'],
    );
  }
}
