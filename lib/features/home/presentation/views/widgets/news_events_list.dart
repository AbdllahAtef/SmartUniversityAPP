import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_university_app/features/home/view_model/home_shell_view_model.dart';
import 'package:smart_university_app/features/schedule/presentation/views/widgets/event_list_view.dart';
import 'package:smart_university_app/features/home/presentation/views/widgets/news_list_view.dart';

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
