import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:smart_university_app/models/lecture_model.dart';
import 'package:smart_university_app/utils/date_utils.dart';
import 'package:smart_university_app/utils/mock_data.dart';

final selectedDateProvider = StateProvider<DateTime>((ref) => DateTime.now());
final datesProvider = Provider<List<DateTime>>((ref) {
  return generateDates();
});

final filteredLecturesProvider = Provider<List<LectureModel>>((ref) {
  final selectedDate = ref.watch(selectedDateProvider);

  return getLecturesForDate(lecturesMock, selectedDate);
});
