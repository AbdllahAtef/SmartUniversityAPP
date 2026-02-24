import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_university_app/widgets/create_account_header.dart';
import 'package:smart_university_app/widgets/custom_elevated_button.dart';
import 'package:smart_university_app/widgets/custom_text_form_field.dart';
import 'package:smart_university_app/widgets/faculty_dropdown.dart';
import 'package:smart_university_app/widgets/role_selector.dart';

class CreateAccountBody extends StatefulWidget {
  const CreateAccountBody({super.key});

  @override
  State<CreateAccountBody> createState() => _CreateAccountBodyState();
}

class _CreateAccountBodyState extends State<CreateAccountBody> {
  String selectedRole = "Student";
  String? selectedFaculty;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.0.w, vertical: 30.h),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CreateAccountHeader(),
            SizedBox(height: 40.h),
            const CustomTextFormField(isPassword: false, hint: 'UserName'),
            SizedBox(height: 10.h),
            const CustomTextFormField(isPassword: false, hint: 'Email'),
            SizedBox(height: 10.h),
            const CustomTextFormField(isPassword: true, hint: 'Password'),
            SizedBox(height: 10.h),
            const CustomTextFormField(
              isPassword: true,
              hint: 'Retype Password',
            ),
            const SizedBox(height: 30),
            RoleSelector(
              selectedRole: selectedRole,
              onChanged: (value) {
                setState(() {
                  selectedRole = value;
                });
              },
            ),
            if (selectedRole == "Student") ...[
              const SizedBox(height: 30),
              FacultyDropdown(
                selectedFaculty: selectedFaculty,
                onChanged: (value) {
                  setState(() {
                    selectedFaculty = value;
                  });
                },
              ),
            ],
            SizedBox(height: 40.h),
            CustomElevatedButton(onPressed: () {}, text: 'Continue'),
          ],
        ),
      ),
    );
  }
}
