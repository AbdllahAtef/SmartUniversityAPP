import 'package:flutter/material.dart';
import 'package:smart_university_app/core/styles/styles.dart';
import 'package:smart_university_app/features/create_account/presentation/views/screens/create_account_screen.dart';

class SignUpButton extends StatelessWidget {
  const SignUpButton({super.key});

  @override
  Widget build(BuildContext context) {
    final primary = Theme.of(context).colorScheme.primary;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Don\'t have an account? ',
          style: TextStyles.textstyle16.copyWith(
            color: primary,
            fontWeight: FontWeight.w500,
          ),
        ),
        TextButton(
          style: TextButton.styleFrom(
            padding: EdgeInsets.zero,
            minimumSize: Size.zero,
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ).merge(Theme.of(context).textButtonTheme.style),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute<void>(
                builder: (_) => const CreateAccountScreen(),
              ),
            );
          },
          child: Text(
            'Sign Up',
            style: TextStyles.textstyle16.copyWith(
              color: const Color.fromARGB(255, 255, 0, 0),
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}
