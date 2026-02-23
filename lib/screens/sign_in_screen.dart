import 'package:flutter/material.dart';
import 'package:smart_university_app/widgets/sign_in_body.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  const Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(child: SignInBody()));
  }
}