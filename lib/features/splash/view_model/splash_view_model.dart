import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_university_app/features/splash/model/splash_state.dart';

class SplashViewModel extends Notifier<SplashState> {
  @override
  SplashState build() {
    return SplashState.initial;
  }

  void startNavigationTimer() {
    Future<void>.delayed(const Duration(seconds: 3), () {
      state = SplashState.navigateToOnboarding;
    });
  }
}

final splashViewModelProvider =
    NotifierProvider<SplashViewModel, SplashState>(SplashViewModel.new);
