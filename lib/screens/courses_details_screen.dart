import 'package:flutter/material.dart';
import 'package:smart_university_app/widgets/courses_details_body.dart';

class CoursesDetailsScreen extends StatelessWidget {
  const CoursesDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CoursesDetailsBody(),
    );
  }
}