import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_university_app/widgets/custom_elevated_button.dart';

class SubmitAssignmentSection extends StatelessWidget {
  final AsyncValue state;
  final VoidCallback onSubmit;

  const SubmitAssignmentSection({
    super.key,
    required this.state,
    required this.onSubmit,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (state.isLoading) const CircularProgressIndicator(),

        if (state.hasError)
          Text(
            state.error.toString(),
            style: const TextStyle(color: Colors.red),
          ),

        CustomElevatedButton(
          onPressed: state.isLoading ? null : onSubmit,
          text: state.isLoading ? "Loading..." : "Create Assignment",
        ),
      ],
    );
  }
}
