import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:smart_university_app/models/courses_model.dart';
import 'package:smart_university_app/utils/mock_data.dart';

final searchProvider = StateProvider<String>((ref) {
  return '';
});
final filteredSubjectsProvider = Provider<List<CourseModel>>((ref) {
  final search = ref.watch(searchProvider).toLowerCase();
  final subjects = courses;

  if (search.isEmpty) {
    return subjects;
  }

  return subjects.where((course) {
    return course.name.toLowerCase().contains(search);
  }).toList();
});
