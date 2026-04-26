import 'dart:math';

final List<String> eventImages = [
  'assets/images/event1.jpg',
  'assets/images/event2.jpg',
  'assets/images/event3.jpg',
];

String getRandomImage() {
  final random = Random();
  return eventImages[random.nextInt(eventImages.length)];
}
