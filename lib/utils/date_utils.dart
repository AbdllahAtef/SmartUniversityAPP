import 'package:smart_university_app/models/lecture_model.dart';

List<DateTime> generateDates() {
  final today = DateTime.now();

  return List.generate(
    31,
    (index) =>
        today.subtract(const Duration(days: 3)).add(Duration(days: index)),
  );
}

bool isSameDay(DateTime a, DateTime b) {
  return a.year == b.year && a.month == b.month && a.day == b.day;
}

String getDayName(DateTime date) {
  const days = ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"];
  return days[date.weekday - 1];
}

String formatMonthYear(DateTime date) {
  const months = [
    "Jan",
    "Feb",
    "Mar",
    "Apr",
    "May",
    "Jun",
    "Jul",
    "Aug",
    "Sep",
    "Oct",
    "Nov",
    "Dec",
  ];

  return "${months[date.month - 1]} ${date.year}";
}

List<LectureModel> getLecturesForDate(
  List<LectureModel> lectures,
  DateTime selectedDate,
) {
  return lectures.where((lecture) {
    return lecture.startTime.year == selectedDate.year &&
        lecture.startTime.month == selectedDate.month &&
        lecture.startTime.day == selectedDate.day;
  }).toList();
}
