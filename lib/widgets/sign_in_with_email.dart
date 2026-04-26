import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_university_app/providers/login_provider.dart';
import 'package:smart_university_app/providers/login_state.dart';
import 'package:smart_university_app/screens/home_screen.dart';
import 'package:smart_university_app/utils/auth_validation.dart';
import 'package:smart_university_app/utils/styles.dart';
import 'package:smart_university_app/widgets/custom_elevated_button.dart';
import 'package:smart_university_app/widgets/custom_text_form_field.dart';
import 'package:smart_university_app/widgets/sign_up_button.dart';

class SignInWithEmail extends ConsumerWidget {
  const SignInWithEmail({super.key});

  static final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(loginProvider);
    final notifier = ref.read(loginProvider.notifier);

    ref.listen<LoginState>(loginProvider, (previous, next) {
      if (next.error != null && next.error != previous?.error) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(next.error!)));
      }
    });

    return Expanded(
      child: Form(
        key: _formKey,
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
                validator: AuthValidation.validateEmail,
              ),

              SizedBox(height: 10.h),

              CustomTextFormField(
                isPassword: true,
                hint: 'Password',
                onChanged: notifier.updatePassword,
                validator: AuthValidation.validatePassword,
              ),

              SizedBox(height: 50.h),

              CustomElevatedButton(
                onPressed: state.isLoading
                    ? null
                    : () async {
                        if (!_formKey.currentState!.validate()) return;

                        final success = await notifier.login();

                        if (success) {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const HomeView(),
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
      ),
    );
  }
}
