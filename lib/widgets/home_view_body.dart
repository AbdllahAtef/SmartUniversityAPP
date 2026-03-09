import 'package:flutter/material.dart';
import 'package:smart_university_app/widgets/custom_tab_item.dart';
import 'package:smart_university_app/widgets/news_events_list.dart';
import 'package:smart_university_app/widgets/subject_list_view.dart';
import 'package:smart_university_app/widgets/todays_classes.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SubjectListView(),
        const TodaysClasses(),
        const Row(
          children: [
            CustomTabItem(text: "News", index: 0),
            SizedBox(width: 20),
            CustomTabItem(text: "Events", index: 1),
          ],
        ),
        Expanded(
          child: Container(
            color: const Color(0xFFF4F3FF),
            child: const NewsEventsList(),
          ),
        ),
      ],
    );
  }
}
