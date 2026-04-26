import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_university_app/models/news_model.dart';
import 'package:smart_university_app/utils/services/news_services.dart';

final newsServiceProvider = Provider((ref) {
  return NewsService();
});

final newsProvider = FutureProvider<List<NewsModel>>((ref) async {
  final service = ref.read(newsServiceProvider);
  return service.getNews();
});
