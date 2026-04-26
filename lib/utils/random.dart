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

String getRandomDate() {
  final random = Random();

  const months = [
    'Jan',
    'Feb',
    'Mar',
    'Apr',
    'May',
    'Jun',
    'Jul',
    'Aug',
    'Sep',
    'Oct',
    'Nov',
    'Dec',
  ];

  final month = months[random.nextInt(months.length)];
  final day = random.nextInt(28) + 1;

  return '$month $day';
}
