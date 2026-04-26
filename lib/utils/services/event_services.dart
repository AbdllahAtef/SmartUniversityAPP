import 'package:smart_university_app/models/events_model.dart';
import 'package:smart_university_app/utils/dio_helper.dart';

class EventService {
  Future<List<EventModel>> getEvents() async {
    final response = await DioHelper.dio.get('/api/events');
    List data = response.data;
    return data.map((e) => EventModel.fromJson(e)).toList();
  }
}
