import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_university_app/models/events_model.dart';
import 'package:smart_university_app/utils/services/event_services.dart';

final eventServiceProvider = Provider((ref) {
  return EventService();
});

final eventsProvider = FutureProvider<List<EventModel>>((ref) async {
  final service = ref.read(eventServiceProvider);
  return service.getEvents();
});
