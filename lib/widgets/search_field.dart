import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_university_app/providers/search_provide.dart';
import 'package:smart_university_app/utils/styles.dart';

class SearchField extends ConsumerWidget {
  const SearchField({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: TextField(
        onChanged: (value) {
          ref.read(searchProvider.notifier).state = value;
        },
        decoration: InputDecoration(
          hintText: 'Search',
          hintStyle: TextStyles.textstyle16.copyWith(
            color: Colors.grey.shade400,
          ),
          prefixIcon: Icon(
            Icons.search,
            color: Colors.grey.shade400,
            size: 25.sp,
          ),
          border: searchBorder(),
          enabledBorder: searchBorder(),
          focusedBorder: searchBorder(),
          errorBorder: searchBorder(),
          focusedErrorBorder: searchBorder(),
        ),
      ),
    );
  }

  OutlineInputBorder searchBorder() {
    return const OutlineInputBorder(
      borderSide: BorderSide(color: Color(0XFFCBCBCB), width: 1),
      borderRadius: BorderRadius.all(Radius.circular(8.0)),
    );
  }
}
