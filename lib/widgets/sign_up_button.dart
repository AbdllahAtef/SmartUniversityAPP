import 'package:flutter/material.dart';
import 'package:smart_university_app/utils/styles.dart';

class SignUpButton extends StatelessWidget {
  const SignUpButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Don\'t have an account? ',
          style: TextStyles.textstyle16.copyWith(
            color: const Color(0xFF8B2072),
            fontWeight: FontWeight.w500,
          ),
        ),
        TextButton(
          style: TextButton.styleFrom(
            padding: EdgeInsets.zero,
            minimumSize: Size.zero,
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
          onPressed: () {},
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
