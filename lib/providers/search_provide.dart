import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:smart_university_app/utils/mock_data.dart';

final searchProvider = StateProvider<String>((ref) {
  return '';
});
final filteredSubjectsProvider = Provider((ref) {
  final search = ref.watch(searchProvider).toLowerCase();

  final subjects = courses; 

  if (search.isEmpty) {
    return subjects;
  }

  return subjects.where((subject) {
    return subject.toLowerCase().contains(search);
  }).toList();
});
