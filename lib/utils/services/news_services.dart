import 'package:smart_university_app/models/news_model.dart';
import 'package:smart_university_app/utils/dio_helper.dart';

class NewsService {
  Future<List<NewsModel>> getNews() async {
    final response = await DioHelper.dio.get('/api/news');

    List data = response.data;

    return data.map((e) => NewsModel.fromJson(e)).toList();
  }
}
