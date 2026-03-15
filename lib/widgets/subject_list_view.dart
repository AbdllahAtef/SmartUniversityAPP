import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_university_app/utils/mock_data.dart';
import 'package:smart_university_app/widgets/subject_card.dart';

class SubjectListView extends StatelessWidget {
  const SubjectListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120.h,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: 8.w),
        scrollDirection: Axis.horizontal,
        itemCount: mockSubjects.length,
        itemBuilder: (context, index) {
          return SubjectCard(subject: mockSubjects[index]);
        },
      ),
    );
  }
}
