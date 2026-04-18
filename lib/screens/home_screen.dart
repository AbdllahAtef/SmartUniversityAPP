import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_university_app/providers/home_view_provider.dart';
import 'package:smart_university_app/utils/navigation.dart';
import 'package:smart_university_app/widgets/custom_app_bar.dart';
import 'package:smart_university_app/widgets/custom_bottom_navigation_bar.dart';

class HomeView extends ConsumerWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentIndex = ref.watch(bottomNavProvider);

    final currentItem = navigationItems[currentIndex];

    return Scaffold(
      appBar: currentItem.title == "Result"
          ? null
          : CustomAppBar(title: currentItem.title),
      body: SafeArea(
        child: IndexedStack(
          index: currentIndex,
          children: navigationItems.map((e) => e.page).toList(),
        ),
      ),
      bottomNavigationBar: const CustomBottomNavigationBar(),
    );
  }
}
