import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:smart_university_app/models/grades_model.dart';
import 'package:smart_university_app/utils/mock_data.dart';

final gradesListProvider = Provider<List<String>>((ref) {
  return ["Final Grades", "Midterm", "Assignments", "Quizzes"];
});
final selectedGradeProvider = StateProvider<String>((ref) {
  final list = ref.read(gradesListProvider);
  return list.first;
});
final gradesProvider = Provider<List<GradesModel>>((ref) {
  return mockGrades;
});
