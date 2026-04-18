import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_university_app/providers/results_provider.dart';
import 'package:smart_university_app/utils/styles.dart';

class GradesDropdown extends ConsumerWidget {
  const GradesDropdown({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final grades = ref.watch(gradesListProvider);
    final selected = ref.watch(selectedGradeProvider);

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Grades:  ",
          style: TextStyles.textstyle18.copyWith(color: Colors.black),
        ),
        DropdownButtonHideUnderline(
          child: DropdownButton<String>(
            style: TextStyles.textstyle18.copyWith(color: Colors.purple),
            value: selected,
            icon: const Icon(Icons.keyboard_arrow_down),
            items: grades.map((e) {
              return DropdownMenuItem(
                value: e,
                child: Text(
                  e,
                  style: const TextStyle(
                    color: Colors.purple,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              );
            }).toList(),
            onChanged: (value) {
              ref.read(selectedGradeProvider.notifier).state = value!;
            },
          ),
        ),
      ],
    );
  }
}
