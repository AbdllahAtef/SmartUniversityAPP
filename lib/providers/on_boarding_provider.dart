import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_university_app/models/on_boarding_model.dart';

final onBoardingListProvider = Provider<List<OnBoardingModel>>((ref) {
  return [
    OnBoardingModel(
      image: 'assets/images/onboarding1.jpg',
      title: 'Better way to learning\nis calling you!',
      description: 'Unlock Your Potential, Embrace Education',
    ),
    OnBoardingModel(
      image: 'assets/images/onboarding2.jpg',
      title: 'Find yourself by doing\nwhatever you do!',
      description: 'Education with Grace and Style',
    ),
    OnBoardingModel(
      image: 'assets/images/onboarding2.jpg',
      title: 'it’s not just learning,\nit’s a promise!',
      description: 'Learn Today, Lead Tomorrow',
    ),
  ];
});

class OnBoardingNotifier extends Notifier<int> {
  @override
  int build() => 0;

  void setPage(int index) {
    state = index;
  }

  bool isLastPage(List<OnBoardingModel> list) {
    return state == list.length - 1;
  }
}

final onBoardingProvider = NotifierProvider<OnBoardingNotifier, int>(
  OnBoardingNotifier.new,
);
