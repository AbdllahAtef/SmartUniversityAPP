import 'package:flutter/material.dart';
import 'package:smart_university_app/widgets/credits_texts.dart';
import 'package:smart_university_app/widgets/grades_dropdown.dart';
import 'package:smart_university_app/widgets/result_list_view.dart';

class ResultViewBody extends StatelessWidget {
  const ResultViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(padding: EdgeInsetsGeometry.all(16), child: GradesDropdown()),
        CreditsTexts(),
        ResultListView(),
      ],
    );
  }
}
