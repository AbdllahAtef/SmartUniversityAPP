import 'package:smart_university_app/utils/random.dart';

class NewsModel {
  final String title;
  final String content;
  final String date;

  NewsModel({required this.title, required this.content, required this.date});

  factory NewsModel.fromJson(Map<String, dynamic> json) {
    return NewsModel(
      title: json['title'],
      content: json['content'],
      date: getRandomDate(), 
    );
  }
}
