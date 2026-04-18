import 'package:flutter/material.dart';
import 'package:smart_university_app/widgets/profile_header.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(32),
      child: Column(
        children: [
          ProfileHeader(name: "Abdllah", studentId: "st34_hj45_2333_30li"),
        ],
      ),
    );
  }
}
