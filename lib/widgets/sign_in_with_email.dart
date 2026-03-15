import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_university_app/screens/home_screen.dart';
import 'package:smart_university_app/utils/styles.dart';
import 'package:smart_university_app/widgets/custom_elevated_button.dart';
import 'package:smart_university_app/widgets/custom_text_form_field.dart';
import 'package:smart_university_app/widgets/sign_up_button.dart';

class SignInWithEmail extends StatelessWidget {
  const SignInWithEmail({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom + 20.h,
        ),
        child: Column(
          children: [
            SizedBox(height: 20.h),
            const CustomTextFormField(isPassword: false, hint: 'Email'),
            SizedBox(height: 10.h),
            const CustomTextFormField(isPassword: true, hint: 'Password'),
            SizedBox(height: 50.h),
            CustomElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const HomeView()),
                );
              },
              text: 'Log In',
            ),
            SizedBox(height: 20.h),
            TextButton(
              onPressed: () {},
              child: Text(
                'Forgot Password?',
                style: TextStyles.textstyle16.copyWith(
                  color: const Color(0xFF8B2072),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const SignUpButton(),
            SizedBox(height: 30.h),
          ],
        ),
      ),
    );
  }
}
