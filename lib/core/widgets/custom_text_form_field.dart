import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_university_app/core/styles/styles.dart';

class CustomTextFormField extends StatefulWidget {
  const CustomTextFormField({
    super.key,
    required this.isPassword,
    required this.hint,
    this.isID = false,
    this.controller,
    this.onChanged,
    this.validator,
    this.errorText,
  });

  final bool isPassword;
  final bool isID;
  final String hint;
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  final String? Function(String?)? validator;
  final String? errorText;

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  late bool _obscureText;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.isPassword;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final inputTheme = theme.inputDecorationTheme;

    final decoration = InputDecoration(
      labelText: widget.hint,
      labelStyle: inputTheme.labelStyle ??
          TextStyles.textstyle16.copyWith(color: Colors.grey.shade400),
      errorText: widget.errorText,
      enabledBorder: inputTheme.enabledBorder,
      focusedBorder: inputTheme.focusedBorder,
      errorBorder: inputTheme.errorBorder,
      focusedErrorBorder: inputTheme.focusedErrorBorder,
      suffixIcon: widget.isPassword
          ? IconButton(
              icon: Icon(
                _obscureText ? Icons.visibility_off : Icons.visibility,
                color: const Color(0xFF949494),
                size: 27.sp,
              ),
              onPressed: () {
                setState(() {
                  _obscureText = !_obscureText;
                });
              },
            )
          : null,
    ).applyDefaults(inputTheme);

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: TextFormField(
        controller: widget.controller,
        onChanged: widget.onChanged,
        validator: widget.validator,
        keyboardType: widget.isID ? TextInputType.number : TextInputType.text,
        obscureText: _obscureText,
        style: theme.textTheme.bodyLarge?.copyWith(color: Colors.black),
        decoration: decoration,
      ),
    );
  }
}
