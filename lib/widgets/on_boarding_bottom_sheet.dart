import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_university_app/models/on_boarding_model.dart';
import 'package:smart_university_app/providers/on_boarding_provider.dart';
import 'package:smart_university_app/screens/sign_in_screen.dart';
import 'package:smart_university_app/utils/styles.dart';
import 'package:smart_university_app/widgets/custom_elevated_button.dart';

class OnBoardingBottomSheet extends ConsumerWidget {
  const OnBoardingBottomSheet({
    super.key,
    required this.controller,
    required this.list,
  });

  final PageController controller;
  final List<OnBoardingModel> list;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentPage = ref.watch(onBoardingProvider);
    final bool isLast = currentPage == list.length - 1;

    return Container(
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 20.h),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomElevatedButton(
              onPressed: () {
                if (isLast) {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (_) => const SignInScreen()),
                  );
                } else {
                  controller.nextPage(
                    duration: const Duration(milliseconds: 200),
                    curve: Curves.linear,
                  );
                }
              },
              text: isLast ? 'Start' : 'Next',
            ),
            SizedBox(height: 8.h),
            TextButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (_) => const SignInScreen()),
                );
              },
              child: Text(
                'Skip',
                style: TextStyles.textstyle20.copyWith(
                  color: const Color(0xFF8B2072),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
