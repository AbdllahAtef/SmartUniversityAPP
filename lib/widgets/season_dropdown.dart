import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_university_app/providers/results_provider.dart';
import 'package:smart_university_app/utils/styles.dart';

class SeasonDropdown extends ConsumerWidget {
  const SeasonDropdown({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final seasons = ref.watch(seasonsProvider);
    final selected = ref.watch(selectedSeasonProvider);

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
      decoration: BoxDecoration(
        color: const Color(0xFFF2F2F2),
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: selected,
          icon: const Icon(Icons.keyboard_arrow_down),
          style: TextStyles.textstyle14.copyWith(color: Colors.black),
          items: seasons.map((e) {
            return DropdownMenuItem(value: e, child: Text(e));
          }).toList(),
          onChanged: (value) {
            ref.read(selectedSeasonProvider.notifier).state = value!;
          },
        ),
      ),
    );
  }
}  