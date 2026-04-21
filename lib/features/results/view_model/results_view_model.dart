import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:smart_university_app/features/results/model/grades_model.dart';
import 'package:smart_university_app/core/utils/mock_data.dart';

final gradesTypesProvider = Provider<List<String>>((ref) {
  return ["Final Grades", "Midterm", "Assignments", "Quizzes"];
});

final selectedTypeProvider = StateProvider<String>((ref) {
  return ref.read(gradesTypesProvider).first;
});

final seasonsProvider = Provider<List<String>>((ref) {
  final seasons = mockGrades.map((e) => e.season).toSet().toList()..sort();
  return seasons;
});

final selectedSeasonProvider = StateProvider<String>((ref) {
  return ref.read(seasonsProvider).first;
});

final gradesProvider = Provider<List<GradesModel>>((ref) {
  final selectedType = ref.watch(selectedTypeProvider);
  final selectedSeason = ref.watch(selectedSeasonProvider);

  return mockGrades.where((grade) {
    return grade.type == selectedType && grade.season == selectedSeason;
  }).toList();
});
