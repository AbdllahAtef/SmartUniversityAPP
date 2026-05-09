import 'package:dio/dio.dart';
import 'package:smart_university_app/models/news_model.dart';
import 'package:smart_university_app/utils/dio_helper.dart';

class NewsService {
  Future<List<NewsModel>> getNews() async {
    try {
      final response = await DioHelper.dio.get('/api/news');

      final rawData = response.data;

      if (rawData == null) {
        return [];
      }

      final data = rawData is List ? rawData : rawData['data'];

      if (data == null || data is! List || data.isEmpty) {
        return [];
      }

      return data.map<NewsModel>((e) => NewsModel.fromJson(e)).toList();
    } catch (e) {
      if (e is DioException && e.response?.statusCode == 404) {
        return [];
      }
      rethrow;
    }
  }
}
