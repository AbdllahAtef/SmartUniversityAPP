import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_university_app/providers/timer_provider.dart';
import 'package:smart_university_app/utils/date_utils.dart';
import 'package:smart_university_app/utils/styles.dart';

class QuizTimerWidget extends ConsumerWidget {
  const QuizTimerWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final seconds = ref.watch(quizTimerProvider);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: const Color(0xFFE9E8E8),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        formatTime2(seconds),
        style: TextStyles.textstyle16.copyWith(color: Colors.purple),
      ),
    );
  }
}
