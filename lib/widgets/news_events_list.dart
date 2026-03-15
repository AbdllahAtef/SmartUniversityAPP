import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_university_app/providers/home_view_provider.dart';
import 'package:smart_university_app/widgets/event_list_view.dart';
import 'package:smart_university_app/widgets/news_list_view.dart';

class NewsEventsList extends ConsumerWidget {
  const NewsEventsList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedTab = ref.watch(tabProvider);

    if (selectedTab == 0) {
      return const NewsListView();
    } else {
      return const EventListView();
    }
  }
}
