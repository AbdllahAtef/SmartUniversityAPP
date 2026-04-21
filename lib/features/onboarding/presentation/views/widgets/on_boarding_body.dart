import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_university_app/core/styles/styles.dart';
import 'package:smart_university_app/features/onboarding/model/on_boarding_model.dart';
import 'package:smart_university_app/features/onboarding/view_model/onboarding_view_model.dart';

class OnBoardingBody extends ConsumerWidget {
  const OnBoardingBody({
    super.key,
    required this.controller,
    required this.list,
  });

  final PageController controller;
  final List<OnBoardingModel> list;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Expanded(
      child: PageView.builder(
        controller: controller,
        itemCount: list.length,
        onPageChanged: (index) {
          ref.read(onboardingViewModelProvider.notifier).setPage(index);
        },
        itemBuilder: (context, index) {
          final item = list[index];
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(item.image, height: 250.h),
              SizedBox(height: 20.h),
              Text(
                item.title,
                textAlign: TextAlign.center,
                style: TextStyles.textstyle24.copyWith(color: Colors.black),
              ),
              SizedBox(height: 12.h),
              Text(
                item.description,
                textAlign: TextAlign.center,
                style: TextStyles.textstyle16.copyWith(color: Colors.black),
              ),
              SizedBox(height: 50.h),
            ],
          );
        },
      ),
    );
  }
}
