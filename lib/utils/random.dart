import 'dart:math';

import 'package:flutter/material.dart';

final List<String> eventImages = [
  'assets/images/event1.jpg',
  'assets/images/event2.jpg',
  'assets/images/event3.jpg',
];

String getRandomImage() {
  final random = Random();
  return eventImages[random.nextInt(eventImages.length)];
}

Color getNiceRandomColor() {
  final random = Random();

  return HSVColor.fromAHSV(
    1.0,
    random.nextDouble() * 360,
    0.2 + random.nextDouble() * 0.3,
    0.85 + random.nextDouble() * 0.1,
  ).toColor();
}
