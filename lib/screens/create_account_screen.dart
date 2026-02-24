import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_university_app/widgets/create_account_header.dart';
import 'package:smart_university_app/widgets/custom_elevated_button.dart';
import 'package:smart_university_app/widgets/custom_text_form_field.dart';
import 'package:smart_university_app/widgets/faculty_dropdown.dart';
import 'package:smart_university_app/widgets/role_selector.dart';

class CreateAccountScreen extends StatefulWidget {
  const CreateAccountScreen({super.key});

  @override
  State<CreateAccountScreen> createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  String selectedRole = "Student";
  String? selectedFaculty;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
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
                SizedBox(height: 50.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
