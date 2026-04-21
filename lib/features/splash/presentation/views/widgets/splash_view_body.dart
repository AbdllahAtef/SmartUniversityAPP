import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_university_app/core/utils/app_assets.dart';
import 'package:smart_university_app/features/onboarding/presentation/views/onboarding_screen.dart';
import 'package:smart_university_app/core/widgets/sliding_text.dart';
import 'package:smart_university_app/features/splash/model/splash_state.dart';
import 'package:smart_university_app/features/splash/view_model/splash_view_model.dart';

class SplashViewBody extends ConsumerStatefulWidget {
  const SplashViewBody({super.key});

  @override
  ConsumerState<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends ConsumerState<SplashViewBody>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> slidingAnimation;

  @override
  void initState() {
    super.initState();
    initSlidingAnimation();
    ref.read(splashViewModelProvider.notifier).startNavigationTimer();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen<SplashState>(splashViewModelProvider, (previous, next) {
      if (next == SplashState.navigateToOnboarding) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const OnBoardingScreen()),
        );
      }
    });

    return Container(
      color: const Color(0xFF8B2072),
      width: double.infinity,
      height: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 200.h),
              Image.asset(
                AppAssets.logo,
                height: 107.h,
                width: 107.w,
              ),
              const SizedBox(height: 4),
              Text(
                "Smart University",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w800,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 4),
              SlidingText(slidingAnimation: slidingAnimation),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 20.h),
            child: Text(
              'Copyright © 2026 Smart University\nAll Right Reserved',
              style: TextStyle(
                color: Colors.white,
                fontSize: 13.sp,
                fontWeight: FontWeight.w300,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }

  void initSlidingAnimation() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );
    slidingAnimation = Tween<Offset>(
      begin: const Offset(0, 15),
      end: Offset.zero,
    ).animate(animationController);
    animationController.forward();
  }
}
