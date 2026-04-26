import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_university_app/providers/login_provider.dart';
import 'package:smart_university_app/screens/home_screen.dart';
import 'package:smart_university_app/utils/styles.dart';
import 'package:smart_university_app/utils/validator.dart';
import 'package:smart_university_app/widgets/custom_elevated_button.dart';
import 'package:smart_university_app/widgets/custom_text_form_field.dart';
import 'package:smart_university_app/widgets/sign_up_button.dart';

class SignInWithEmail extends ConsumerWidget {
  const SignInWithEmail({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(loginProvider);
    final notifier = ref.read(loginProvider.notifier);

    return Expanded(
      child: SingleChildScrollView(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom + 20.h,
        ),
        child: Column(
          children: [
            SizedBox(height: 20.h),

            CustomTextFormField(
              isPassword: false,
              hint: 'Email',
              onChanged: notifier.updateEmail,
              validator: Validators.email,
            ),

            SizedBox(height: 10.h),

            CustomTextFormField(
              isPassword: true,
              hint: 'Password',
              onChanged: notifier.updatePassword,
              validator: Validators.password,
            ),

            SizedBox(height: 50.h),

            CustomElevatedButton(
              onPressed: state.isLoading
                  ? null
                  : () async {
                      final success = await notifier.login();

                      if (success) {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const HomeView(),
                          ),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(state.error ?? "Login failed"),
                          ),
                        );
                      }
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
