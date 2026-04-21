import 'package:flutter/material.dart';

class LectureModel {
  final DateTime startTime;
  final DateTime endTime;
  final String title;
  final String subtitle;
  final String room;
  final String instructor;
  final Color color;

  LectureModel({
    required this.startTime,
    required this.endTime,
    required this.title,
    required this.subtitle,
    required this.room,
    required this.instructor,
    required this.color,
  });
}
