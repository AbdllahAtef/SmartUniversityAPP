import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_university_app/core/styles/styles.dart';
import 'package:smart_university_app/core/utils/app_assets.dart';
import 'package:smart_university_app/features/auth/model/auth_state.dart';
import 'package:smart_university_app/features/auth/presentation/views/widgets/sign_in_with_email.dart';
import 'package:smart_university_app/features/auth/presentation/views/widgets/signin_with_button.dart';
import 'package:smart_university_app/features/auth/view_model/auth_view_model.dart';
import 'package:smart_university_app/features/home/presentation/views/screens/home_view_screen.dart';

class SignInBody extends ConsumerWidget {
  const SignInBody({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen<AuthState>(authViewModelProvider, (previous, next) {
      if (next.status == AuthStatus.success) {
        Navigator.of(context).push(
          MaterialPageRoute<void>(builder: (context) => const HomeView()),
        );
        ref.read(authViewModelProvider.notifier).resetAfterNavigation();
      }
      final msg = next.errorMessage;
      if (msg != null && next.status == AuthStatus.failure) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
        ref.read(authViewModelProvider.notifier).clearTransientMessage();
      }
    });

    final auth = ref.watch(authViewModelProvider);
    final notifier = ref.read(authViewModelProvider.notifier);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(height: 100.h),
        Text(
          'Welcome Back!\nSign in to continue!',
          style: TextStyles.textstyle24.copyWith(color: Colors.black),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 50.h),
        SigninWithButton(
          onPressed: auth.status == AuthStatus.loading
              ? null
              : () => notifier.signInWithGoogle(),
          text: 'Log in with Google',
          icon: Image.asset(
            AppAssets.google,
            width: 24.w,
            height: 24.h,
          ),
        ),
        SizedBox(height: 20.h),
        SigninWithButton(
          onPressed: auth.status == AuthStatus.loading
              ? null
              : () => notifier.signInWithFacebook(),
          text: 'Log in with Facebook',
          icon: Image.asset(
            AppAssets.facebook,
            width: 24.w,
            height: 24.h,
          ),
        ),
        SizedBox(height: 40.h),
        Text(
          'or',
          style: TextStyles.textstyle20.copyWith(
            color: const Color(0xFF949494).withValues(alpha: 0.5),
            fontWeight: FontWeight.w300,
          ),
        ),
        const SignInWithEmail(),
      ],
    );
  }
}
