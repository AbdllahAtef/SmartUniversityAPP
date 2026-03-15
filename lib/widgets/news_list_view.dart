import 'package:flutter/material.dart';
import 'package:smart_university_app/utils/mock_data.dart';
import 'package:smart_university_app/widgets/news_card.dart';

class NewsListView extends StatelessWidget {
  const NewsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      
      itemCount: newsList.length,
      itemBuilder: (context, index) {
        return NewsCard(news: newsList[index]);
      },
    );
  }
}
