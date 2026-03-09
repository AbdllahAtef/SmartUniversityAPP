import 'package:flutter/material.dart';
import 'package:smart_university_app/widgets/custom_app_bar.dart';
import 'package:smart_university_app/widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(title: 'Home'),
      body: SafeArea(child: HomeViewBody()),
    );
  }
}
