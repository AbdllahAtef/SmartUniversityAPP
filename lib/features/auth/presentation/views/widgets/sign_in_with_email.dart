import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_university_app/core/styles/styles.dart';
import 'package:smart_university_app/core/widgets/custom_elevated_button.dart';
import 'package:smart_university_app/core/widgets/custom_text_form_field.dart';
import 'package:smart_university_app/features/auth/model/auth_state.dart';
import 'package:smart_university_app/features/auth/presentation/views/widgets/sign_up_button.dart';
import 'package:smart_university_app/features/auth/view_model/auth_view_model.dart';

class SignInWithEmail extends ConsumerStatefulWidget {
  const SignInWithEmail({super.key});

  @override
  ConsumerState<SignInWithEmail> createState() => _SignInWithEmailState();
}

class _SignInWithEmailState extends ConsumerState<SignInWithEmail> {
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final auth = ref.watch(authViewModelProvider);
    final notifier = ref.read(authViewModelProvider.notifier);
    final isBusy = auth.status == AuthStatus.loading;

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
              controller: _emailController,
              errorText: auth.emailError,
              onChanged: (_) => notifier.clearEmailError(),
            ),
            SizedBox(height: 10.h),
            CustomTextFormField(
              isPassword: true,
              hint: 'Password',
              controller: _passwordController,
              errorText: auth.passwordError,
              onChanged: (_) => notifier.clearPasswordError(),
            ),
            SizedBox(height: 50.h),
            CustomElevatedButton(
              isLoading: isBusy,
              onPressed: isBusy
                  ? null
                  : () {
                      notifier.signInWithEmail(
                        _emailController.text,
                        _passwordController.text,
                      );
                    },
              text: 'Log In',
            ),
            SizedBox(height: 20.h),
            TextButton(
              onPressed: isBusy ? null : () {},
              child: Text(
                'Forgot Password?',
                style: TextStyles.textstyle16.copyWith(
                  color: Theme.of(context).colorScheme.primary,
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
