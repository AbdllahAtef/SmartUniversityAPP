import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_university_app/widgets/create_account_header.dart';
import 'package:smart_university_app/widgets/custom_elevated_button.dart';
import 'package:smart_university_app/widgets/custom_text_form_field.dart';
import 'package:smart_university_app/widgets/faculty_dropdown.dart';
import 'package:smart_university_app/widgets/role_selector.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_university_app/providers/create_account_provider.dart';

class CreateAccountBody extends ConsumerStatefulWidget {
  const CreateAccountBody({super.key});

  @override
  ConsumerState<CreateAccountBody> createState() => _CreateAccountBodyState();
}

class _CreateAccountBodyState extends ConsumerState<CreateAccountBody> {
  @override
  Widget build(BuildContext context) {
    final state = ref.watch(createAccountProvider);
    final notifier = ref.read(createAccountProvider.notifier);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.0.w, vertical: 30.h),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CreateAccountHeader(),
            SizedBox(height: 40.h),
            const CustomTextFormField(isPassword: false, hint: 'UserName'),
            SizedBox(height: 15.h),
            const CustomTextFormField(isPassword: false, hint: 'Email'),
            SizedBox(height: 15.h),
            const CustomTextFormField(isPassword: false, hint: 'Id' ,isID: true),
            SizedBox(height: 15.h),
            const CustomTextFormField(isPassword: true, hint: 'Password'),
            SizedBox(height: 15.h),
            const CustomTextFormField(
              isPassword: true,
              hint: 'Retype Password',
            ),
            
            const SizedBox(height: 30),
            RoleSelector(
              selectedRole: state.role ?? '',
              onChanged: (value) {
                notifier.changeRole(value);
              },
            ),
            if (state.role == "Student") ...[
              const SizedBox(height: 30),
              FacultyDropdown(
                selectedFaculty: state.faculty,
                onChanged: (value) {
                  notifier.changeFaculty(value);
                },
              ),
            ],
            SizedBox(height: 50.h),
            CustomElevatedButton(onPressed: () {}, text: 'Continue'),
          ],
        ),
      ),
    );
  }
}
