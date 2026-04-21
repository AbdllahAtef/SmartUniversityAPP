import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_university_app/features/home/view_model/home_shell_view_model.dart';
import 'package:smart_university_app/core/styles/styles.dart';
import 'package:smart_university_app/features/schedule/presentation/views/widgets/session_card.dart';

class TodaysClasses extends ConsumerWidget {
  const TodaysClasses({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Today's Classes",
                style: TextStyles.textstyle18.copyWith(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                ),
              ),
              TextButton(
                onPressed: () {
                  ref.read(bottomNavProvider.notifier).state = 2;
                },
                style: TextButton.styleFrom(
                  padding: EdgeInsets.zero,
                  minimumSize: const Size(0, 0),
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
                child: Row(
                  children: [
                    Text(
                      "Open Schedule",
                      style: TextStyles.textstyle14.copyWith(
                        color: const Color(0XFF8B2072),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(width: 5),
                    Icon(
                      Icons.arrow_forward_ios,
                      size: 15.sp,
                      color: const Color.fromARGB(255, 189, 189, 189),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 30),
          const SessionCard(),
        ],
      ),
    );
  }
}
