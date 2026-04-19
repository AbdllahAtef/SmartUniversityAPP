import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_university_app/utils/styles.dart';

class UniversalCard extends StatelessWidget {
  final String title;
  final String description;
  final String date;
  final String? extra;
  final IconData icon;
  final Color color;

  const UniversalCard({
    super.key,
    required this.title,
    required this.description,
    required this.date,
    this.extra,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.all(28),
      decoration: BoxDecoration(
        color: const Color(0xffF6F6F6),
        borderRadius: BorderRadius.circular(16),
        border: Border(
          left: BorderSide(color: color, width: 4.w),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(icon, color: color),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyles.textstyle16.copyWith(
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  description,
                  style: TextStyles.textstyle12.copyWith(color: Colors.grey),
                ),
                const SizedBox(height: 6),
                Row(
                  children: [
                    Text(
                      date,
                      style: TextStyles.textstyle12.copyWith(
                        color: Colors.grey,
                      ),
                    ),
                    if (extra != null) ...[
                      const SizedBox(width: 8),
                      Text(
                        extra!,
                        style: TextStyles.textstyle12.copyWith(color: color),
                      ),
                    ],
                  ],
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(24),
            ),
            child: icon == Icons.assignment
                ? const Icon(Icons.upload_file_outlined, color: Colors.white)
                : const Icon(Icons.start_sharp, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
