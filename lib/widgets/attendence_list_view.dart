import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_university_app/models/courses_model.dart';
import 'package:smart_university_app/models/lecture_model.dart';
import 'package:smart_university_app/providers/schedule_provider.dart';
import 'package:smart_university_app/widgets/universal_card.dart';

class AttendenceListView extends ConsumerWidget {
  const AttendenceListView({
    super.key,
    required this.lectures,
    required this.course,
  });
  final List<LectureModel> lectures;
  final CourseModel course;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sortedLectures = sortLectures(lectures);
    return ListView.builder(
      padding: EdgeInsets.zero,
      itemCount: sortedLectures.length,
      itemBuilder: (context, index) {
        final lec = sortedLectures[index];
        return UniversalCard(
          title: "Lecture ${index + 1}",
          description: lec.title,
          date: "${lec.subtitle} ",
          icon: Icons.menu_book,
          color: const Color(0XFF8B2072),
          isAttendance: true,
          course: course,
        );
      },
    );
  }
}
