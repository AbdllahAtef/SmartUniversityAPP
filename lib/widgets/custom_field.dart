import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomField extends StatelessWidget {
  const CustomField({
    super.key,
    required this.label,
    this.controller,
    this.keyboardType,
    this.maxLines = 1,
    this.readOnly = false,
    this.suffixIcon,
    this.onTap,
  });

  final String label;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final int maxLines;
  final bool readOnly;
  final Widget? suffixIcon;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      maxLines: maxLines,
      readOnly: readOnly,
      onTap: onTap,
      decoration: InputDecoration(
        labelText: label,
        suffixIcon: suffixIcon,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12.r)),
      ),
    );
  }
}
