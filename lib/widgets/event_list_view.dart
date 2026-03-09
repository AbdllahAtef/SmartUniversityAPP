import 'package:flutter/material.dart';
import 'package:smart_university_app/utils/mock_data.dart';
import 'package:smart_university_app/widgets/event_card.dart';

class EventListView extends StatelessWidget {
  const EventListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: eventsList.length,
      itemBuilder: (context, index) {
        return EventCard(event: eventsList[index]);
      },
    );
  }
}
