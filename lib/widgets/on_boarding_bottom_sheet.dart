import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_university_app/models/on_boarding_model.dart';
import 'package:smart_university_app/utils/styles.dart';
import 'package:smart_university_app/widgets/custom_elevated_button.dart';

class OnBoardingBottomSheet extends StatelessWidget {
  const OnBoardingBottomSheet({
    super.key,
    required this.controller,
    required this.list,
  });

  final PageController controller;
  final List<OnBoardingModel> list;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 20.h),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomElevatedButton(
              onPressed: () => controller.nextPage(
                duration: const Duration(milliseconds: 200),
                curve: Curves.linear,
              ),
              text: list.length - 1 == controller.page?.round()
                  ? 'Start'
                  : 'Next',
            ),
            SizedBox(height: 8.h),
            TextButton(
              onPressed: () => controller.jumpToPage(list.length - 1),
              child: Text(
                'Skip',
                style: TextStyles.textstyle20.copyWith(color: const Color(0xFF8B2072)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
