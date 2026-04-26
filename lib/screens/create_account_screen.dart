import 'package:flutter/material.dart';
import 'package:smart_university_app/widgets/create_account_body.dart';

class CreateAccountScreen extends StatelessWidget {
  const CreateAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CreateAccountBody(),
      resizeToAvoidBottomInset: true,
    );
  }
}
