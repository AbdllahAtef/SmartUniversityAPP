import 'package:smart_university_app/models/lecture_model.dart';

List<DateTime> generateDates() {
  final today = DateTime.now();

  return List.generate(
    31,
    (index) =>
        today.subtract(const Duration(days: 3)).add(Duration(days: index)),
  );
}

String formatDatePretty(DateTime date) {
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

  return "${months[date.month - 1]} ${date.day.toString().padLeft(2, '0')}";
}

String formatEventDateTime(DateTime date) {
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

  int hour = date.hour;
  final minute = date.minute.toString().padLeft(2, '0');

  String period = hour >= 12 ? "PM" : "AM";
  hour = hour % 12;
  if (hour == 0) hour = 12;

  return "${date.year} ${months[date.month - 1]} ${date.day} - $hour:$minute $period";
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
String formatTime(DateTime time) {
  final hour = time.hour.toString().padLeft(2, '0');
  final minute = time.minute.toString().padLeft(2, '0');
  return "$hour:$minute";
}