import 'package:flutter/material.dart';
import 'package:smart_university_app/utils/styles.dart';

class StatItem extends StatelessWidget {
  final double value;
  final String label;
  const StatItem({super.key, required this.value, required this.label});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          value.toString(),
          style: TextStyles.textstyle16.copyWith(
            color: const Color(0xFF8B2072),
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: TextStyles.textstyle16.copyWith(
            color: const Color(0xFF8B2072),
          ),
        ),
      ],
    );
  }
}
