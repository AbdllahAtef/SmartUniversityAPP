import 'package:flutter/material.dart';
import 'package:smart_university_app/core/utils/mock_data.dart';
import 'package:smart_university_app/features/home/presentation/views/widgets/news_card.dart';

class NewsListView extends StatelessWidget {
  const NewsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return newsList.isEmpty
        ? const Center(child: Text("No news available"))
        : ListView.builder(
            itemCount: newsList.length,
            itemBuilder: (context, index) {
              return NewsCard(news: newsList[index]);
            },
          );
  }
}
